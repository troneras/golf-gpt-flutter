#version 460 core

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float uTime;
uniform float uBorderRadius;
uniform float uBorderWidth;
uniform float uGlowPaddingH;
uniform float uGlowPaddingV;

out vec4 fragColor;

float roundedBoxSDF(vec2 center, vec2 size, float radius) {
    vec2 q = abs(center) - size + radius;
    return min(max(q.x, q.y), 0.0) + length(max(q, 0.0)) - radius;
}

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);
    return mix(mix(hash(i), hash(i + vec2(1.0, 0.0)), f.x),
               mix(hash(i + vec2(0.0, 1.0)), hash(i + vec2(1.0, 1.0)), f.x), f.y);
}

// Gentle smoke
float fbm(vec2 p) {
    float f = 0.0;
    float w = 0.5;
    for (int i = 0; i < 4; i++) {
        f += w * noise(p);
        p *= 2.0;
        w *= 0.5;
    }
    return f;
}

// Subtle particles (fewer, calmer)
float particles(vec2 uv, float time) {
    float p = 0.0;
    for (float i = 0.0; i < 8.0; i++) {
        vec2 seed = vec2(i * 123.456, i * 789.012);
        vec2 pos = vec2(
            hash(seed) * 1.6 - 0.8,
            mod(hash(seed + 1.0) - time * 0.08, 1.6) - 0.8
        );
        pos.x += sin(time * 1.5 + i * 0.7) * 0.05;
        float size = 0.008 + hash(seed + 3.0) * 0.012;
        float d = length(uv - pos);
        float brightness = hash(seed + 4.0) * 0.4 + 0.3;
        p += smoothstep(size, 0.0, d) * brightness;
    }
    return p;
}

void main() {
    vec2 fragCoord = FlutterFragCoord().xy;

    vec2 glowPadding = vec2(uGlowPaddingH, uGlowPaddingV);
    vec2 buttonSize = uSize - glowPadding * 2.0;
    vec2 center = fragCoord - uSize * 0.5;
    vec2 uv = center / (buttonSize * 0.5);

    float dist = roundedBoxSDF(center, buttonSize * 0.5, uBorderRadius);
    float maxGlowDist = min(uGlowPaddingH, uGlowPaddingV);

    // === COLORS (clean cyan palette, reduced ~12% intensity) ===
    vec3 cyanBright = vec3(0.0, 0.82, 0.87);
    vec3 cyanMid = vec3(0.0, 0.6, 0.78);
    vec3 cyanDeep = vec3(0.0, 0.35, 0.52);
    vec3 white = vec3(1.0);

    // Smooth breathing (with bright peak)
    float breathe = sin(uTime * 1.2) * 0.5 + 0.5;
    float breatheBright = pow(breathe, 0.5); // Brighter peaks
    float gentlePulse = sin(uTime * 3.0) * 0.5 + 0.5;

    vec3 color = vec3(0.0);
    float alpha = 0.0;

    // === OUTER GLOW (soft, elegant, with bright peaks) ===
    if (dist > 0.0) {
        float glow = exp(-dist * 0.05);
        float glowIntensity = glow * (0.6 + breatheBright * 0.5);

        // Add white during bright peaks
        vec3 glowColor = mix(cyanMid, white, breatheBright * 0.4);
        color = glowColor * glowIntensity;
        alpha = glowIntensity * 0.6;

        // Fade at canvas edge
        alpha *= smoothstep(maxGlowDist, 0.0, dist);
    }

    // === INNER GLASS (subtle smoke + particles) ===
    if (dist < 0.0) {
        float innerDist = -dist;

        // Dark glass base
        vec3 glassColor = vec3(0.02, 0.05, 0.1);
        float glassAlpha = 0.7;

        // Gentle smoke wisps
        vec2 smokeUV = uv;
        smokeUV.y -= uTime * 0.08;
        float smoke = fbm(smokeUV * 1.5 + uTime * 0.1);
        smoke = smoke * 0.25;

        // Floating particles
        float pts = particles(uv, uTime);

        // Inner glow from border (the "energy" feel)
        float innerGlow = exp(-innerDist * 0.07);
        float glowStrength = innerGlow * (0.5 + breatheBright * 0.5);

        // Combine
        color = glassColor;
        color += cyanDeep * smoke * 0.5;
        color += cyanBright * pts * 0.5;
        // Add white to inner glow during bright peaks
        vec3 innerGlowColor = mix(cyanMid, white, breatheBright * 0.5);
        color += innerGlowColor * glowStrength;

        alpha = glassAlpha;
        alpha += innerGlow * 0.2;
    }

    // === NEON BORDER (refined, thinner, white-hot core) ===
    float borderDist = abs(dist);

    if (borderDist < 4.0) {
        // Soft outer glow (reduced range)
        float outerGlow = smoothstep(4.0, 1.5, borderDist) * 0.45;

        // Main neon line (thinner)
        float neonLine = smoothstep(1.5, 0.4, borderDist);

        // White-hot core (narrower)
        float hotCore = smoothstep(0.6, 0.0, borderDist);

        // Subtle energy flow around border
        float flow = sin(atan(center.y, center.x) * 3.0 - uTime * 2.5) * 0.5 + 0.5;
        flow = pow(flow, 3.0) * neonLine * 0.2;

        // Occasional subtle sparkle
        float sparkle = noise(fragCoord * 0.12 + uTime * 1.5);
        sparkle = pow(sparkle, 6.0) * neonLine * 0.6;

        // Build neon color
        vec3 neonColor = cyanMid * outerGlow;
        neonColor = mix(neonColor, cyanBright, neonLine);
        neonColor = mix(neonColor, white, hotCore * 0.9);
        neonColor += cyanBright * flow;
        neonColor += white * sparkle;

        // Bright pulse - goes whiter at peaks
        float brightPulse = 0.85 + breatheBright * 0.4;
        neonColor *= brightPulse;
        // Extra white bloom during peaks
        neonColor = mix(neonColor, white * 1.2, breatheBright * hotCore * 0.5);

        float neonAlpha = max(outerGlow, neonLine);
        neonAlpha = max(neonAlpha, hotCore);

        color = mix(color, neonColor, neonAlpha);
        alpha = mix(alpha, 1.0, neonAlpha);
    }

    fragColor = vec4(color * alpha, alpha);
}

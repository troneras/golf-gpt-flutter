# TalkCaddy Design System

A premium, dark-themed design system with matte glassmorphism. The visual language is **elegant, focused, and functional** — inspired by high-end golf equipment and luxury automotive interfaces.

---

## Core Principles

### 1. Glass is Hierarchical, Not Global
Glassmorphism intensity varies by screen purpose:

| Screen Type | Glass Level | Example |
|-------------|-------------|---------|
| **Emotional** (wow factor) | High | Home screen |
| **Decisional** (user choosing) | Medium-Low | Course selection |
| **Operational** (user doing) | Minimal | Round in progress |

**Rule**: Ask yourself — *"Is the user enjoying or deciding?"*
- Enjoying → more glass
- Deciding → less glass

### 2. Dark First
Everything is built on a dark foundation. Light elements are accents, not backgrounds.

### 3. Subtle Over Flashy
Effects should feel like *"this floats slightly"*, not *"look at this effect"*.

---

## Color Palette

### Base Colors
```dart
// Background hierarchy
background:      #0D1117  // Deepest dark
surface:         #141A24  // Card backgrounds (glass base)
elevated:        #162033  // Elevated surfaces

// Primary accent (cyan/teal)
primary:         #00D4DE  // Main accent color
primaryMuted:    #00A0A8  // Subdued accent
```

### Glass Colors
```dart
// Glass backgrounds (applied with alpha)
glassBg:         #141A24  // Base for glass effect
glassBorder:     #FFFFFF  // White borders with low alpha

// Alpha levels
glassBgAlpha:    0.85-0.90  // Background opacity
glassBorderAlpha: 0.06-0.08  // Border opacity
```

### Text Hierarchy
```dart
textPrimary:     #FFFFFF @ 100%   // Headlines, important
textSecondary:   #FFFFFF @ 70%    // Body text
textTertiary:    #FFFFFF @ 50%    // Captions, hints
textDisabled:    #FFFFFF @ 30%    // Disabled states
```

### Semantic Colors
```dart
// Status colors (muted, not alarming)
success:         #6BCF9B  // Muted green
warning:         #B8956A  // Muted amber (contextual, not alert)
error:           #CF6B6B  // Muted red
```

---

## Glassmorphism Tokens

### Level 1: Matte Glass (Default)
For most cards and containers in decisional/operational screens.

```dart
Container(
  decoration: BoxDecoration(
    color: const Color(0xFF141A24).withValues(alpha: 0.85),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.white.withValues(alpha: 0.06),
    ),
  ),
)
```

**Properties:**
- Background: `#141A24` @ 85% alpha
- Border: white @ 6% alpha
- Blur: None (or very subtle, 2-3px)
- Border radius: 12px

### Level 2: Prominent Glass
For main context cards (e.g., selected course, primary info).

```dart
Container(
  decoration: BoxDecoration(
    color: const Color(0xFF141A24).withValues(alpha: 0.90),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.white.withValues(alpha: 0.08),
    ),
  ),
)
```

**Properties:**
- Background: `#141A24` @ 90% alpha
- Border: white @ 8% alpha
- Blur: None to subtle (3-6px)
- Border radius: 12px

### Level 3: Showcase Glass (Home only)
For emotional/wow screens. Uses the `SuggestionCard` style.

```dart
Container(
  decoration: BoxDecoration(
    color: colors.glassBg,  // Theme glassBg
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: colors.glassBorder),
  ),
  child: Stack(
    children: [
      // Inset shadow overlay
      Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withValues(alpha: 0.3),
                Colors.black.withValues(alpha: 0.1),
                Colors.transparent,
              ],
              stops: const [0.0, 0.3, 0.6],
            ),
          ),
        ),
      ),
      // Content here
    ],
  ),
)
```

**Properties:**
- Background: theme `glassBg`
- Border: theme `glassBorder`
- Inset shadow: diagonal gradient overlay
- Border radius: 16px

---

## Components

### Buttons

#### Primary CTA (Enabled)
```dart
Container(
  height: 52,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        context.colors.primary.withValues(alpha: 0.9),
        context.colors.primary,
      ],
    ),
    boxShadow: [
      BoxShadow(
        color: context.colors.primary.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  ),
)
```

#### Primary CTA (Disabled)
```dart
Container(
  height: 52,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white.withValues(alpha: 0.08),
  ),
  // Text: white @ 30%
)
```

#### Ghost Button (Secondary)
```dart
Container(
  height: 52,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: Colors.white.withValues(alpha: 0.15),
    ),
  ),
  // Text: white @ 70%
)
```

#### GlowButton (Home CTA)
Uses custom GLSL shader (`shaders/glow_button.frag`).
- Animated neon border
- Breathing glow effect
- Inner glass with particles
- Reserved for Home screen only

### Cards

#### Selection Card (e.g., Tee selection)
```dart
// Unselected
border: Colors.white.withValues(alpha: 0.06)

// Selected
border: context.colors.primary.withValues(alpha: 0.6)
// Add check icon when selected
```

#### Info Card (e.g., Course card)
- Slightly more prominent glass (Level 2)
- Chevron for navigation hint
- Primary color for action text

### Navigation

#### Bottom Navigation
```dart
Container(
  decoration: BoxDecoration(
    color: context.colors.background.withValues(alpha: 0.85),
    border: Border(
      top: BorderSide(
        color: Colors.white.withValues(alpha: 0.06),
      ),
    ),
  ),
)

// Active item: primary color
// Inactive item: white @ 25% (almost invisible - focus mode)
```

### Switches & Toggles
```dart
Switch(
  activeTrackColor: context.colors.primary.withValues(alpha: 0.5),
  activeThumbColor: context.colors.primary,
  inactiveTrackColor: Colors.white.withValues(alpha: 0.1),
  inactiveThumbColor: Colors.white.withValues(alpha: 0.4),
)
```

---

## Typography

### Scale
| Style | Size | Weight | Usage |
|-------|------|--------|-------|
| displayLarge | 32 | 600 | App title (Home) |
| headlineSmall | 24 | 600 | Screen titles |
| titleLarge | 20 | 600 | Section headers |
| titleMedium | 16 | 600 | Card titles |
| titleSmall | 14 | 600 | List item titles |
| bodyLarge | 16 | 400 | Body text |
| bodyMedium | 14 | 400 | Secondary body |
| bodySmall | 12 | 400 | Captions |
| labelSmall | 11 | 400-500 | Nav labels, chips |

### Color Application
```dart
// Headlines & titles
color: Colors.white  // or white @ 90%

// Body text
color: Colors.white.withValues(alpha: 0.7)

// Secondary/hint text
color: Colors.white.withValues(alpha: 0.5)

// Disabled text
color: Colors.white.withValues(alpha: 0.3)
```

---

## Animations

### Timing
| Type | Duration | Curve |
|------|----------|-------|
| Micro (opacity, color) | 200ms | ease |
| Standard (size, position) | 300ms | easeInOut |
| Emphasis (entrance) | 400-500ms | easeOut |

### Effects

#### Breathing/Pulse (GlowButton)
```glsl
float breathe = sin(uTime * 1.2) * 0.5 + 0.5;
```
- Slow, organic feel
- 1.2 Hz frequency

#### Typewriter (Suggestions)
- 50ms per character (typing)
- 20ms per character (erasing)
- 3s pause between suggestions

#### Fade Transitions
```dart
AnimatedOpacity(
  duration: const Duration(milliseconds: 200),
  opacity: isVisible ? 1.0 : 0.0,
)
```

---

## Spacing

### Base Unit: 4px

| Token | Value | Usage |
|-------|-------|-------|
| xs | 4px | Tight spacing |
| sm | 8px | Related elements |
| md | 12px | Standard gap |
| lg | 16px | Section padding |
| xl | 24px | Between sections |
| xxl | 32px | Major separations |

### Card Padding
- Standard: 12-16px
- Compact: 8-12px

### Screen Padding
- Horizontal: 16-24px
- Top: varies by content

---

## Shadows

### Subtle Glow (CTAs)
```dart
BoxShadow(
  color: context.colors.primary.withValues(alpha: 0.3),
  blurRadius: 12,
  offset: const Offset(0, 4),
)
```

### Inset Shadow (Glass cards)
Use gradient overlay instead of actual shadow:
```dart
LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Colors.black.withValues(alpha: 0.3),
    Colors.black.withValues(alpha: 0.1),
    Colors.transparent,
  ],
  stops: const [0.0, 0.3, 0.6],
)
```

### Vignette (Full-screen backgrounds)
```dart
RadialGradient(
  radius: 1.0,
  colors: [
    Colors.transparent,
    Colors.transparent,
    Colors.black.withValues(alpha: 0.25),
    Colors.black.withValues(alpha: 0.45),
  ],
  stops: const [0.0, 0.45, 0.75, 1.0],
)
```

---

## Icons

### Style
- Use Material Icons (filled preferred for active, outlined for inactive)
- Size: 20-24px for UI, 48px for empty states

### Colors
```dart
// Active/Primary
color: context.colors.primary

// Default
color: Colors.white.withValues(alpha: 0.6)

// Disabled
color: Colors.white.withValues(alpha: 0.3)

// Warning (muted)
color: const Color(0xFFB8956A)
```

---

## Do's and Don'ts

### Do
- Use matte glass consistently across similar components
- Keep warnings contextual, not alarming (muted colors)
- Make inactive elements almost invisible in focus mode
- Use primary color sparingly for emphasis
- Add subtle glow to enabled CTAs

### Don't
- Don't use bright/saturated warning colors (orange, yellow)
- Don't add blur to every glass element (performance)
- Don't use white backgrounds anywhere
- Don't make inactive nav items compete with active
- Don't use the GlowButton shader outside Home screen
- Don't add reflections or animated effects to operational screens

---

## Screen-by-Screen Guide

### Home Screen
- **Glass level**: High (showcase)
- **Effects**: GlowButton, shooting stars, suggestion card with typewriter
- **Bottom nav**: Focus mode (inactive items almost invisible)

### Course Selection
- **Glass level**: Medium-low (matte)
- **Effects**: Subtle glow on enabled CTA only
- **Cards**: Dark smoked glass, no blur

### Round in Progress
- **Glass level**: Minimal
- **Effects**: None (operational focus)
- **Priority**: Readability and quick scanning

### Settings / Lists
- **Glass level**: Low to none
- **Style**: Clean, functional, minimal decoration

---

## Implementation Checklist

When styling a new screen:

1. [ ] Determine screen type (emotional/decisional/operational)
2. [ ] Choose appropriate glass level
3. [ ] Apply correct text opacity hierarchy
4. [ ] Style buttons (primary/ghost/disabled states)
5. [ ] Check selection states use primary color subtly
6. [ ] Verify inactive elements don't compete
7. [ ] Test on dark background
8. [ ] Remove any bright/saturated colors

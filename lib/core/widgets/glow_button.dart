import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// A premium glow button with animated rainbow gradient border and color-matched glows.
/// Uses a custom fragment shader for the effect.
class GlowButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;

  const GlowButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.height = 60,
  });

  @override
  State<GlowButton> createState() => _GlowButtonState();
}

class _GlowButtonState extends State<GlowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ui.FragmentShader? _shader;
  bool _shaderFailed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _loadShader();
  }

  Future<void> _loadShader() async {
    try {
      final program =
          await ui.FragmentProgram.fromAsset('shaders/glow_button.frag');
      if (mounted) {
        setState(() {
          _shader = program.fragmentShader();
        });
      }
    } catch (e) {
      debugPrint('Failed to load glow button shader: $e');
      if (mounted) {
        setState(() {
          _shaderFailed = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fallback if shader fails to load
    if (_shaderFailed) {
      return _FallbackButton(
        text: widget.text,
        icon: widget.icon,
        onPressed: widget.onPressed,
        isLoading: widget.isLoading,
        height: widget.height,
      );
    }

    // Padding for glow (vertical only to match container width)
    const glowPaddingV = 20.0;
    const glowPaddingH = 4.0;

    return GestureDetector(
      onTap: widget.isLoading ? null : widget.onPressed,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _GlowButtonPainter(
              shader: _shader,
              time: _controller.value * 20,
              glowPaddingH: glowPaddingH,
              glowPaddingV: glowPaddingV,
            ),
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: glowPaddingH,
            vertical: glowPaddingV,
          ),
          child: SizedBox(
            width: double.infinity,
            height: widget.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.isLoading)
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                else ...[
                  if (widget.icon != null) ...[
                    Icon(widget.icon, color: Colors.white, size: 28),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GlowButtonPainter extends CustomPainter {
  final ui.FragmentShader? shader;
  final double time;
  final double glowPaddingH;
  final double glowPaddingV;

  _GlowButtonPainter({
    this.shader,
    required this.time,
    this.glowPaddingH = 0,
    this.glowPaddingV = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (shader == null) return;

    shader!
      ..setFloat(0, size.width) // uSize.x
      ..setFloat(1, size.height) // uSize.y
      ..setFloat(2, time) // uTime
      ..setFloat(3, 18.0) // uBorderRadius
      ..setFloat(4, 2.0) // uBorderWidth
      ..setFloat(5, glowPaddingH) // uGlowPaddingH
      ..setFloat(6, glowPaddingV); // uGlowPaddingV

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(_GlowButtonPainter oldDelegate) =>
      oldDelegate.time != time || oldDelegate.shader != shader;
}

/// Fallback button when shader fails to load
class _FallbackButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;

  const _FallbackButton({
    required this.text,
    this.icon,
    this.onPressed,
    this.isLoading = false,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    const neonBlue = Color(0xFF5AA9FF);
    const accentGreen = Color(0xFF6BCF9B);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: neonBlue.withValues(alpha: 0.5),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              neonBlue.withValues(alpha: 0.5),
              accentGreen.withValues(alpha: 0.5),
            ],
          ),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.4),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            borderRadius: BorderRadius.circular(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading)
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                else ...[
                  if (icon != null) ...[
                    Icon(icon, color: Colors.white, size: 28),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

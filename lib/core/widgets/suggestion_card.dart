import 'dart:async';
import 'dart:math' as math;

import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

/// Model for a suggestion
class Suggestion {
  final String action;
  final String text;

  const Suggestion({
    required this.action,
    required this.text,
  });
}

/// Default suggestions to rotate through
const _defaultSuggestions = [
  Suggestion(
    action: 'Pregunta:',
    text: '¿A qué distancia está el green?',
  ),
  Suggestion(
    action: 'Pregunta:',
    text: '¿Qué palo me recomiendas?',
  ),
  Suggestion(
    action: 'Di:',
    text: 'Apunta mi puntuación: 4 golpes',
  ),
  Suggestion(
    action: 'Pregunta:',
    text: '¿Cuál es el par de este hoyo?',
  ),
  Suggestion(
    action: 'Pregunta:',
    text: '¿Dónde está el bunker?',
  ),
  Suggestion(
    action: 'Di:',
    text: 'Cambio de hoyo',
  ),
  Suggestion(
    action: 'Pregunta:',
    text: '¿Cómo voy en el marcador?',
  ),
  Suggestion(
    action: 'Di:',
    text: 'Hice birdie en este hoyo',
  ),
];

/// Animated suggestion card with typewriter effect and voice waveform
class SuggestionCard extends StatefulWidget {
  final List<Suggestion> suggestions;
  final Duration typeSpeed;
  final Duration pauseDuration;

  const SuggestionCard({
    super.key,
    this.suggestions = _defaultSuggestions,
    this.typeSpeed = const Duration(milliseconds: 50),
    this.pauseDuration = const Duration(seconds: 3),
  });

  @override
  State<SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  int _currentIndex = 0;
  int _visibleCharacters = 0;
  Timer? _typeTimer;
  Timer? _pauseTimer;
  bool _isTyping = false;
  bool _isErasing = false;
  String _displayedAction = '';
  double _actionOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _displayedAction = widget.suggestions[_currentIndex].action;
    _startTypewriter();
  }

  void _startTypewriter() {
    _typeTimer?.cancel();
    _pauseTimer?.cancel();
    _visibleCharacters = 0;
    _isTyping = true;
    _isErasing = false;

    final text = widget.suggestions[_currentIndex].text;

    _typeTimer = Timer.periodic(widget.typeSpeed, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_visibleCharacters < text.length) {
        setState(() {
          _visibleCharacters++;
        });
      } else {
        timer.cancel();
        setState(() {
          _isTyping = false;
        });
        // Pause before moving to next suggestion
        _pauseTimer = Timer(widget.pauseDuration, _eraseAndNext);
      }
    });
  }

  void _eraseAndNext() {
    if (!mounted) return;

    setState(() {
      _isErasing = true;
    });

    // Quick erase effect
    _typeTimer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_visibleCharacters > 0) {
        setState(() {
          _visibleCharacters--;
        });
      } else {
        timer.cancel();
        final nextIndex = (_currentIndex + 1) % widget.suggestions.length;
        final nextAction = widget.suggestions[nextIndex].action;
        final currentAction = widget.suggestions[_currentIndex].action;

        // If action changes, fade out then fade in
        if (nextAction != currentAction) {
          _animateActionChange(nextIndex, nextAction);
        } else {
          setState(() {
            _currentIndex = nextIndex;
            _isErasing = false;
          });
          _startTypewriter();
        }
      }
    });
  }

  void _animateActionChange(int nextIndex, String nextAction) {
    // Fade out
    setState(() {
      _actionOpacity = 0.0;
    });

    // After fade out, change action and fade in
    Future.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) return;
      setState(() {
        _displayedAction = nextAction;
        _currentIndex = nextIndex;
        _isErasing = false;
        _actionOpacity = 1.0;
      });
      _startTypewriter();
    });
  }

  @override
  void dispose() {
    _typeTimer?.cancel();
    _pauseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final suggestion = widget.suggestions[_currentIndex];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.glassBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.glassBorder),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Inset shadow effect - top and left darker
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
            // Content
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row with action label and dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _actionOpacity,
                        child: Text(
                          _displayedAction,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: colors.textTertiary,
                          ),
                        ),
                      ),
                      // Pagination dots
                      _PaginationDots(
                        count: widget.suggestions.length,
                        currentIndex: _currentIndex,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Typewriter suggestion text with voice waveform
                  _TypewriterText(
                    text: suggestion.text,
                    visibleCharacters: _visibleCharacters,
                    isTyping: _isTyping,
                    isErasing: _isErasing,
                  ),
                  const SizedBox(height: 2),
                  // Reflection
                  _ReflectionText(
                    text: suggestion.text,
                    visibleCharacters: _visibleCharacters,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The main suggestion text with typewriter effect
class _TypewriterText extends StatelessWidget {
  final String text;
  final int visibleCharacters;
  final bool isTyping;
  final bool isErasing;

  const _TypewriterText({
    required this.text,
    required this.visibleCharacters,
    required this.isTyping,
    required this.isErasing,
  });

  @override
  Widget build(BuildContext context) {
    final visibleText = visibleCharacters <= text.length
        ? text.substring(0, visibleCharacters)
        : text;

    return Row(
      children: [
        Expanded(
          child: Text(
            visibleText,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Voice waveform cursor
        _VoiceWaveform(
          isTyping: isTyping,
          isErasing: isErasing,
        ),
      ],
    );
  }
}

/// Voice waveform visualizer that replaces the cursor
class _VoiceWaveform extends StatefulWidget {
  final bool isTyping;
  final bool isErasing;

  const _VoiceWaveform({
    required this.isTyping,
    required this.isErasing,
  });

  @override
  State<_VoiceWaveform> createState() => _VoiceWaveformState();
}

class _VoiceWaveformState extends State<_VoiceWaveform>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          size: const Size(24, 18),
          painter: _VoiceWaveformPainter(
            progress: _controller.value,
            isTyping: widget.isTyping,
            isErasing: widget.isErasing,
          ),
        );
      },
    );
  }
}

/// Custom painter for the voice waveform
class _VoiceWaveformPainter extends CustomPainter {
  final double progress;
  final bool isTyping;
  final bool isErasing;

  _VoiceWaveformPainter({
    required this.progress,
    required this.isTyping,
    required this.isErasing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const barCount = 5;
    final barWidth = size.width / (barCount * 2 - 1);
    final maxHeight = size.height;
    final minHeight = size.height * 0.2;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    // Glow paint
    final glowPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withValues(alpha: 0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    for (int i = 0; i < barCount; i++) {
      // Each bar has its own phase offset
      final phase = i * math.pi / barCount;
      final animValue = math.sin(progress * math.pi * 2 + phase);

      double heightFactor;
      if (isTyping) {
        // Active typing: vigorous animation with varying heights
        heightFactor = 0.4 + animValue.abs() * 0.6;
        // Middle bars are generally taller
        final middleFactor = 1.0 - (i - barCount / 2).abs() / (barCount / 2) * 0.3;
        heightFactor *= middleFactor;
      } else if (isErasing) {
        // Erasing: fast, declining animation
        heightFactor = 0.3 + animValue.abs() * 0.4;
      } else {
        // Idle: gentle breathing
        heightFactor = 0.15 + animValue.abs() * 0.15;
      }

      final barHeight =
          minHeight + (maxHeight - minHeight) * heightFactor.clamp(0.0, 1.0);
      final x = i * barWidth * 2;
      final y = (size.height - barHeight) / 2;

      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        const Radius.circular(2),
      );

      // Draw glow when active
      if (isTyping || isErasing) {
        canvas.drawRRect(rect, glowPaint);
      }

      // Draw bar with opacity based on activity
      final opacity = isTyping ? 1.0 : (isErasing ? 0.8 : 0.6);
      paint.color = Colors.white.withValues(alpha: opacity);
      canvas.drawRRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(_VoiceWaveformPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.isTyping != isTyping ||
      oldDelegate.isErasing != isErasing;
}

/// Mirrored reflection of the text
class _ReflectionText extends StatelessWidget {
  final String text;
  final int visibleCharacters;

  const _ReflectionText({
    required this.text,
    required this.visibleCharacters,
  });

  @override
  Widget build(BuildContext context) {
    final visibleText = visibleCharacters <= text.length
        ? text.substring(0, visibleCharacters)
        : text;

    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.diagonal3Values(1.0, -1.0, 1.0),
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: 0.2),
            Colors.transparent,
          ],
          stops: const [0.0, 0.5],
        ).createShader(bounds),
        blendMode: BlendMode.dstIn,
        child: Text(
          visibleText,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white.withValues(alpha: 0.1),
          ),
        ),
      ),
    );
  }
}

/// Pagination dots indicator
class _PaginationDots extends StatelessWidget {
  final int count;
  final int currentIndex;

  const _PaginationDots({
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(left: 3),
          width: isActive ? 4 : 3,
          height: isActive ? 4 : 3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: isActive ? 0.35 : 0.25),
          ),
        );
      }),
    );
  }
}

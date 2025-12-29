import 'dart:async';

import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

/// Model for a suggestion
class Suggestion {
  final String prefix;
  final String highlighted;

  const Suggestion({
    required this.prefix,
    required this.highlighted,
  });

  String get fullText => prefix + highlighted;
}

/// Default suggestions to rotate through
const _defaultSuggestions = [
  Suggestion(
    prefix: 'Pregunta, ',
    highlighted: '"¿A qué distancia está el green?"',
  ),
  Suggestion(
    prefix: 'Pregunta, ',
    highlighted: '"¿Qué palo me recomiendas?"',
  ),
  Suggestion(
    prefix: 'Dile, ',
    highlighted: '"Apunta mi puntuación: 4 golpes"',
  ),
  Suggestion(
    prefix: 'Pregunta, ',
    highlighted: '"¿Cuál es el par de este hoyo?"',
  ),
  Suggestion(
    prefix: 'Pregunta, ',
    highlighted: '"¿Dónde está el bunker?"',
  ),
  Suggestion(
    prefix: 'Dile, ',
    highlighted: '"Cambio de hoyo"',
  ),
  Suggestion(
    prefix: 'Pregunta, ',
    highlighted: '"¿Cómo voy en el marcador?"',
  ),
  Suggestion(
    prefix: 'Dile, ',
    highlighted: '"Hice birdie en este hoyo"',
  ),
];

/// Animated suggestion card with typewriter effect and reflection
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

  @override
  void initState() {
    super.initState();
    _startTypewriter();
  }

  void _startTypewriter() {
    _typeTimer?.cancel();
    _pauseTimer?.cancel();
    _visibleCharacters = 0;

    final fullText = widget.suggestions[_currentIndex].fullText;

    _typeTimer = Timer.periodic(widget.typeSpeed, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_visibleCharacters < fullText.length) {
        setState(() {
          _visibleCharacters++;
        });
      } else {
        timer.cancel();
        // Pause before moving to next suggestion
        _pauseTimer = Timer(widget.pauseDuration, _eraseAndNext);
      }
    });
  }

  void _eraseAndNext() {
    if (!mounted) return;

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
        // Move to next suggestion
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.suggestions.length;
        });
        _startTypewriter();
      }
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: colors.glassBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with label and dots
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sugerencia:',
                style: context.textTheme.bodySmall?.copyWith(
                  color: colors.textTertiary,
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
          // Typewriter suggestion text
          _TypewriterText(
            suggestion: suggestion,
            visibleCharacters: _visibleCharacters,
          ),
          const SizedBox(height: 2),
          // Reflection
          _ReflectionText(
            suggestion: suggestion,
            visibleCharacters: _visibleCharacters,
          ),
        ],
      ),
    );
  }
}

/// The main suggestion text with typewriter effect
class _TypewriterText extends StatelessWidget {
  final Suggestion suggestion;
  final int visibleCharacters;

  const _TypewriterText({
    required this.suggestion,
    required this.visibleCharacters,
  });

  @override
  Widget build(BuildContext context) {
    final fullText = suggestion.fullText;
    final visibleText =
        visibleCharacters <= fullText.length ? fullText.substring(0, visibleCharacters) : fullText;

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
        // Blinking cursor
        const _BlinkingCursor(color: Colors.white),
      ],
    );
  }
}

/// Blinking cursor for typewriter effect
class _BlinkingCursor extends StatefulWidget {
  final Color color;

  const _BlinkingCursor({required this.color});

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
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
        return Opacity(
          opacity: _controller.value,
          child: Container(
            width: 2,
            height: 16,
            margin: const EdgeInsets.only(left: 2),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(1),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.6),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Mirrored reflection of the text
class _ReflectionText extends StatelessWidget {
  final Suggestion suggestion;
  final int visibleCharacters;

  const _ReflectionText({
    required this.suggestion,
    required this.visibleCharacters,
  });

  @override
  Widget build(BuildContext context) {
    final fullText = suggestion.fullText;
    final visibleText =
        visibleCharacters <= fullText.length ? fullText.substring(0, visibleCharacters) : fullText;

    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.diagonal3Values(1.0, -1.0, 1.0),
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: 0.25),
            Colors.transparent,
          ],
          stops: const [0.0, 0.6],
        ).createShader(bounds),
        blendMode: BlendMode.dstIn,
        child: Text(
          visibleText,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white.withValues(alpha: 0.15),
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
          margin: const EdgeInsets.only(left: 4),
          width: isActive ? 6 : 4,
          height: isActive ? 6 : 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Colors.white
                : Colors.white.withValues(alpha: 0.3),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.5),
                      blurRadius: 4,
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }
}

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A shooting star with position, velocity, and lifecycle
class _ShootingStar {
  double x;
  double y;
  final double velocityX;
  final double velocityY;
  final double length;
  final double thickness;
  double life;
  final double maxLife;

  _ShootingStar({
    required this.x,
    required this.y,
    required this.velocityX,
    required this.velocityY,
    required this.length,
    required this.thickness,
    required this.maxLife,
  }) : life = maxLife;

  void update(double dt) {
    x += velocityX * dt;
    y += velocityY * dt;
    life -= dt;
  }

  bool get isDead => life <= 0;

  double get opacity => (life / maxLife).clamp(0.0, 1.0);
}

/// Ambient shooting stars effect for the night sky
class ShootingStars extends StatefulWidget {
  final double height;
  final Duration spawnInterval;
  final int maxStars;

  const ShootingStars({
    super.key,
    this.height = 250,
    this.spawnInterval = const Duration(milliseconds: 2500),
    this.maxStars = 3,
  });

  @override
  State<ShootingStars> createState() => _ShootingStarsState();
}

class _ShootingStarsState extends State<ShootingStars>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_ShootingStar> _stars = [];
  final math.Random _random = math.Random();
  Timer? _spawnTimer;
  double _lastTime = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    _controller.addListener(_update);
    _startSpawning();
  }

  void _startSpawning() {
    // Spawn first star after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _spawnStar();
    });

    _spawnTimer = Timer.periodic(widget.spawnInterval, (_) {
      if (mounted && _stars.length < widget.maxStars) {
        // Random chance to spawn (70%)
        if (_random.nextDouble() < 0.7) {
          _spawnStar();
        }
      }
    });
  }

  void _spawnStar() {
    // Start from top area, random x position
    final startX = _random.nextDouble() * 400;
    final startY = _random.nextDouble() * 30;

    // Diagonal movement (down-right or down-left)
    final goingRight = _random.nextBool();
    final speed = 200 + _random.nextDouble() * 80;
    // Shallower angles so stars travel more horizontally
    final angle = goingRight
        ? (math.pi / 8 + _random.nextDouble() * math.pi / 8) // 22-45 degrees
        : (math.pi - math.pi / 8 - _random.nextDouble() * math.pi / 8); // 135-157 degrees

    _stars.add(_ShootingStar(
      x: startX,
      y: startY,
      velocityX: math.cos(angle) * speed,
      velocityY: math.sin(angle) * speed,
      length: 15 + _random.nextDouble() * 15, // Shorter tails
      thickness: 0.5 + _random.nextDouble() * 0.5, // Thinner
      maxLife: 0.6 + _random.nextDouble() * 0.4,
    ));
  }

  void _update() {
    final currentTime = _controller.value;
    final dt = currentTime >= _lastTime
        ? currentTime - _lastTime
        : 1.0 - _lastTime + currentTime;
    _lastTime = currentTime;

    // Scale dt to real time (controller cycles every second)
    final realDt = dt * 1.0;

    // Update all stars
    for (final star in _stars) {
      star.update(realDt);
    }

    // Remove dead stars
    _stars.removeWhere((star) => star.isDead);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _spawnTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: CustomPaint(
        painter: _ShootingStarsPainter(stars: _stars),
      ),
    );
  }
}

class _ShootingStarsPainter extends CustomPainter {
  final List<_ShootingStar> stars;

  _ShootingStarsPainter({required this.stars});

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      _drawShootingStar(canvas, star);
    }
  }

  void _drawShootingStar(Canvas canvas, _ShootingStar star) {
    final angle = math.atan2(star.velocityY, star.velocityX);

    // Calculate tail end point (opposite direction of movement)
    final tailX = star.x - math.cos(angle) * star.length;
    final tailY = star.y - math.sin(angle) * star.length;

    // Create gradient for the trail
    final gradient = LinearGradient(
      colors: [
        Colors.white.withValues(alpha: star.opacity * 0.9),
        Colors.white.withValues(alpha: star.opacity * 0.5),
        Colors.transparent,
      ],
      stops: const [0.0, 0.3, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromPoints(Offset(star.x, star.y), Offset(tailX, tailY)),
      )
      ..strokeWidth = star.thickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw the trail
    canvas.drawLine(
      Offset(star.x, star.y),
      Offset(tailX, tailY),
      paint,
    );

    // Draw bright head (small dot)
    final headPaint = Paint()
      ..color = Colors.white.withValues(alpha: star.opacity)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(star.x, star.y),
      star.thickness * 0.8,
      headPaint,
    );

    // Add subtle glow to head
    final glowPaint = Paint()
      ..color = Colors.white.withValues(alpha: star.opacity * 0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

    canvas.drawCircle(
      Offset(star.x, star.y),
      star.thickness * 2,
      glowPaint,
    );
  }

  @override
  bool shouldRepaint(_ShootingStarsPainter oldDelegate) => true;
}

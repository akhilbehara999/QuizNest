import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';

/// Interactive celebration overlay with confetti particles, glowing radial burst,
/// and a bouncing golden trophy awarded when a learner achieves a perfect 10/10 score.
class ConfettiCelebrationOverlay extends StatefulWidget {
  final VoidCallback? onDismiss;

  const ConfettiCelebrationOverlay({super.key, this.onDismiss});

  @override
  State<ConfettiCelebrationOverlay> createState() =>
      _ConfettiCelebrationOverlayState();
}

class _ConfettiCelebrationOverlayState extends State<ConfettiCelebrationOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_ConfettiParticle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..forward();

    // Generate colorful confetti particles
    final colors = [
      const Color(0xFFF59E0B), // Gold
      const Color(0xFF10B981), // Emerald
      const Color(0xFF3B82F6), // Blue
      const Color(0xFFEC4899), // Pink
      const Color(0xFF8B5CF6), // Purple
      const Color(0xFFF97316), // Orange
      const Color(0xFF06B6D4), // Cyan
    ];

    for (int i = 0; i < 90; i++) {
      _particles.add(
        _ConfettiParticle(
          x: _random.nextDouble(),
          startY: -0.1 - (_random.nextDouble() * 0.4),
          color: colors[_random.nextInt(colors.length)],
          size: 7 + _random.nextDouble() * 9,
          speed: 0.65 + _random.nextDouble() * 0.9,
          wobbleSpeed: 2 + _random.nextDouble() * 4,
          wobbleRadius: 0.04 + _random.nextDouble() * 0.08,
          isStar: i % 4 == 0,
        ),
      );
    }
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
      builder: (context, child) {
        return Stack(
          children: [
            // Particle painter
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: _ConfettiPainter(
                    particles: _particles,
                    progress: _controller.value,
                  ),
                ),
              ),
            ),
            // Floating 10/10 Perfect Banner
            Positioned(
              top: 70,
              left: 20,
              right: 20,
              child: Center(
                child: Transform.scale(
                  scale: (sin(_controller.value * pi * 0.9).clamp(0.0, 1.0) *
                              0.15 +
                          0.85)
                      .clamp(0.0, 1.05),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFEF3C7), Color(0xFFFDE68A)],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFFF59E0B),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              const Color(0xFFF59E0B).withValues(alpha: 0.35),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🏆', style: TextStyle(fontSize: 28)),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'PERFECT 10 / 10!',
                              style: AppTypography.labelLarge.copyWith(
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF92400E),
                                letterSpacing: 0.8,
                              ),
                            ),
                            const Text(
                              'Trivia Master • 100% Flawless Score!',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFB45309),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        const Text('✨', style: TextStyle(fontSize: 22)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ConfettiParticle {
  final double x;
  final double startY;
  final Color color;
  final double size;
  final double speed;
  final double wobbleSpeed;
  final double wobbleRadius;
  final bool isStar;

  _ConfettiParticle({
    required this.x,
    required this.startY,
    required this.color,
    required this.size,
    required this.speed,
    required this.wobbleSpeed,
    required this.wobbleRadius,
    required this.isStar,
  });
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiParticle> particles;
  final double progress;

  _ConfettiPainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final currentY = (p.startY + (progress * p.speed * 1.5)) % 1.2;
      final wobble = sin(progress * p.wobbleSpeed * pi * 2) * p.wobbleRadius;
      final currentX = (p.x + wobble).clamp(0.0, 1.0);

      final px = currentX * size.width;
      final py = currentY * size.height;

      final paint = Paint()
        ..color = p.color.withValues(
          alpha: (1.0 - (progress * 0.35)).clamp(0.0, 1.0),
        )
        ..style = PaintingStyle.fill;

      if (p.isStar) {
        // Draw star
        _drawStar(canvas, Offset(px, py), p.size * 0.7, paint);
      } else {
        // Draw rounded confetti flake
        canvas.save();
        canvas.translate(px, py);
        canvas.rotate(progress * p.wobbleSpeed * pi);
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset.zero, width: p.size, height: p.size * 0.6),
            const Radius.circular(3),
          ),
          paint,
        );
        canvas.restore();
      }
    }
  }

  void _drawStar(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    const numPoints = 5;
    final innerRadius = radius * 0.45;
    for (int i = 0; i < numPoints * 2; i++) {
      final r = (i.isEven) ? radius : innerRadius;
      final angle = (i * pi / numPoints) - (pi / 2);
      final x = center.dx + r * cos(angle);
      final y = center.dy + r * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

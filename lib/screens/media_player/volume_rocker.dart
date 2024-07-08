import 'package:broken_soul/providers/music_player/player_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class VolDark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          final playerNotifier = ref.read(playerProvider.notifier);
          return VolumeKnob(
            onVolumeChanged: (volume) {
              //print('Volume: $volume');
              playerNotifier.audioPlayer.setVolume(volume);
              playerNotifier.setVolume(volume);
            },
          );
        },
      ),
    );
  }
}

class VolumeKnob extends StatefulWidget {
  final ValueChanged<double> onVolumeChanged;

  VolumeKnob({required this.onVolumeChanged});

  @override
  _VolumeKnobState createState() => _VolumeKnobState();
}

class _VolumeKnobState extends State<VolumeKnob>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotation = 0.0;
  double _previousRotation = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      final center = const Offset(35, 35);
      final touchPosition = details.localPosition;
      final angle =
          atan2(touchPosition.dy - center.dy, touchPosition.dx - center.dx);
      _rotation = _previousRotation + angle;
      double volume = (_rotation % (2 * pi)) / (2 * pi);
      widget.onVolumeChanged(volume.clamp(0.0, 1.0));
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _previousRotation = _rotation;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotation,
            child: CustomPaint(
              size: const Size(150, 150),
              painter: KnobPainter(),
            ),
          );
        },
      ),
    );
  }
}

class KnobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - 20;

    // Draw the outer circle with neumorphism effect for dark mode
    final outerShadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    final innerShadowPaint = Paint()
      ..color = Colors.grey[850]!
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    final basePaint = Paint()
      ..color = Colors.grey[900]!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center + const Offset(5, 5), radius, outerShadowPaint);
    canvas.drawCircle(center - const Offset(5, 5), radius, innerShadowPaint);
    canvas.drawCircle(center, radius, basePaint);

    // Draw the inner circle with neumorphism effect
    final innerBasePaint = Paint()
      ..color = Colors.grey[850]!
      ..style = PaintingStyle.fill;
    final innerShadow = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);
    final innerHighlight = Paint()
      ..color = Colors.grey[800]!
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    canvas.drawCircle(center + const Offset(3, 3), radius * 0.7, innerShadow);
    canvas.drawCircle(
        center - const Offset(3, 3), radius * 0.7, innerHighlight);
    canvas.drawCircle(center, radius * 0.7, innerBasePaint);

    // Draw the center icon
    final iconPainter = TextPainter(
      text: TextSpan(
        text: '\u{1F50A}', // Speaker icon
        style: TextStyle(
          fontSize: radius * 0.5,
          color: Colors.grey[500],
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    iconPainter.layout();
    iconPainter.paint(
      canvas,
      Offset(
        center.dx - iconPainter.width / 2,
        center.dy - iconPainter.height / 2,
      ),
    );

    // Draw the knob indicator as a small blue dot
    final indicatorPaint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    final indicatorRadius = radius * 0.6;
    final dotRadius = 8.0;
    final angle = -pi / 2; // Start at the top
    final indicatorOffset = center +
        Offset(
          indicatorRadius * cos(angle),
          indicatorRadius * sin(angle),
        );
    canvas.drawCircle(indicatorOffset, dotRadius, indicatorPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

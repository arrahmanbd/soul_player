import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class ControllerButtons extends StatelessWidget {
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const ControllerButtons({
    super.key,
    required this.onPlay,
    required this.onPause,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(Icons.skip_previous, onPrevious),
        _buildButton(Icons.pause, onPause),
        _buildButton(Icons.play_arrow, onPlay),
        _buildButton(Icons.skip_next, onNext),
      ],
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomPaint(
        size: const Size(40, 40),
        painter: ButtonPainter(),
        child: IconButton(
          icon: Icon(icon),
          color: Colors.black,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class ButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      //btn background color
      ..color = Color.fromARGB(255, 235, 244, 250).withOpacity(.4)
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.7, 0)
      ..lineTo(size.width, size.height * 0.3)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);

    final Paint highlightPaint = Paint()
      //border
      ..color = YaruColors.darkJet
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Path highlightPath = Path()
      ..moveTo(1, 1)
      ..lineTo(size.width * 0.7, 1)
      ..lineTo(size.width - 1, size.height * 0.3)
      ..lineTo(size.width - 1, size.height - 1)
      ..lineTo(1, size.height - 1)
      ..close();

    canvas.drawPath(highlightPath, highlightPaint);

    // final Paint shadowPaint = Paint()
    // //shadow
    //   ..color = const Color.fromARGB(255, 248, 150, 150).withOpacity(0.6)
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;

    // final Path shadowPath = Path()
    //   ..moveTo(size.width, size.height)
    //   ..lineTo(size.width * 0.7, size.height)
    //   ..lineTo(0, size.height * 0.3)
    //   ..lineTo(0, 0);

    // canvas.drawPath(shadowPath, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
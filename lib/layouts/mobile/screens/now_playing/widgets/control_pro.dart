// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:soul_player/core/constants/colors.dart';

class ControlPro extends StatelessWidget {
  final VoidCallback onTopButtonPress;
  final VoidCallback onBottomButtonPress;
  final VoidCallback onLeftButtonPress;
  final VoidCallback onRightButtonPress;
  final VoidCallback onPlayPauseButtonPress;
  final VoidCallback? onSwipeLeft;
  final VoidCallback? onSwipeRight;
  final VoidCallback? onSwipeUp;
  final VoidCallback? onSwipeDown;
  final bool isGestureEnabled;
  final IconData topIcon;
  final IconData bottomIcon;
  final IconData leftIcon;
  final IconData rightIcon;
  final IconData playPauseIcon;
  final bool playing;
  final Color animateColor;

  const ControlPro({
    Key? key,
    required this.onTopButtonPress,
    required this.onBottomButtonPress,
    required this.onLeftButtonPress,
    required this.onRightButtonPress,
    required this.onPlayPauseButtonPress,
    this.onSwipeLeft,
    this.onSwipeRight,
    this.onSwipeUp,
    this.onSwipeDown,
    this.isGestureEnabled = true,
    this.topIcon = Icons.arrow_drop_up,
    this.bottomIcon = Icons.arrow_drop_down,
    this.leftIcon = Icons.arrow_left,
    this.rightIcon = Icons.arrow_right,
    this.playPauseIcon = Icons.play_arrow,
    required this.playing,
    this.animateColor=primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color splash = const Color.fromARGB(8, 255, 81, 0);
    Color high = Colors.blue;
    return CustomPaint(
      size: const Size(150, 150),
      painter: IpodMusicControllerPainter(
          isPlaying: playing,
          topIcon: topIcon,
          bottomIcon: bottomIcon,
          leftIcon: leftIcon,
          rightIcon: rightIcon,
          playPauseIcon: playPauseIcon,
          animateBorderColor: animateColor),
      child: GestureDetector(
        onPanUpdate: isGestureEnabled
            ? (details) {
                if (details.delta.dx < -5 && onSwipeLeft != null) {
                  onSwipeLeft!();
                } else if (details.delta.dx > 5 && onSwipeRight != null) {
                  onSwipeRight!();
                } else if (details.delta.dy < -5 && onSwipeUp != null) {
                  onSwipeUp!();
                } else if (details.delta.dy > 5 && onSwipeDown != null) {
                  onSwipeDown!();
                }
              }
            : null,
        child: Stack(
          children: [
            Center(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: high,
                  splashColor: splash,
                  onTap: onPlayPauseButtonPress,
                  customBorder: const CircleBorder(),
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -5,
              left: 50,
              right: 50,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: high,
                  splashColor: splash,
                  onTap: onTopButtonPress,
                  customBorder: const CircleBorder(),
                  child: Container(
                    height: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -5,
              left: 50,
              right: 50,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onBottomButtonPress,
                  highlightColor: high,
                  splashColor: splash,
                  customBorder: const CircleBorder(),
                  child: Container(
                    height: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -5,
              top: 50,
              bottom: 50,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onLeftButtonPress,
                  highlightColor: high,
                  splashColor: splash,
                  customBorder: const CircleBorder(),
                  child: Container(
                    width: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -5,
              top: 50,
              bottom: 50,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onRightButtonPress,
                  highlightColor: high,
                  splashColor: splash,
                  customBorder: const CircleBorder(),
                  child: Container(
                    width: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IpodMusicControllerPainter extends CustomPainter {
  final bool isPlaying;
  final IconData topIcon;
  final IconData bottomIcon;
  final IconData leftIcon;
  final IconData rightIcon;
  final IconData playPauseIcon;
  final Color animateBorderColor;

  IpodMusicControllerPainter({
    required this.isPlaying,
    required this.topIcon,
    required this.bottomIcon,
    required this.leftIcon,
    required this.rightIcon,
    required this.playPauseIcon,
    required this.animateBorderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final outerWheelPaint = Paint()
      ..color = const Color.fromARGB(255, 31, 31, 31)
      ..style = PaintingStyle.fill
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(10));

    final innerWheelPaint = Paint()
      ..color = const Color(0xFF2C2C2C)
      ..style = PaintingStyle.fill;

    final iconPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = animateBorderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, borderPaint);
    canvas.drawCircle(
        size.center(Offset.zero), size.width / 2, outerWheelPaint);
    canvas.drawShadow(
        Path()
          ..addOval(Rect.fromCircle(
              center: size.center(Offset.zero), radius: size.width / 1.8)),
        const Color.fromARGB(185, 41, 41, 41),
        10,
        true);

    canvas.drawCircle(
        size.center(Offset.zero), size.width / 4, innerWheelPaint);
    canvas.drawShadow(
        Path()
          ..addOval(Rect.fromCircle(
              center: size.center(Offset.zero), radius: size.width / 4)),
        Colors.black,
        10.0,
        true);

    final buttonSize = size.width / 4;

    _drawIcon(canvas, topIcon, size.center(Offset(0, -size.height / 2.8)),
        iconPaint, buttonSize);
    _drawIcon(canvas, bottomIcon, size.center(Offset(0, size.height / 2.8)),
        iconPaint, buttonSize);
    _drawIcon(canvas, leftIcon, size.center(Offset(-size.width / 2.8, 0)),
        iconPaint, buttonSize);
    _drawIcon(canvas, rightIcon, size.center(Offset(size.width / 2.8, 0)),
        iconPaint, buttonSize);

    _drawIcon(
      canvas,
      isPlaying ? Icons.pause : playPauseIcon,
      size.center(Offset.zero),
      iconPaint,
      size.width / 6,
    );
  }

  void _drawIcon(
      Canvas canvas, IconData icon, Offset position, Paint paint, double size) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: size,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: paint.color,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, position - Offset(size / 2, size / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? radius;
  final double? size;
  final double? media;
  final bool effect;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.radius,
    this.size,
    this.media,
    this.effect = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        highlightColor: Colors.blue,
        splashColor:
            effect ? Colors.red : const Color.fromARGB(110, 24, 24, 24),
        customBorder: const CircleBorder(),
        child: Stack(
          children: [
            // The main button with outer shadow
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size ?? 12, vertical: size ?? 4),
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 12),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(240, 65, 65, 65),
                    offset: Offset(0, -.65),
                    blurRadius: 1,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(52, 0, 0, 0),
                    offset: Offset(1, -1),
                    blurRadius: 2,
                  ),
                ],
                color: const Color(0xFF1C1C20), // Grey background
                border: Border.all(
                    color: const Color.fromARGB(255, 15, 15, 15),
                    width: 3), // 2px block border
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: media ?? 24,
                ),
              ),
            ),
            // Inner shadow effect
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius ?? 12),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(137, 22, 22, 22),
                        offset: Offset(-1, 1),
                        blurRadius: 4,
                        spreadRadius: -4,
                      ),
                    ],
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

//global icon button

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? size;
  final bool effect;

  const ButtonIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size,
    this.effect = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        highlightColor: Colors.blue,
        splashColor:
            effect ? Colors.red : const Color.fromARGB(110, 24, 24, 24),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(width: 1),
        ),
        child: Stack(
          children: [
            // The main button with outer shadow
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(240, 65, 65, 65),
                    offset: Offset(0, -.65),
                    blurRadius: 1,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(52, 0, 0, 0),
                    offset: Offset(1, -1),
                    blurRadius: 2,
                  ),
                ],
                color: const Color(0xFF1C1C20), // Grey background
                border: Border.all(
                    color: const Color.fromARGB(255, 15, 15, 15),
                    width: 3), // 2px block border
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            // Inner shadow effect
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(137, 22, 22, 22),
                        offset: Offset(-1, 1),
                        blurRadius: 4,
                        spreadRadius: -4,
                      ),
                    ],
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

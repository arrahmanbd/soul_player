
import 'package:flutter/material.dart';
import 'package:soul_player/global/extensions/contex.dart';

class LinuxButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? radius;
  final double? size;
  final double? media;
  final bool effect;

  const LinuxButton({
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
                boxShadow:  [
                  BoxShadow(
                    color: context.theme.cardColor,
                    offset: Offset(0, -.65),
                    blurRadius: 1,
                  ),
                  BoxShadow(
                    color: context.theme.cardColor,
                    offset: Offset(1, -1),
                    blurRadius: 2,
                  ),
                ],
                color: context.theme.cardColor, // Grey background
                border: Border.all(
                    color: const Color.fromARGB(255, 15, 15, 15),
                    width: 3), // 2px block border
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: context.theme.iconTheme.color,
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

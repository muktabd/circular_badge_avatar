import 'dart:math';
import 'package:flutter/material.dart';


class CircularBadgeAvatar extends StatelessWidget {
  const CircularBadgeAvatar({
    super.key,
    required this.centeralText,
    required this.icon,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    required this.icongBg,
    required this.iconColor,
  });

  final String centeralText;
  final IconData icon;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final Color icongBg;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = min(constraints.maxHeight, constraints.maxWidth);
      return SizedBox.square(
        dimension: radius,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor,
                    width: 1.5,
                  )),
              padding: const EdgeInsets.all(8),
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  centeralText,
                  style: TextStyle(
                    fontSize: 24,
                    color: textColor,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: icongBg,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    icon,
                    size: radius * 0.2,
                    color: iconColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

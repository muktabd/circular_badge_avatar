import 'dart:math';
import 'package:flutter/material.dart';

class CircularBadgeAvatar extends StatelessWidget {
  final String? centeralText;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;
  final IconData? icon;
  final Color? icongBg;
  final Color? iconColor;
  final VoidCallback? iconOnPressed;
  final String? assetImage;

  const CircularBadgeAvatar({
    super.key,
    this.centeralText,
    this.bgColor,
    this.borderColor,
    this.textColor,
    this.icon,
    this.icongBg,
    this.iconColor,
    this.iconOnPressed,
    this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight, constraints.maxWidth);
        return SizedBox.square(
          dimension: radius,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topRight,
            children: [
              if (assetImage != null)
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: borderColor ?? Colors.blueGrey,
                      width: 2.0,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor ?? const Color(0x00000000),
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 180,
                      child: Image.asset(
                          assetImage ?? "assets/images/user_placeholder.png", 
                          fit: BoxFit.cover,
                          ),
                                         
                    ),
                  ),
                )
              else
                Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: borderColor ?? Colors.blueGrey,
                      width: 1.5,
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      centeralText ?? "AI",
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
                child: GestureDetector(
                  onTap: iconOnPressed,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: icongBg,
                      shape: BoxShape.circle,
                      border: icon != null
                          ? Border.all(
                              color: Colors.grey,
                            )
                          : null,
                    ),
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
              ),
            ],
          ),
        );
      },
    );
  }
}

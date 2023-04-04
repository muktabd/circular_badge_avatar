import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NetworkImageBadgeAvatar extends StatelessWidget {
  final String? centeralText;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;
  final IconData? icon;
  final Color? icongBg;
  final Color? iconColor;
  final VoidCallback onPressed;
  final String? placeholderImage;
  final String? networkImage;
  final XFile? imagePath;

  const NetworkImageBadgeAvatar({
    super.key,
    this.centeralText,
    this.bgColor,
    this.borderColor,
    this.textColor,
    this.icon,
    this.icongBg,
    this.iconColor,
    required this.onPressed,
    this.placeholderImage,
    this.networkImage,
    this.imagePath,
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
              if (imagePath != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: borderColor ?? Colors.blueGrey,
                      width: 1.5,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Image.file(
                      File(imagePath!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                Container(
                  decoration: BoxDecoration(
                    color: bgColor ?? const Color(0x00FFFFFF),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: borderColor ?? Colors.blueGrey,
                      width: 1.5,
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.center,
                  child: FadeInImage.assetNetwork(
                    placeholder: placeholderImage ?? "assets/images/user_placeholder.png",
                    image: networkImage ?? 'https://raw.githubusercontent.com/muktabd/public-images/main/user_placeholder.png',
                    fit: BoxFit.cover,
                  ),
                ),

              /// adjusted editable badge icon
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onPressed,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: icongBg ?? Colors.grey.shade200,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        icon ?? Icons.edit,
                        size: radius * 0.2,
                        color: iconColor ?? Colors.blue.shade800,
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

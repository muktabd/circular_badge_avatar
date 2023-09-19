import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// [placeholder image] you just pass the asset name. 
/// For example : "assets/images/user_placeholder.png" or for string name use : Images.name. Else it will not show your image in placeholder.
/// By default we are showing one image from our root folder
/// 
class NetworkImageBadgeAvatar extends StatelessWidget {
  final String? centeralText;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;
  final IconData? icon;
  final Color? icongBg;
  final Color? iconColor;
  final VoidCallback? iconOnPressed;
  final String? placeholderImage;
  final String? networkImage;
  final XFile? imagePath;
  final String? imageString;
  final double? iconPosition;
  final bool? needImagePickerIcon;

  const NetworkImageBadgeAvatar({
    super.key,
    this.centeralText,
    this.bgColor,
    this.borderColor,
    this.textColor,
    this.icon,
    this.icongBg,
    this.iconColor,
    this.iconOnPressed,
    this.placeholderImage,
    this.networkImage,
    this.imagePath,
    this.imageString,
    this.iconPosition,
    this.needImagePickerIcon = true
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
              if (imagePath != null 
              || imageString != null
              || centeralText != null
              )             
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
                      color: bgColor ?? Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 180,
                      child: imagePath?.path != null
                      ? Image.file(                     
                          File(imagePath!.path),                          
                        fit: BoxFit.cover,
                      )
                      : imageString != null            
                      ? Image.file(                 
                             File(imageString!),
                        fit: BoxFit.cover,
                      )
                      : FittedBox(
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
                  ),
                )
              else
                Container(
                  decoration: BoxDecoration(
                    /// [color] color: bgColor ?? const Color(0x00FFFFFF),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: borderColor ?? Colors.blueGrey,
                      width: 1.5,
                    ),
                  ),            
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                     clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    child: FadeInImage.assetNetwork(
                      placeholder: placeholderImage ??
                          "assets/images/user_placeholder.png",
                      image: networkImage ??
                          'https://raw.githubusercontent.com/muktabd/public-images/main/user_placeholder.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                            
              /// adjustable iconbutton [image picker icon button]
              /// by default top value set 85.0 based on SizedBox height 120
              needImagePickerIcon!
                ? Positioned(
                  top: iconPosition ?? 85.0,
                  right: 0,
                  child: GestureDetector(
                    onTap: iconOnPressed,
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
                )
                : const SizedBox.shrink(),
              ///
              ///                 
            ],
          ),
        );
      },
    );
  }
}

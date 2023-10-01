import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CircularBadgeAvatar extends StatelessWidget {
  final String? centeralText;

  /// [centeralText:] stans for to show a text in the center of circular where you want to show your picked image. By default if you don't want to show any asset of network imageyou can use this instade
  final Color? centeralTextColor;
  final double? centeralTextSize;
  final Color? circleBgColor;
  final Color? circleBorderColor;
  final double? circleBorderWidth;
  final double? circleBorderRadius;
  final String? assetImage;
  final String? circularPlaceholderImage;
  final String? networkPlaceholderImage;

  /// [placeholder image] you just pass the asset name.
  /// For example : "assets/images/user_placeholder.png" or for string name use : Images.name. Else it will not show your image in placeholder.
  /// By default we are showing one image from our root folder
  final String? networkImage;
  final XFile? imagePath;
  final String? imageString;

  /// [icons properties]
  final IconData? icon;
  final double? iconSize;
  final Color? iconBgColor;
  final Color? iconColor;
  final Color? iconBorderColor;
  final double? iconBorderWith;
  final double? iconPosition;
  final VoidCallback? iconOnTap;
  final bool? needImagePickerIcon;

  /// [ends icons properties]

  const CircularBadgeAvatar(
      {super.key,
      this.centeralText,
      this.centeralTextColor,
      this.centeralTextSize,
      this.assetImage,
      this.networkPlaceholderImage,
      this.imagePath,
      this.imageString,
      this.circularPlaceholderImage,
      this.networkImage,
      this.circleBgColor,
      this.circleBorderColor,
      this.circleBorderWidth,
      this.circleBorderRadius,

      /// [icons properties]
      this.icon,
      this.iconSize,
      this.iconBgColor,
      this.iconColor,
      this.iconBorderColor,
      this.iconBorderWith,
      this.iconPosition,
      this.iconOnTap,
      this.needImagePickerIcon = true

      /// [ends icons properties]
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
            alignment: Alignment.topLeft,
            children: [
              if (imagePath != null ||
                  imageString != null ||
                  centeralText != null ||
                  assetImage != null)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      circleBorderRadius ?? 90.0,
                    ),
                    border: Border.all(
                      color: circleBorderColor ?? Colors.grey,
                      width: circleBorderWidth ?? 2.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      circleBorderRadius ?? 90,
                    ),
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
                            : assetImage != null
                                ? Image.asset(
                                    assetImage ??
                                        "lib/images/user_placeholder.png",
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Text(
                                      centeralText
                                              ?.split(" ")
                                              .firstOrNull
                                              ?.substring(0, 2).toUpperCase() ??
                                          "AI",
                                      style: TextStyle(
                                        fontSize: centeralTextSize ?? 24.0,
                                        color: centeralTextColor,
                                      ),
                                    ),
                                  ),
                  ),
                )
              else
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      circleBorderRadius ?? 90,
                    ),
                    border: Border.all(
                      color: circleBorderColor ?? Colors.grey,
                      width: circleBorderWidth ?? 2.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      circleBorderRadius ?? 90,
                    ),
                    child: FadeInImage.assetNetwork(
                    placeholder: circularPlaceholderImage ??
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
                        onTap: iconOnTap,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: iconBgColor ?? Colors.grey.shade200,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: iconBorderColor ?? Colors.grey,
                              width: iconBorderWith ?? 1.2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              icon ?? Icons.edit,
                              size: iconSize ?? 18.0,
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
 
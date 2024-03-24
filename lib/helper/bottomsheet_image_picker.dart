import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetImagePicker extends StatefulWidget {
  final Widget? title;
  final String? titleText;
  final Widget? cameraTitle;
  final String? cameraTitleText;
  final Widget? galleryTitle;
  final String? galleryTitleText;
  final Widget? cancel;
  final String? cancelText;
  final TextStyle? style;
  const BottomSheetImagePicker({
    super.key,
    this.title,
    this.titleText,
    this.cameraTitle,
    this.cameraTitleText,
    this.galleryTitle,
    this.galleryTitleText,
    this.cancel,
    this.cancelText,
    this.style,
  });

  @override
  State<BottomSheetImagePicker> createState() => _BottomSheetImagePickerState();
}

class _BottomSheetImagePickerState extends State<BottomSheetImagePicker> {
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 12.0),
            child: widget.title ??
                Text(
                  widget.titleText ?? "Please choose your media",
                  style: widget.style ?? const TextStyle(fontSize: 16),
                ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.camera_alt,
          ),
          title: widget.cameraTitle ?? Text(widget.cameraTitleText ?? "Take a picture"),
          onTap: () async {
            final XFile? file = await picker.pickImage(source: ImageSource.camera);
            if (file != null) {
              if (mounted) {
                Navigator.of(context).pop(file);
              }
            } else {
              if (mounted) {
                Navigator.of(context).pop();
              }
            }
          },
        ),
        ListTile(
          onTap: () async {
            final XFile? file = await picker.pickImage(source: ImageSource.gallery);
            if (file != null) {
              if (mounted) {
                Navigator.of(context).pop(file);
              }
            } else {
              if (mounted) {
                Navigator.of(context).pop();
              }
            }
          },
          leading: const Icon(
            Icons.photo,
          ),
          title: widget.galleryTitle ?? Text(widget.galleryTitleText ?? "Choose from gallery"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            child: widget.cancel ?? Text(widget.cancelText ?? "Cancel"),
          ),
        ),
      ],
    );
  }
}

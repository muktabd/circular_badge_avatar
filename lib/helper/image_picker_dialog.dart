import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialogBox extends StatelessWidget {
  final Widget? title;
  final String? titleText;
  final double? titleTextSize;
  const ImagePickerDialogBox({
    super.key,
    this.title,
    this.titleText,
    this.titleTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      title: title ??
          (titleText!.isNotEmpty
              ? Text(
                  titleText!,
                  style: const TextStyle(fontSize: 18),
                )
              : null),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
            ),
            title: const Text("Take a picture"),
            onTap: () async {
              XFile? file =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              if (file != null) {
                if (context.mounted) {
                  Navigator.of(context).pop(file);
                }
              } else {
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              }
            },
          ),
          ListTile(
            onTap: () async {
              XFile? file =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (file != null) {
                if (context.mounted) {
                  Navigator.of(context).pop(file);
                }
              } else {
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              }
            },
            leading: const Icon(
              Icons.photo,
            ),
            title: const Text("Choose from gallery"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            child: const Text("Cancel"),
          ),
        ),
      ],
    );
  }
}

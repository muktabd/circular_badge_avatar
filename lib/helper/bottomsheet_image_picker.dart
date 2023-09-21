import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetImagePicker extends StatefulWidget {
  const BottomSheetImagePicker({Key? key}) : super(key: key);

  @override
  State<BottomSheetImagePicker> createState() => _BottomSheetImagePickerState();
}

class _BottomSheetImagePickerState extends State<BottomSheetImagePicker> {
  String? selectedImage;
  VoidCallback? onPressed;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
          leading: const Icon(
            Icons.camera_alt,
          ),
          title: const Text("Take a picture"),
          onTap: () async {
            final XFile? file =
                await picker.pickImage(source: ImageSource.camera);
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
            final XFile? file =
                await picker.pickImage(source: ImageSource.gallery);
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
          title: const Text("Choose from gallery"),
        ),
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

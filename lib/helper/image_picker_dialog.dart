import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialogBox extends StatefulWidget {
  const ImagePickerDialogBox({Key? key}) : super(key: key);

  @override
  State<ImagePickerDialogBox> createState() => _ImagePickerDialogBoxState();
}

class _ImagePickerDialogBoxState extends State<ImagePickerDialogBox> {
  String? selectedImage;
  VoidCallback? onPressed;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
            ),
            title: const Text("Take a picture"),
            onTap: () async {
              XFile? file = await picker.pickImage(source: ImageSource.camera);
              if (file != null) {
                if(mounted){
                  Navigator.of(context).pop(file);
                }
              } else {
                if(mounted){
                  Navigator.of(context).pop();
                }
                
              }
            },
          ),
          ListTile(
            onTap: () async {
              XFile? file = await picker.pickImage(source: ImageSource.gallery);
              if (file != null) {
              if(mounted){
                  Navigator.of(context).pop(file);
                }
              } else {
              if(mounted){
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

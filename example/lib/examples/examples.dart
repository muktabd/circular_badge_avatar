import 'dart:developer';
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  XFile? _image;
  Future _imageHandler(ImageSource imageSource) async {
    try {
      final XFile? imagePicker =
          await ImagePicker().pickImage(source: imageSource);
      if (imagePicker != null) {
        setState(() {
          _image = imagePicker;
          log("your image path is here ===>> ${_image!.path}");
        });
      } else {
        /// user canceled
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Circular Badge Examples"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const SizedBox(
              height: 100,
              child: CircularBadgeAvatar(
                centeralText: "OPTIONAL",
                textColor: Colors.white,
                bgColor: Colors.red,
                borderColor: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: StaticBadgeAvatar(
                centeralText: "STATIC",
                icon: Icons.info_outline_rounded,
                textColor: Colors.white,
                iconColor: Colors.lightBlue.shade900,
                icongBg: Colors.white,
                bgColor: Colors.red,
                borderColor: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: InfoBadgeAvatar(
                centeralText: "AI",
                icon: Icons.info_outline_rounded,
                textColor: Colors.white,
                iconColor: Colors.lightBlue.shade900,
                icongBg: Colors.white,
                bgColor: Colors.red,
                borderColor: Colors.blueGrey,
                onPressed: () {
                  log("Hello badge");
                  /* ///if you want a custom test use this */
                  // var snackBar = SnackBar(content: Text('Hello, I am here'));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Hello, Your info is here!!')));
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: ImageBadgeAvatar(
                imagePath: _image,
                onPressed: () {
                  log("Hello badge");
                  _imageHandler(ImageSource.gallery);
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: NetworkImageBadgeAvatar(
                imagePath: _image,
                networkImage: "https://cdn.pixabay.com/photo/2012/12/27/19/40/chain-link-72864_960_720.jpg",
                onPressed: () {
                  log("Hello badge");
                  _imageHandler(ImageSource.gallery);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

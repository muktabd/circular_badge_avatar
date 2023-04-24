import 'dart:developer';
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circular Badge Avatar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleScreen(),
    );
  }
}

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
            SizedBox(
              height: 100,
              child: CircularBadgeAvatar(
                centeralText: "AI",
                textColor: Colors.white,
                bgColor: Colors.red,
                borderColor: Colors.blueGrey,
                icon: Icons.info,
                iconOnPressed: () {
                  /// if you want a custom test use this
                  // var snackBar = SnackBar(content: Text('Hello, I am here'));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Hello, Your info is here!!'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: NetworkImageBadgeAvatar(
                imagePath: _image,
                networkImage:
                    "https://raw.githubusercontent.com/muktabd/public-images/main/user_placeholder.png",
                iconOnPressed: () {
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

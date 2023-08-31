import 'dart:developer';
import 'dart:io';
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

  XFile? selectedImagePath;
  XFile? imageSource;

  Future showPickerDialogue(BuildContext context) async {
    ImagePicker picker = ImagePicker();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text(title ?? "Alert!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  //color: ColorRes.black,
                ),
                title: const Text("Take a picture"),
                onTap: () async {
                  selectedImagePath =
                      await picker.pickImage(source: ImageSource.camera);
                  if (selectedImagePath != null) {
                    setState(() {
                      selectedImagePath = XFile(selectedImagePath!.path);
                    });
                  } else {
                    Navigator.of(context);
                  }
                },
              ),
              ListTile(
                onTap: () async {
                  selectedImagePath =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (selectedImagePath != null) {
                    setState(() {
                      selectedImagePath = XFile(selectedImagePath!.path);
                    });
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                leading: const Icon(
                  Icons.photo,
                  //color: ColorRes.black,
                ),
                title: const Text("Choose one from gallery"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                //color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: Text("Cancel"),
              ),
            ),
          ],
        );
      },
    );
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
                imagePath: selectedImagePath,
                networkImage:
                    "https://raw.githubusercontent.com/muktabd/public-images/main/user_placeholder.png",
                iconOnPressed: () {
                  log("Hello badge");
                  showPickerDialogue(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

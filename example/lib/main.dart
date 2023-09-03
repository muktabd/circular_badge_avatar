import 'dart:developer';
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
import 'package:circular_badge_avatar/helper/image_picker_dialog.dart';
import 'package:circular_badge_avatar/helper/bottomsheet_image_picker.dart';
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
  String? selectedImagePath;
  XFile? imageSource;

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
            
            // []
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
            
            //if you want to pass a asset image [assetImage: pass your asset image]       
            const SizedBox(
              height: 100,
              child: CircularBadgeAvatar(
                 assetImage: "assets/images/asset_image.png",
              ),
            ),
            const SizedBox(height: 20),
            //

            // 
            SizedBox(
              height: 100,
              child: NetworkImageBadgeAvatar(
                imageString: selectedImagePath,
                imagePath: imageSource,
                iconPosition: 70,
                networkImage: "https://raw.githubusercontent.com/muktabd/public-images/main/user_placeholder.png",
                iconOnPressed: () async {
                  log("Hello badge");

                  // by default we're showing [BottomSheetImagePicker] helper class
                  // if you don't want you can comment out the lines
                  final file =  await showModalBottomSheet<XFile?>(
                    context: context,
                    builder: (context) {
                    return const BottomSheetImagePicker();
                  });

                  // if you want to use image picker dialog then use [ImagePickerDialog] helper class
                  // remove this comment out lines
                  /* 
                    final file = await showDialog<XFile>(
                      context: context,
                      builder: (context) {
                        return const ImagePickerDialog();
                    }); 
                  */

                  setState(() {
                    //imageSource = file;
                    selectedImagePath =  file!.path;
                    log("Seding a string => $selectedImagePath");
                    log("Seding a XFile => ${imageSource?.path}");
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

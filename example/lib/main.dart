import 'dart:developer';
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
import 'package:circular_badge_avatar/helper/image_picker_dialog.dart';
import 'package:circular_badge_avatar/helper/show_snackbar.dart';
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
  String? selectedImagePath1;
  XFile? imageSource1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Circular Badge Examples"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                SizedBox(
                  height: 120,
                  child: CircularBadgeAvatar(
                    ///centeralText: "MUKTA AHMED",
                    ///needImagePickerIcon: false,
                    imagePath: imageSource1,
                    ///imageString: selectedImagePath1,
                    ///assetImage: "assets/images/asset_image.png",
                    /// circleBgColor: Colors.red,
                    circleBorderColor: Colors.red,
                    /// centeralTextColor: Colors.red,
                    /// centeralTextSize: 35,
                    circleBorderWidth: 5.0,
                    circleBorderRadius: 90,

                    /// you can pass either a text once network image is empty
                    /// networkImage: "https://cdn.pixabay.com/photo/2023/09/04/06/59/dog-8232158_1280.jpg",
                    //iconPosition: 85.0,
                    iconOnTap: () async {
                      final file = await showDialog<XFile>(
                        context: context,
                        builder: (context) {
                          return const ImagePickerDialogBox(
                            ///title: Text("Pick your"),
                            titleText: "Please choose your media",
                          );
                        },
                      );

                      if (file != null) {
                        /// [Pick a image first & then convert it as you want]
                        /// [imageSource] is a XFile. So you can send the XFile firectly here. It will autometically viewed in display
                        imageSource1 = file;
                        selectedImagePath1 = file.path;
                        log("Seding a string => $selectedImagePath1");
                        log("Seding a XFile => ${imageSource1?.path}");
                        if (mounted) {
                          showSuccessSnackBar(
                            message: "Image upload successfully!",
                            context: context,
                          );
                        }
                      } else {
                        log("file is null");
                      }

                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 50),

                /// [just a gape]
                ///
              ],
            ),
          ),
        ),
      ),
    );
  }
}

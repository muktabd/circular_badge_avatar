import 'dart:developer';
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
import 'package:circular_badge_avatar/helper/image_picker_dialog.dart';
import 'package:circular_badge_avatar/helper/bottomsheet_image_picker.dart';
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
  String? selectedImagePath2;
  String? selectedImagePath3;

  XFile? imageSource1;
  XFile? imageSource2;
  XFile? imageSource3;

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
          
                ///
                /// [just a gape]
          
                /// here is an example of text with info with button [use@ icon: & use@ iconOnPressed: ]
                /// replace your text in [centeralText: ]
                const Text("Just show a static image from your asset"),
                SizedBox(
                  height: 100,
                  child: CircularBadgeAvatar(
                    centeralText: "AI",
                    textColor: Colors.white,
                    bgColor: Colors.red,
                    borderColor: Colors.blueGrey,
                    icon: Icons.info,
                    iconOnPressed: () {
                      /// [Note]: you can use our static snackbar or can customize it as you want
                      if (mounted) {
                        showSuccessSnackBar(
                            message: "Image upload successfully!",
                            context: context);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
          
                /// [just a gape]
          
                /// if you want to pass a asset image [assetImage: pass your asset image]
                const Text("Just show a static image from your asset"),
                const SizedBox(
                  height: 100,
                  child: CircularBadgeAvatar(
                    assetImage: "assets/images/asset_image.png",
                  ),
                ),
                const SizedBox(height: 20),
          
                /// [just a gape]
          
                const Text(
                    "example of a network image & Xfile, just pass your picked file/iimage as a XFile"),
          
                /// Note:] This widget created to maintain all the network images e.g: http/https url, firebase http/https url here [networkImage:]
                /// sometimes from firebase we receive only a file name, that can be handlled here too. continue ready the documents properly
                SizedBox(
                  height: 120,
                  child: NetworkImageBadgeAvatar(
                    imagePath: imageSource1,
          
                    /// if you want to pass a XFile directly, then just simple send your XFile [imagePath:] in this paremeter
                    iconPosition: 85.0,
          
                    /// this is the image picker positioned adjustable iconbutton [image picker icon button]
                    /// by default top value set 85.0 based on SizedBox height 120
                    networkImage:
                        "https://raw.githubusercontent.com/muktabd/public-images/main/user_placeholder.png",
          
                    /// [note:] you can load a by default url and then replace that with
          
                    iconOnPressed: () async {
                      log("Hello picker icon...");
          
                      /// here is an example of [BottomSheetImagePicker] helper widget
                      /// [note:] if you don't want you can comment out the lines & customize as your own
                      final file = await showModalBottomSheet<XFile?>(
                          context: context,
                          builder: (context) {
                            return const BottomSheetImagePicker();
                          });
          
                      if (file != null) {
                        /// [Pick a image first & then convert it as you want]
                        /// [imageSource] is a XFile. So you can send the XFile firectly here. It will autometically viewed in disply
                        imageSource1 = file;
                        log("Seding a XFile => ${imageSource1?.path}");
                        if (mounted) {
                        showSuccessSnackBar(
                            message: "Image upload successfully!",
                            context: context,);
                      }
                      } else {
                        log("file is null");
                      }
          
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 10),
          
                /// [just a gape]
          
                const Text(
                    "example of a placeholder image & imagePath as a string, just pass your picked file/iimage as a string"),
          
                /// Note:] This widget created to maintain all the network images e.g: http/https url, firebase http/https url here [networkImage:]
                /// sometimes from firebase we receive only a file name, that can be handlled here too. continue ready the documents properly
                SizedBox(
                  height: 120,
                  child: NetworkImageBadgeAvatar(
                    imagePath: imageSource2,
          
                    /// send your image as a string [imageString:] in this paremeter
                    /// [Note:] you can pass a firebase image name here as a string
                    iconPosition: 85.0,
                    // this is the image picker positioned adjustable iconbutton [image picker icon button]
                    /// by default top value set 85.0 based on SizedBox height 120
          
                    placeholderImage: "assets/images/asset_image.png",
                    iconOnPressed: () async {
                      log("Hello badge");
          
                      /// if you want to use image picker dialog then use [ImagePickerDialogBox] helper class
                      /// remove this comment out lines
          
                      final file = await showDialog<XFile>(
                          context: context,
                          builder: (context) {
                            return const ImagePickerDialogBox();
                          });
          
                      if (file != null) {
                        /// [Pick a image first & then convert it as you want]
                        /// [imageSource] is a XFile. So you can send the XFile firectly here. It will autometically viewed in disply
                        imageSource2 = file;
                        log("Seding a XFile => ${imageSource2?.path}");
                        if (mounted) {
                        showSuccessSnackBar(
                            message: "Image upload successfully!",
                            context: context,);
                      }
                      } else {
                        log("file is null");
                      }
          
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 10),
                /// [just a gape]
          
                ///
                const Text(
                    "example of a text imagePath as a string, just pass your picked file/iimage as a string"),
          
                /// Note:] This widget created to maintain all the network images e.g: http/https url, firebase http/https url here [networkImage:]
                /// sometimes from firebase we receive only a file name, that can be handlled here too. continue ready the documents properly
                SizedBox(
                  height: 120,
                  child: NetworkImageBadgeAvatar(
                    needImagePickerIcon: false,
                    imageString: selectedImagePath3,
                    bgColor: Colors.red,
          
                    /// you can pass either a text once network image is empty
                    //networkImage: "https://cdn.pixabay.com/photo/2023/09/04/06/59/dog-8232158_1280.jpg",
                    centeralText: "AI",
                    iconPosition: 85.0,
          
                    iconOnPressed: () async {
                      final file = await showDialog<XFile>(
                          context: context,
                          builder: (context) {
                            return const ImagePickerDialogBox();
                          });
          
                      if (file != null) {
                        /// [Pick a image first & then convert it as you want]
                        /// [imageSource] is a XFile. So you can send the XFile firectly here. It will autometically viewed in disply
                        imageSource3 = file;
                        selectedImagePath3 = file.path;
                        log("Seding a string => $selectedImagePath3");
                        log("Seding a XFile => ${imageSource3?.path}");
                        if (mounted) {
                        showSuccessSnackBar(
                            message: "Image upload successfully!",
                            context: context,);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

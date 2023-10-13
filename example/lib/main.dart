import 'dart:developer';
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
import 'package:circular_badge_avatar/helper/bottomsheet_image_picker.dart';
import 'package:circular_badge_avatar/helper/image_picker_dialog.dart';
import 'package:circular_badge_avatar/helper/show_snackbar.dart';
import 'package:circular_badge_avatar/helper/show_toast.dart';
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

  /// [Xfile or Conver XFile into a string]
  String? selectedImagePath1;
  XFile? imageSource1;
  XFile? imageSource2;



  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
                  height: 110,
                  child: CircularBadgeAvatar(
                    iconPosition: 10, // adjust your icon position
                    icon: Icons.info_outline, // replace with your favorite icon
                    iconSize: 15, // resize your icon size
                    centeralText: "Mukta Ahmed",
                    /// [if you want to use asset image]
                    // assetImage: "assets/images/asset_image.png",
                    iconOnTap: (){
                      showSuccessSnackBar(message: "An example of info circular badge avater", context: context);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                //

                SizedBox(
                  height: 110,
                  child: CircularBadgeAvatar(                  
                    needImagePickerIcon: true, // if you decide not to show the picker icon and user are not able to pick any image [needImagePickerIcon: false]
                    // it's image as string but actual type if file. So normal asset string will not be used here
                    // image path from firebase, File, XFile path can be used here
                    imageString: selectedImagePath1, 
                    iconOnTap: () async { 
                      final file = await showDialog<XFile>(
                        context: context,
                        builder: (context) {
                          return const ImagePickerDialogBox(
                            ///title: Text("Pick your"),
                            //titleText: "Please choose your media",
                          );
                        },
                      );
                      setState(() {                      
                        selectedImagePath1 = file!.path; // e.g: you need to set a path
                      });
                    },  
                  ),
                ),
                const SizedBox(height: 20),
                //

                SizedBox(
                  height: 110,
                  child: CircularBadgeAvatar(                  
                    imagePath: imageSource1, // imagePath only accept XFile
                    iconOnTap: () async { 
                      final file = await showModalBottomSheet<XFile>(
                        context: context,
                        builder: (context) {
                          return const BottomSheetImagePicker(
                            ///title: Text("Pick your"),
                            //titleText: "Please choose your media",
                          );
                        },
                      );                   
                      setState(() {                      
                        imageSource1 = file!; // e.g: you need to set a path
                      });
                    },  
                  ),
                ),
                const SizedBox(height: 20),
                //

                SizedBox(
                  height: 110,
                  child: CircularBadgeAvatar(
                    // centeralText: "MUKTA AHMED",
                    // needImagePickerIcon: false,
                    imagePath: imageSource2,
                    // imageString: selectedImagePath1,
                    // assetImage: "assets/images/asset_image.png",
                    circleBgColor: Colors.red,
                    circleBorderColor: Colors.red,
                    centeralTextColor: Colors.red,
                    centeralTextSize: 35,
                    circleBorderWidth: 5.0,
                    circleBorderRadius: 90,
                    /// you can pass either a text once network image is empty
                    networkImage: "https://cdn.pixabay.com/photo/2023/09/04/06/59/dog-8232158_1280.jpg",
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
                        imageSource2 = file;
                        // selectedImagePath1 = file.path;
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

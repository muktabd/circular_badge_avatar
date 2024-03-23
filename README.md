## Description
A useful flutter package to make a cicular avater with with badge or without badge. This widget will redure to write a lots of code of adjustable cirular badge avater for your project

## Features
* **Able to change circular background color**
* **Able to set own letters or any database name / username. It will auto split 1st 2 digit and show as capital letter instead of image**
* **Able to chnage the badge color**
* **Can set your own placeholder image**
* **Able to adjust image picker icon top or bottom**
* **And many more options are open to you, pick and use them**

## Getting started
Just add this in your dependecies 
```dart
circular_badge_avatar: ^0.1.3
```
 
and import the bellow line where you want to use the Widget
```dart
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
```

To use our helper class widget [if auto import not work] then copy and paste this in the import section. You can use any one of this two helper widgets. 
* One is image pick from dialog box 
* And another is from bottomsheet

To know more about it please continue reading about in **CircularBadgeAvatar** implementation
```dart
import 'package:circular_badge_avatar/helper/image_picker_dialog.dart';

import 'package:circular_badge_avatar/helper/bottomsheet_image_picker.dart';
```

Here are the perameters all are optional. You can override all of those 


``` 
/// [circule properties]
String centeralText;
Color centeralTextColor;
double centeralTextSize;
Color circleBgColor;
Color circleBorderColor;
double circleBorderWidth;
double circleBorderRadius;
String assetImage;
String networkPlaceholderImage;
String networkImage;
XFile imagePath;
String imageString;

/// [icons properties]
IconData icon;
double iconSize;
Color iconBgColor;
Color iconColor;
Color iconBorderColor;
double iconBorderWith;
double iconPosition;
VoidCallback iconOnTap;
bool needImagePickerIcon;
```

## Usage
To get a clear idea plese have a look in the example folder to `/example`.

## Sample output
<img src = "https://github.com/muktabd/circular_badge_avatar/blob/main/example/assets/gif/example.gif?raw=true" width="350"><img>


## CircularBadgeAvatar
This widget allow you to do everything you want to with circular badge avater with Color, Text or using Asset image, network image, firebase image path. 

### Please mouse hover *CircularBadgeAvatar* to see more optional usable perameters you are able to use.

An example of to show info of a image avater with text or asset image. 
```dart
    SizedBox(
        height: 110,
        child: CircularBadgeAvatar(
        iconPosition: 0, /// [adjust your icon position]
        icon: Icons.info_outline, /// [replace with your favorite icon]
        // iconSize: 15, /// [resize your icon size]
        centeralText: "Mukta Ahmed",
        /// [if you want to use asset image]
        // assetImage: "assets/images/asset_image.png",
        iconOnTap: (){
            showSuccessSnackBar(message: "An example of info circular badge avater", context: context);
        },
       ),
    ),
```

If you want to use image path as string use [imageString:] remeber that it will only accept File or XFile path not asset image string. You can use *Firebase* file path diretly here
```dart
    ///if you want to pass a asset image [assetImage: pass your asset image]       
    SizedBox(
        height: 110,
        child: CircularBadgeAvatar(                  
        needImagePickerIcon: true, /// if you decide not to show the picker icon and user are not able to pick any image [needImagePickerIcon: false]
        imageString: selectedImagePath1, 
        iconOnTap: () async { 
            final file = await showDialog<XFile>(
            context: context,
                builder: (context) {
                    return const ImagePickerDialogBox(
                    // title: Text("Pick your"),
                    // titleText: "Please choose your media",
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
```

## Handle Network Images
To handle all kind of network image from HTTP or Firebase image path you can view from here and also able to update the image to any kind of databas

Here is an example how to use this widget when you want it to pick image and view. To use this widget you need to add *image_picker* package.
```dart
    SizedBox(
        height: 110,
        child: CircularBadgeAvatar(
        imagePath: /// your image path [XFile] e.g: XFile? imageSource;
        networkImage: "https://cdn.pixabay.com/photo/2023/09/04/06/59/dog-8232158_1280.jpg", // replace your http image url
        iconOnTap: () async {
            log("Hello badge");

            /// by default we're showing [BottomSheetImagePicker] helper class
            /// if you don't want you can comment out the lines

            final file =  await showModalBottomSheet<XFile?>(
            context: context,
            builder: (context) {
                return const BottomSheetImagePicker();
            });

            /// if you want to use image picker dialog then use [ImagePickerDialog] helper class
            /// remove this comment out lines
            
            /* 
                final file = await showDialog<XFile>(
                    context: context,
                    builder: (context) {
                    return const ImagePickerDialog();
                }); 
            */

            setState(() {
                imageSource = file;
            });
            },
        ),
    ),
```

Visit pub dot dev:

https://pub.dev/packages/circular_badge_avatar

## Need help?
IF you're still need help or want to help me to update or add more features do let me know. Ping me mailto:abdullahibnamukta or visit my portfolio

## Additional information
For more and help us to improve this package feel to 
Visit: https://github.com/muktabd/circular_badge_avatar.git

Visit me: www.muktabd.info

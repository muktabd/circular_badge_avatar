## Description
A useful flutter package to make a cicular avater with with badge. This widget redure to write a lots of code of adjustable cirular badge avater

## Features
Can change circular background color

Can set own letters

Able to chnage the badge color

Can set your own placeholder image

Able to adjust image picker icon top or bottom

And many more options are open to you, pick and use them

## Getting started
Just add this in your dependecies 
circular_badge_avatar:
 
and import this where you want to use the Widget
```dart
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
```

to use our helper class widget [if auto import not work] then copy and paste this in the import section. You can use any one of this two helper widgets
```dart
import 'package:circular_badge_avatar/helper/image_picker_dialog.dart';

import 'package:circular_badge_avatar/helper/bottomsheet_image_picker.dart';

```


## Usage
TO get a clear idea plese see at the example folder
to `/example` folder.



Here is an example how to use this widget in your code to show the info. You able to customize anything from this widget.
```dart
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
```

Here is an example how to use this widget when you want it to pick image and view. To use this widget you need to add *image_picker* package.
```dart
    SizedBox(
        height: 100,
        child: NetworkImageBadgeAvatar(
        imagePath: selectedImagePath,
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
            selectedImagePath = file;
            });
        },
        ),
    ),
```

## Additional information
For more and help us to improve this package feel to 
Visit: https://github.com/muktabd/circular_badge_avatar.git

Visit me: www.muktabd.info
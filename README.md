## Description
A useful flutter package to make a cicular avater with with badge. This widget redure you ro write a lots of code

## Features
Can change circular background color
Can set own letters
Able to chnage the badge color

## Getting started
Just add this in your dependecies 
circular_badge_avatar:
 
and import this where you want to use the Widget
```dart
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
```

## Usage
TO get a clear idea plese see at the example folder
to `/example` folder.

Here is an example how to use this widget in your code without badge icon
```dart
    CircularBadgeAvatar(
        centeralText: "OPTIONAL",
        textColor: Colors.white,
        bgColor: Colors.red,
        borderColor: Colors.blueGrey,
        ),
```

Here is an example how to use this widget in your code when you want as static widget
```dart
    StaticBadgeAvatar(
        centeralText: "STATIC",
        icon: Icons.info_outline_rounded,
        textColor: Colors.white,
        iconColor: Colors.lightBlue.shade900,
        icongBg: Colors.white,
        bgColor: Colors.red,
        borderColor: Colors.blueGrey,
        ),
```

Here is an example how to use this widget in your code to show the info
```dart
    InfoBadgeAvatar(
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
```

Here is an example how to use this widget when you want it to pick image and view
```dart
    ImageBadgeAvatar(
    //replace your image picker variable
        imagePath: _image,
        onPressed: () {
            log("Hello badge");
            // Call your image picker method
            //_imageHandler(ImageSource.gallery);
        },
    ),
```

## Additional information
For more and help us to improve this package feel to visit 
https://github.com/muktabd/circular_badge_avatar.git

Visit me: www.muktabd.info
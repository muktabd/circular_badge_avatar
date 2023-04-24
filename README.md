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



Here is an example how to use this widget in your code to show the info
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
        imagePath: _image,
        networkImage:
            "https://raw.githubusercontent.com/muktabd/public-images/main/user_placeholder.png",
        iconOnPressed: () {
            log("Hello badge");
            _imageHandler(ImageSource.gallery);
        },
        ),
    ),
```

## Additional information
For more and help us to improve this package feel to visit 
https://github.com/muktabd/circular_badge_avatar.git

Visit me: www.muktabd.info
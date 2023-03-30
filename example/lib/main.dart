import 'package:circular_badge_avatar/circular_badge_avatar.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Circular Badge Avatar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: CircularBadgeAvatar(
                centeralText: "AI",
                icon: Icons.info_outline_rounded,
                textColor: Colors.white,
                iconColor: Colors.lightBlue.shade900,
                icongBg: Colors.white,
                bgColor: Colors.red,
                borderColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

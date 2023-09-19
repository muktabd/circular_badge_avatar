import 'package:flutter/material.dart';

void showSuccessSnackBar({
  required String message,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green.shade900,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

void showErrorSnackBar({
  required String message,
  required BuildContext context,
}) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    content: Container(
      margin: const EdgeInsets.all(5),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
    backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showDefaultSnackBar({
  required String message,
  required BuildContext context,
}) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    content: Container(
      margin: const EdgeInsets.all(5),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
    backgroundColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSnackBarWithAction({
  required String message,
  required SnackBarAction action,
  required BuildContext context,
}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Container(
      margin: const EdgeInsets.all(5),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
    backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    action: action,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

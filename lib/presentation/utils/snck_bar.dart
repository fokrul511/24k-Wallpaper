import 'package:flutter/material.dart';

mySnkeBar(context,text, color) {
  return ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      backgroundColor:color,
      content: Text(text),
    ),
  );
}

import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  const FullImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      color: Colors.blue,
      child: Center(
          child: Text(
            'Set Wallpaper',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}

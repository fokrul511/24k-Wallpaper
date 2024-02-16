import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({super.key, required this.imageurl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.network(widget.imageurl, fit: BoxFit.cover),
              ),
            ),
            InkWell(
              onTap: () {
                print("hi");
              },
              child: Container(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

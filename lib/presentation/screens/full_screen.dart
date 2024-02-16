import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

import '../widgets/full_image.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({super.key, required this.imageurl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Image.network(widget.imageurl, fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDilog(context);
                },
                child: const FullImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> homeScreen() async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Wallpaper Set Successfuly'),
        ),
      );
      String url = widget.imageurl;
      int location = WallpaperManager
          .HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
    } on PlatformException {}
  }

  Future<void> loockScreen() async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Wallpaper Set Successfuly'),
        ),
      );
      String url = widget.imageurl;
      int location = WallpaperManager
          .BOTH_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
    } on PlatformException {}
  }

  showDilog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(

          child: Container(
            height: 100,
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      homeScreen();

                      Navigator.pop(context);
                    },
                    child: const Text('Set Home Screen')),
                TextButton(
                    onPressed: () {
                      loockScreen();
                      Navigator.pop(context);
                    },
                    child: const Text('Set Lock Screen')),
              ],
            ),
          ),
        );
      },
    );
  }
}

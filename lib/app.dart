import 'package:flutter/material.dart';
import 'package:wallpaper_apps/presentation/screens/splash_screen.dart';

class WallPaper extends StatelessWidget {
  const WallPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplasScreen(),
    );
  }
}


//api = S55UC3FqDvdLub9sNrYOJ9bdVPSgC5DmFTKfnkzmpqPzyH7oTyiGnGOW
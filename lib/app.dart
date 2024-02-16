import 'package:flutter/material.dart';
import 'package:wallpaper_apps/presentation/screens/home_screen.dart';

class WallPaper extends StatelessWidget {
  const WallPaper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


//api = S55UC3FqDvdLub9sNrYOJ9bdVPSgC5DmFTKfnkzmpqPzyH7oTyiGnGOW
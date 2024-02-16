import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wallpaper_apps/presentation/model/data.dart';
import 'package:wallpaper_apps/presentation/screens/full_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Wallpaper> wallpaperList = [];

class _HomeScreenState extends State<HomeScreen> {
  bool isLodingScreen = false;
  int page = 1;

  @override
  void initState() {
    getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('24k Wallpaper'),
      ),
      body: Visibility(
        visible: isLodingScreen == false,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: wallpaperList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreen(
                                imageurl: wallpaperList[index].large2x ?? ""),
                          ),
                        );
                      },
                      child: Container(

                        child: CachedNetworkImage(
                          imageUrl: wallpaperList[index].image.toString(),

                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _loagMorePage();
                print("hi");
              },
              child: Container(
                height: 44,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                    child: Text(
                  'Load More',
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

  Future<void> getApi() async {
    isLodingScreen = true;
    setState(() {});
    Uri url = Uri.parse('https://api.pexels.com/v1/curated?per_page=80');
    Response response = await get(
      url,
      headers: {
        "Authorization":
            "S55UC3FqDvdLub9sNrYOJ9bdVPSgC5DmFTKfnkzmpqPzyH7oTyiGnGOW"
      },
    );
    if (response.statusCode == 200) {
      var deocdedBody = jsonDecode(response.body);
      var list = deocdedBody['photos'];
      for (var item in list) {
        Wallpaper wallpaper = Wallpaper(
            id: item['id'],
            image: item['src']['large'],
            photographer: item['photographer'],
            large2x: item['src']['large2x']);
        wallpaperList.add(wallpaper);
        isLodingScreen = false;
        setState(() {});
      }
      setState(() {});
    }
    // print(response);
    // print(response.statusCode);
    // print(response.body);
  }

  _loagMorePage() async {
    setState(() {
      page = page + 1;
    });
    Uri url =
        Uri.parse("https://api.pexels.com/v1/curated?per_page=80&page=$page");
    Response response = await get(
      url,
      headers: {
        "Authorization":
            "S55UC3FqDvdLub9sNrYOJ9bdVPSgC5DmFTKfnkzmpqPzyH7oTyiGnGOW"
      },
    );
    if (response.statusCode == 200) {
      var deocdedBody = jsonDecode(response.body);
      var list = deocdedBody['photos'];
      for (var item in list) {
        Wallpaper wallpaper = Wallpaper(
          id: item['id'],
          image: item['src']['large'],
          photographer: item['photographer'],
        );
      }
      setState(() {});
    }
  }
}

// NetworkImage(
// wallpaperList[index].image.toString(),
// ),

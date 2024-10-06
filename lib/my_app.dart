import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'screens/playlist_screen.dart';
import 'screens/song_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page:()=> const HomeScreen()),
        GetPage(name: '/song', page:()=> const SongScreen()),
        GetPage(name: '/playlist', page:()=> const PlayListScreen()),
      ],
    );
  }
}

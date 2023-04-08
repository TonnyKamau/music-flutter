import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        // GetPage(name: '/song', page: () => const SongScreen()),
        // GetPage(name: '/playlist', page: () => const PlaylistScreen()),
      ],
    );
  }
}



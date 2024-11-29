// import 'package:custom_painter/presentation/challenges/animated_square_screen.dart';
// import 'package:custom_painter/presentation/labs/circular_progress_screen.dart';
// import 'package:custom_painter/presentation/screens/circular_graphics_screen.dart';
// import 'package:custom_painter/presentation/screens/animations_screen.dart';
// import 'package:custom_painter/presentation/screens/header_screen.dart';
// import 'package:custom_painter/presentation/screens/emergency_screen.dart';
// import 'package:custom_painter/presentation/screens/pinteres_screen.dart';
import 'package:custom_painter/presentation/screens/sliver_list.dart';
// import 'package:custom_painter/presentation/screens/slideshow_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SliverListScreen(),
    );
  }
}

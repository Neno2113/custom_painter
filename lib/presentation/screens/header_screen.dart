import 'package:custom_painter/presentation/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WaveHeaderBelow(),
    );
  }
}
import 'package:custom_painter/presentation/widgets/emergency_header.dart';
import 'package:flutter/material.dart';



class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(),
    );
  }
}
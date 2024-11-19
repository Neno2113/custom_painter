

import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({super.key});

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MyRadialProgressPainter(),
          ),
        ),
      ),
    );
  }
}


class _MyRadialProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {



    // Circulo completado
    final pencil = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, pencil);



    // Arco
    final pencilArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * ( porcentaje / 100 );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), 
      -pi / 2, 
      arcAngle, 
      false, 
      pencilArc
    );


  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
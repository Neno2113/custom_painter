import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;

  const RadialProgress({super.key, this.porcentaje});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  double previousPercentage = 0.0;

  @override
  void initState() {

    previousPercentage = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final differenceToAnimate = widget.porcentaje - previousPercentage;
    previousPercentage = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {

        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgressPainter( ( widget.porcentaje - differenceToAnimate ) + ( differenceToAnimate * controller.value) ),
          ),
        );
      },
    );

  }
}


class _MyRadialProgressPainter extends CustomPainter {
  

  final porcentaje;

  _MyRadialProgressPainter( this.porcentaje );

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
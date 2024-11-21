import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color primaryColor;
  final Color secondaryColor;
  final double strokeWidth;
  final double primaryStrokeWidth;

  const RadialProgress({
    super.key, 
    @required this.porcentaje,  
    this.secondaryColor = Colors.grey,
    this.primaryColor = Colors.blue,
    this.strokeWidth = 4,
    this.primaryStrokeWidth = 4
  });

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
            painter: _MyRadialProgressPainter( 
              ( widget.porcentaje - differenceToAnimate ) + ( differenceToAnimate * controller.value),
              widget.primaryColor, 
              widget.secondaryColor,
              widget.strokeWidth,
              widget.primaryStrokeWidth
            ),
          ),
        );
      },
    );

  }
}


class _MyRadialProgressPainter extends CustomPainter {
  

  final porcentaje;
  final Color primaryColor;
  final Color secondaryColor;
  final double strokeWidth;
  final double primaryStrokeWidth;

  _MyRadialProgressPainter( 
    this.porcentaje, 
    this.primaryColor, 
    this.secondaryColor,
    this.strokeWidth,
    this.primaryStrokeWidth
  );

  @override
  void paint(Canvas canvas, Size size) {

    final Gradient gradient = const LinearGradient(
      colors: <Color>[
        Color(0xffC012FF),
        Color(0xff6d05e8),
        Colors.red,
        // Colors.blue,
        // Colors.yellow
      ] 
    );

    final Rect rect = Rect.fromCircle(
      center: const Offset(0,0) , 
      radius: 180
    );

    // Circulo completado
    final pencil = Paint()
      ..strokeWidth = strokeWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, pencil);



    // Arco
    final pencilArc = Paint()
      ..strokeWidth = primaryStrokeWidth
      // ..color = primaryColor
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
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
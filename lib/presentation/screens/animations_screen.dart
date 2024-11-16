import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {


  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> fadeOut;
  late Animation<double> moveToRight;
  late Animation<double> resize;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut)
    );

    opacity = Tween(begin : 0.1, end: 1.0).animate(
       CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.easeOut))
    );

    fadeOut = Tween(begin:1.0, end: 0.1).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    moveToRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, 
      curve: Curves.easeOut)
    );


    resize = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, 
      curve: Curves.easeOut)
    );



    controller.addListener(() {

      // print('Status: ${controller.status}');

      if( controller.status == AnimationStatus.completed){
        controller.reverse();
        // controller.reset();
      } 
    });

    super.initState();
  }


  @override
  void dispose() {

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();


    return AnimatedBuilder(
      animation: controller,
      child: const _Rectangulo(),
      builder: (BuildContext context, Widget? child) {

        return Transform.translate(
          offset: Offset(moveToRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value,
              child: Opacity(
                opacity: fadeOut.value,
                child: Transform.scale(
                  scale: resize.value,
                  child: child,
                
                ),
              ),
            ),
          
          ),
        );

      },
    ); 
  }
}





class _Rectangulo extends StatelessWidget {
  const _Rectangulo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
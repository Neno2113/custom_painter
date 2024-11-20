import 'package:flutter/material.dart';




class AnimatedSquareScreen extends StatelessWidget {
  const AnimatedSquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _AnimatedSquare()
        )
      );
  }
}

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare();

  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare> with SingleTickerProviderStateMixin {


  late AnimationController controller;
  late Animation<double> slide;
  late Animation<double> slideUp;
  late Animation<double> slideLeft;
  late Animation<double> slideDown;


  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    slide = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.bounceOut))
    );

    slideUp = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut))
    );

    slideLeft = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut))
    );

    slideDown = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.bounceOut))
    );

    controller.addListener(() {

      // print('Status: ${controller.status}');

      if( controller.status == AnimationStatus.completed){
        controller.reset();
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
          offset: Offset(slide.value * 0.70, 0),
          child: Transform.translate(
            offset: Offset(0, slideUp.value * - 0.75),
            child: Transform.translate(
              offset: Offset(-slideLeft.value * 0.70, 0),
              child: Transform.translate(
                offset: Offset(0, slideDown.value * 0.75),
                child: child
              )
            ),
          )
        );
      }
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
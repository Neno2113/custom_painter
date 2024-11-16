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
  const _AnimatedSquare({
    super.key,
  });

  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare> {


  late AnimationController controller;

  @override
  void initState() {

    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const _Rectangulo();
  }
}



class _Rectangulo extends StatelessWidget {
  const _Rectangulo({super.key});

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
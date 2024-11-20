

import 'package:custom_painter/presentation/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularGraphcsScreen extends StatefulWidget {
  const CircularGraphcsScreen({super.key});

  @override
  State<CircularGraphcsScreen> createState() => _CircularGraphcsScreenState();
}

class _CircularGraphcsScreenState extends State<CircularGraphcsScreen> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.refresh, color: Colors.white,),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          // color: Colors.red,
          child: RadialProgress( porcentaje: porcentaje ),
        ),
      ),
    );
  }
}


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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, primaryColor: Colors.blueAccent),
              CustomRadialProgress(porcentaje: porcentaje, primaryColor: Colors.redAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, primaryColor: Colors.purpleAccent),
              CustomRadialProgress(porcentaje: porcentaje, primaryColor: Colors.greenAccent),
            ],
          )
        ],
      ) ,
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color primaryColor;

  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    required this.primaryColor
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      // color: Colors.red,
      child: RadialProgress( 
        porcentaje: porcentaje,
        primaryColor: primaryColor,
        secondaryColor: Colors.black38,
        primaryStrokeWidth: 10,
        strokeWidth: 4,
      ),
    );
  }
}
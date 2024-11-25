



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {

  IconHeader({super.key});

  Color whiteColor = Colors.white.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _IconHeaderBackground(),

        const Positioned(
          top: -50,
          left: -70,
          child: FaIcon( FontAwesomeIcons.plus, size: 250, color: Colors.white10,)
        ),
        Column(
          children: [
            const SizedBox( height: 80, width: double.infinity,),
            Text('Haz solicitado', style: TextStyle(fontSize: 20, color: whiteColor),),
            const SizedBox( height: 20,),
            const Text('Asistencia medica', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
            const SizedBox( height: 20,),
            const FaIcon( FontAwesomeIcons.plus, size: 80, color: Colors.white,)

          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
      // color: Colors.red,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff526bf6),
          Color(0xff67acf2),
        ]
      )
    
      ),
    );
  }
}




import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  const IconHeader({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.subtitle, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey
  });


  @override
  Widget build(BuildContext context) {


    Color whiteColor = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderBackground(color1, color2),

        Positioned(
          top: -50,
          left: -70,
          child: FaIcon( icon, size: 250, color: Colors.white10,)
        ),
        Column(
          children: [
            const SizedBox( height: 80, width: double.infinity,),
            Text(subtitle, style: TextStyle(fontSize: 20, color: whiteColor),),
            const SizedBox( height: 20,),
            Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
            const SizedBox( height: 20,),
            FaIcon( icon, size: 80, color: Colors.white,)

          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderBackground(this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
      // color: Colors.red,
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color1,
          color2
        ]
      )
    
      ),
    );
  }
}
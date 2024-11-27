import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {


  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function onPress;

  const FatButton({
    super.key, 
    this.icon = FontAwesomeIcons.circle, 
    required this.text, 
    this.color1 = Colors.blue, 
    this.color2 = Colors.blueGrey, 
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress as GestureTapCallback,
      child: Stack(
        children: [
          _FatButtonBackground(color1, color2, icon),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox( height: 140, width: 40,),
              FaIcon( icon, size: 40, color: Colors.white,),
              const SizedBox( width: 20,),
              Expanded(child: Text(text, style: const TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),)),
              const FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white,),
              const SizedBox( width: 40,),
            ],
          )
        ],
      ),
    );
  }
}

class _FatButtonBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;

  const _FatButtonBackground(this.color1, this.color2, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(


      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color1,
            color2
          ]
        )
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              child: FaIcon( icon, size: 150, color: Colors.white.withOpacity(0.2),),
              top: -20,
              right: -20,
            )
          ],
        ),
      ),
    );
  }
}
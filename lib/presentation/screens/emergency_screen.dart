import 'package:custom_painter/presentation/widgets/emergency_header.dart';
import 'package:custom_painter/presentation/widgets/fat_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

  class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}


class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final items = <ItemBoton>[
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
    ];
    
    List<Widget> itemMap = items.map((item) => FatButton(
      text: item.texto,
      icon: item.icon,
      color1: item.color1,
      color2: item.color2,
      onPress: (){
        print('Motor Accident');
      },
    )).toList();

    return Scaffold(
      // backgroundColor: Colors.redAccent,
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(
              physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox( height: 80,),
              ...itemMap    
            ],
                    ),
          ),
          const _Header(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {


  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        const IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia Médica',
          subtitle: 'Haz solicitado',
          color1: Colors.redAccent,
          color2: Colors.black87,
        ),

        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: (){},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            child: 
            const FaIcon( 
              FontAwesomeIcons.ellipsisVertical, color: Colors.white,
            )
          ), 
        )
      ],
    );
  }
}

class FatButtonTemp extends StatelessWidget {
  const FatButtonTemp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FatButton(
      text: 'Motor Accident',
      icon: FontAwesomeIcons.carBurst,
      color1: Colors.redAccent,
      color2: Colors.black87,
      onPress: (){
        print('Motor Accident');
      },
    );
  }
}

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Emergencia',
      subtitle: 'Haz solicitado',
      color1: Colors.redAccent,
      color2: Colors.black87,
    );
  }
}
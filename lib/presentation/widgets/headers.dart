import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}



class CircularBorderHeader extends StatelessWidget {
  const CircularBorderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        color: Color(0xff615AAB),       
      ),
    );
  }
}



class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();

    // Propiedades
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; //stroke or fill
    pencil.strokeWidth = 2;

    final path = Path();

    // Dibujar con el path y el lápiz  
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }



}





class TrangularlHeader extends StatelessWidget {
  const TrangularlHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _TrangularlHeaderPainter(),
      ),
    );
  }
}

class _TrangularlHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();

    // Propiedades
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; //stroke or fill
    pencil.strokeWidth = 25;

    final path = Path();

    // Dibujar con el path y el lápiz  
    path.moveTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(size.width, size.height);


    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }



}



class PicoHeader extends StatelessWidget {
  const PicoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _PicolHeaderPainter(),
      ),
    );
  }
}

class _PicolHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();

    // Propiedades
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; //stroke or fill
    pencil.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lápiz  
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5 , size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // path.lineTo(size.width, size.height);


    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}



class CurveHeader extends StatelessWidget {
  const CurveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _CurveHeaderPainter(),
      ),
    );
  }
}

class _CurveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();

    // Propiedades
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; //stroke or fill
    pencil.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lápiz  
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo( size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // path.lineTo(size.width, size.height);


    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}



class WaveHeader extends StatelessWidget {
  const WaveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _WaveHeaderPainter(),
      ),
    );
  }
}

class _WaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();

    // Propiedades
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; //stroke or fill
    pencil.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lápiz  
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo( size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo( size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // path.lineTo(size.width, size.height);


    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}





class WaveHeaderBelow extends StatelessWidget {
  const WaveHeaderBelow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _WaveHeaderBelowPainter(),
      ),
    );
  }
}

class _WaveHeaderBelowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final pencil = Paint();

    // Propiedades
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; //stroke or fill
    pencil.strokeWidth = 20;

    final path = Path();

    // Dibujar con el path y el lápiz  

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo( size.width * 0.25, size.height * 0.70, size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo( size.width * 0.70, size.height * 0.80, size.width, size.height * 0.75);
    path.lineTo(size.width, size.height);
    // // path.lineTo(size.width, size.height * 0.25);
    // path.quadraticBezierTo( size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    // path.quadraticBezierTo( size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);



    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
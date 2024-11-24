


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotsTop;
  final Color primaryColor;
  final Color secondaryColor;
  final int primaryBullet;
  final int secondaryBullet;


  const Slideshow({
    super.key, 
    required this.slides,
    this.dotsTop = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey, 
    this.primaryBullet = 12, 
    this.secondaryBullet = 12
  });

  @override
  Widget build(BuildContext context) {
    

    return ChangeNotifierProvider(
      create: (_) => _SlideshowProvider()
        ..primaryColor = primaryColor
        ..secondaryColor = secondaryColor
        ..primaryBullet = primaryBullet
        ..secondaryBullet = secondaryBullet
      ,
      child: SafeArea(
        child: Center(
            child: _CreateStructurerSlideshow(
              dotsTop: dotsTop,
              slides: slides,
            ),
          ),
      ),

    );
  }
}

class _CreateStructurerSlideshow extends StatelessWidget {
  const _CreateStructurerSlideshow({
    required this.dotsTop,
    required this.slides,
  });

  final bool dotsTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if( dotsTop ) 
          _Dots(slides.length),
        Expanded(
          child: _Slides( slides )
        ),
        if( !dotsTop ) 
          _Dots(slides.length),
      ],
    );
  }
}






class _Dots extends StatelessWidget {

  final int totalSlides;
  // final Color primaryColor;
  // final Color secondaryColor;
  
  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate( totalSlides, (index) => _Dot(index) ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;


  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    // final pageViewIndex = Provider.of<_SlideshowProvider>(context).currenPage;
    final slideShowProvider = Provider.of<_SlideshowProvider>(context);
    double size = 0;
    Color color;

 

    if(slideShowProvider._currentPage >= index - 0.5 && slideShowProvider._currentPage < index + 0.5) {

      size = slideShowProvider._primaryBullet.toDouble();
      color = slideShowProvider._primaryColor;
    } else {
      size = slideShowProvider._secondaryBullet.toDouble();  
      color = slideShowProvider._secondaryColor;
    }
    

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color, 
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides( this.slides );

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewcontroller = PageController();


  @override
  void initState() {
    pageViewcontroller.addListener(() {

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<_SlideshowProvider>(context, listen: false).currentPage = pageViewcontroller.page!;


      });

    });
    
    super.initState();
  }


  @override
  void dispose() {
    pageViewcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    

    return PageView(
      controller: pageViewcontroller,
      children: widget.slides.map( (slide ) => _Slide( slide ) ).toList(),
      // children: [
      //   const _Slide('assets/svgs/slide-1.svg'),
      //   const _Slide('assets/svgs/slide-2.svg'),
      //   const _Slide('assets/svgs/slide-3.svg'),
      // ],
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child:  slide,
    );
  }
}











class _SlideshowProvider with ChangeNotifier {

  double _currentPage   = 0;
  Color _primaryColor   = Colors.blue;
  Color _secondaryColor = Colors.grey;
  int _primaryBullet    = 12;
  int _secondaryBullet    = 12;

  double get currenPage => _currentPage;

  set currentPage( double newCurrentPage ) {
    _currentPage = newCurrentPage;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;

  set primaryColor( Color newColor ) {
    _primaryColor = newColor;
    notifyListeners();
  }

  Color get secondaryColor => _secondaryColor;

  set secondaryColor( Color newColor ) {
    _secondaryColor = newColor;
    notifyListeners();
  }

  int get primaryBullet => _primaryBullet; 

  set primaryBullet( int newBullet ) {
    _primaryBullet = newBullet;
    notifyListeners();
  } 

  int get secondaryBuller => _secondaryBullet; 

  set secondaryBullet( int newBullet ) {
    _secondaryBullet = newBullet;
    notifyListeners();
  } 

}
import 'package:custom_painter/presentation/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




class SlideshowScreen extends StatelessWidget {
  const SlideshowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.accents[1],
      body: Column(
        children: [
          Expanded(child: MySlideShow()),
          Expanded(child: MySlideShow()),
        ],
      ),
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slideshow( 
      primaryBullet: 20,
      secondaryBullet: 12,
      dotsTop: false,
      primaryColor: const Color(0xffFF5A7E),
      secondaryColor: Colors.grey,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
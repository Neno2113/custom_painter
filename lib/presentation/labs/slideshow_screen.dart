
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:custom_painter/presentation/providers/slider_model.dart';

class SlideshowScreen extends StatelessWidget {
  const SlideshowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
      
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: _Slides()
              ),
               const _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}


class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 70,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currenPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: ( pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5 ) 
              ? const Color.fromARGB(218, 179, 42, 85) : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {


  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewcontroller = PageController();


  @override
  void initState() {
    super.initState();

    pageViewcontroller.addListener(() {
      // print('Pagina actual: ${pageViewcontroller.page}');
      // Actulizar provider
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewcontroller.page!;
    });
    
  }


  @override
  void dispose() {
    pageViewcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewcontroller,
        children: [
          const _Slide('assets/svgs/slide-1.svg'),
          const _Slide('assets/svgs/slide-2.svg'),
          const _Slide('assets/svgs/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide(this.svg );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child:  SvgPicture.asset(svg),
    );
  }
}
import 'package:custom_painter/presentation/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestScreen extends StatelessWidget {
  const PinterestScreen({super.key});


  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_) => _MenuState(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ) ,
      
        // body: 
          // child: PinterestMenu(),
          // child: PinterestGrid(),
        
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation();


  @override
  Widget build(BuildContext context) {

    final widthSceen = MediaQuery.of(context).size.width;

    final show = Provider.of<_MenuState>(context).mostrar;

    return Positioned(
      bottom: 30,
      child: Container(
        // color: Colors.red,
        width: widthSceen,
        child: Align(
          alignment: Alignment.center,
          child: PinterestMenu(
            items: [
              PinterestButton(onPressed: (){ print('Icon pie_chart');}, icon: Icons.pie_chart),
              PinterestButton(onPressed: (){ print('Icon search');}, icon: Icons.search),
              PinterestButton(onPressed: (){ print('Icon notifications');}, icon: Icons.notifications),
              PinterestButton(onPressed: (){ print('Icon supervised_user_circle');}, icon: Icons.supervised_user_circle),
            ],
            show: show,
            backgroundColor: Colors.white,
            activeColor: Colors.red,
            inactiveColor: Colors.black54,
          ),
        ),
        // child: PinterestMenu(),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {


  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  // const PinterestGrid({super.key});
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double prevoiusScroll = 0;

  @override
  void initState() {

    controller.addListener(() {

      if( controller.offset > prevoiusScroll  && controller.offset > 150 ){
        Provider.of<_MenuState>(context, listen: false).mostrar = false;
        // print('Ocultar menu');
      } else {
        Provider.of<_MenuState>(context, listen: false).mostrar = true;
        // print('Mostrar menu');
      }

      prevoiusScroll = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      itemCount: items.length,
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        return _PinterestItem(
          index: index,
          extent: (index % 3 + 2) * 100,
        );
      },
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  
  final int extent;

  const _PinterestItem({super.key, required this.index, required this.extent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: extent.toDouble(),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            '$index',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}




class _MenuState with ChangeNotifier {

  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool newValue) {
    _mostrar = newValue;
    notifyListeners();
  }
}
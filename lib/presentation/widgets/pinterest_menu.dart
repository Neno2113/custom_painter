import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({ required this.onPressed, required this.icon});
}



class PinterestMenu extends StatelessWidget {

  // final List<PinterestButton> items = [
  //   PinterestButton(onPressed: (){ print('Icon pie_chart');}, icon: Icons.pie_chart),
  //   PinterestButton(onPressed: (){ print('Icon search');}, icon: Icons.search),
  //   PinterestButton(onPressed: (){ print('Icon notifications');}, icon: Icons.notifications),
  //   PinterestButton(onPressed: (){ print('Icon supervised_user_circle');}, icon: Icons.supervised_user_circle),
  // ];

  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;


  PinterestMenu({
    super.key,  
    this.show = true, 
    this.backgroundColor = Colors.white, 
    this.activeColor = Colors.red, 
    this.inactiveColor = Colors.blueGrey,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuState()
        // ..backgroundColor = backgroundColor
        // ..activeColor = activeColor
        // ..inactiveColor = inactiveColor
      ,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: ( show ) ? 1 : 0,
        child: Builder(
          builder: (context) {

            Provider.of<_MenuState>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuState>(context).activeColor = activeColor;
            Provider.of<_MenuState>(context).inactiveColor = inactiveColor;

            return _PinterestMenuBackground( 
              child: _MenuItems(items),
            );
          }
        ),
      )
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    final backgroundColor = Provider.of<_MenuState>(context).backgroundColor;

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            // offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: -5
          )
        ],
      ),
      child: child,
    );
  }
}


class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index])),
    );
      
  }
}

class _PinterestMenuButton extends StatelessWidget {
  
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton( this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final menuState = Provider.of<_MenuState>(context);

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuState>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon( 
          item.icon,
          size: ( menuState.itemSelected == index ) ? 35 : 25, 
          color: ( menuState.itemSelected == index ) ? menuState.activeColor : menuState.inactiveColor,
        ),
      ),
    );
  }
}


class _MenuState with ChangeNotifier {

  int _itemSelected = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.red;
  Color _inactiveColor = Colors.blueGrey;


  int get itemSelected => _itemSelected;

  set itemSelected(int index) {
    _itemSelected = index;
    notifyListeners();
  }

  Color get backgroundColor => _backgroundColor;

  set backgroundColor(Color newColor) {
    _backgroundColor = newColor;
    // notifyListeners();
  }
  Color get activeColor => _activeColor;

  set activeColor(Color newColor) {
    _activeColor = newColor;
    // notifyListeners();
  }


  Color get inactiveColor => _inactiveColor;

  set inactiveColor(Color newColor) {
    _inactiveColor = newColor;
    // notifyListeners();
  }


}
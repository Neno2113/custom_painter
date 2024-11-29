import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          _MainScroll(),
          Positioned(
            bottom: -10,
            right: -30,
            child: _ButtonNewList()
          ),
        ],
      ),
    );
  }
}



class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return ButtonTheme(
      minWidth: size.width * 0.9,
      child: ElevatedButton(
        onPressed: () {
          
        }, 
        child: Container(
          width: size.width * 0.9,
          height: 100,
          alignment: Alignment.center,
          child: const Text('CREATE NEW LIST', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          decoration: BoxDecoration(
            color: const Color(0xffed6762),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
          ),
        ),
      )
    );
  }
}


class _MainScroll extends StatelessWidget {

  final items = [
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
  _MainScroll();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: const Text('Hola Mundo'),
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: const _Title()
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100)

          ])
        )

      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight, 
    required this.maxHeight, 
    required this.child
  });
  

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

      return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent || minHeight != oldDelegate.minExtent || child != oldDelegate.child;
  }

}


class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text('New', style: const TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,

            ),
            const Text('List', style: TextStyle(color: Color(0xfffd93a30), fontSize: 40, fontWeight: FontWeight.bold )),
            Positioned(
              bottom: 8 ,
              child: Container(
                width: 120,
                height: 8,
                color: const Color(0xfff7cdd5),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _TaskLists extends StatelessWidget {

  final items = [
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
  _TaskLists();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {

  final String title;
  final Color color;

  const _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      // color: Colors.red,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
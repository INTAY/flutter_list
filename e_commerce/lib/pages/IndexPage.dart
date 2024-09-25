 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'my_page.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
   onBottomBar() {}

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      label: '分类'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: '购物',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.my_location),
      label: '我的',
    ),
  ];

   final List tabPages = [
     HomePages(),
     CategoryPage(),
     CartPage(),
     MyPage(),
   ];
   int currentIndex = 0;
   late Widget currentPage;
   @override
   void initState() {
    // TODO: implement initState
     currentPage = tabPages[currentIndex];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('博物馆里有什么'),
        leading: Icon(Icons.add),
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          mouseCursor: MouseCursor.uncontrolled,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabPages[index];
          });
        },
        currentIndex: currentIndex,
        items: bottomTabs,
      ),
    );
  }

}

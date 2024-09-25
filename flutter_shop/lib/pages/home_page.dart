import 'package:flutter/material.dart';
import 'package:flutter_shop/const.dart';
import 'package:flutter_shop/components/bottom_nav_bar.dart'; // 引入底部导航栏
import 'package:flutter_shop/pages/cart_page.dart'; // 引入购物车模块
import 'package:flutter_shop/pages/shop_page.dart'; // 引入商店模块


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 底部导航栏切换
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }
  // 模块类型
  final List<Widget> _pages = [
    // 商店
    ShopPage(),
    // 购物车
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import 'input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(title: Text('Home'), icon: Icon(Icons.home)),
    TitledNavigationBarItem(title: Text('Search'), icon: Icon(Icons.search)),
    TitledNavigationBarItem(title: Text('Bag'), icon: Icon(Icons.card_travel)),
    TitledNavigationBarItem(title: Text('Orders'), icon: Icon(Icons.shopping_cart)),
    TitledNavigationBarItem(title: Text('Profile'), icon: Icon(Icons.person_outline)),
  ];

  bool navBarMode = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CustomTextField(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          // bottomNavigationBar: BottomNavyBar(
          //   selectedIndex: _currentIndex,
          //   showElevation: true,
          //   itemCornerRadius: 24,
          //   curve: Curves.easeIn,
          //   onItemSelected: (index) => setState(() => _currentIndex = index),
          //   items: <BottomNavyBarItem>[
          //     BottomNavyBarItem(
          //       icon: Icon(Icons.apps),
          //       title: Text('Home'),
          //       activeColor: Colors.red,
          //       textAlign: TextAlign.center,
          //     ),
          //     BottomNavyBarItem(
          //       icon: Icon(Icons.people),
          //       title: Text('Users'),
          //       activeColor: Colors.purpleAccent,
          //       textAlign: TextAlign.center,
          //     ),
          //     BottomNavyBarItem(
          //       icon: Icon(Icons.message),
          //       title: Text(
          //         'Messages test for mes teset test test ',
          //       ),
          //       activeColor: Colors.pink,
          //       textAlign: TextAlign.center,
          //     ),
          //     BottomNavyBarItem(
          //       icon: Icon(Icons.settings),
          //       title: Text('Settings'),
          //       activeColor: Colors.blue,
          //       textAlign: TextAlign.center,
          //     ),
          //   ],
          // ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 40.0,
            items: <Widget>[
              Icon(Icons.add, size: 30),
              Icon(Icons.list, size: 30),
              Icon(Icons.compare_arrows, size: 30),
              Icon(Icons.call_split, size: 30),
              Icon(Icons.perm_identity, size: 30),
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.blue,
            // backgroundColor: Colors.blueAccent,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            letIndexChange: (index) => true,
          ),
          // bottomNavigationBar: BottomNavyBar(
          //   selectedIndex: _currentIndex,
          //   onItemSelected: (index) {
          //     setState(() => _currentIndex = index);
          //     // _pageController.jumpToPage(index);
          //   },
          //   items: <BottomNavyBarItem>[
          //     BottomNavyBarItem(
          //         title: Text('Item One'),
          //         icon: Icon(Icons.home)
          //     ),
          //     BottomNavyBarItem(
          //         title: Text('Item Two'),
          //         icon: Icon(Icons.apps)
          //     ),
          //     BottomNavyBarItem(
          //         title: Text('Item Three'),
          //         icon: Icon(Icons.chat_bubble)
          //     ),
          //     BottomNavyBarItem(
          //         title: Text('Item Four'),
          //         icon: Icon(Icons.settings)
          //     ),
          //   ],
          // ),
          // bottomNavigationBar: TitledBottomNavigationBar(
          //   onTap: (index) => print("Selected Index: $index"),
          //   reverse: navBarMode,
          //   curve: Curves.easeInBack,
          //   items: items,
          //   activeColor: Colors.red,
          //   inactiveColor: Colors.blueGrey,
          // ),
        ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/models/coffee_shop.dart';
import  'package:flutter_shop/pages/home_page.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, index) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ) ,
    );
  }

}



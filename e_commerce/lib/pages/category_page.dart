import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆页面'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "请输入用户名",
                    // icon: Icon(Icons.people),
                    hintText: "请输入用户名",
                    prefixIcon: Icon(Icons.people_alt_rounded)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

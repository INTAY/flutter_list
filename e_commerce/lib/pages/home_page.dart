import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
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
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                  hintText: "请输入密码",
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(

                    onPressed: () {
                      getHttp();
                    },
                    child: Text('点击我'),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getHttp();
  }

  Future getHttp() async {
    print('点击1 ');
    try {
      final dio = Dio();
      final response = await dio.get('https://mockapi.eolink.com/fPGFxf27dc20bb0f3ede6de40fcbc18648a845cb2828350/user/points.php?responseId=1561655');
      // print(jsonDecode(response.data).points);
      Map<String, dynamic> res = jsonDecode(response.data);
       print("点击${res['points']} ${res['name']}");
       // return respones.data;
    } catch(e) {
      print('错误${e}');
    }
  }
}

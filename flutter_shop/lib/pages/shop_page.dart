import 'package:flutter/material.dart';
import 'package:flutter_shop/components/coffee_title.dart';
import 'package:flutter_shop/models/coffee_shop.dart';
import 'package:flutter_shop/models/coffee.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCard(Coffee coffee) {
    Provider.of<CoffeeShop>(context,listen: false).addItemToCart(coffee);
  }
  @override
  Widget build(BuildContext context) {
    print(context);
    return Consumer<CoffeeShop>(
        builder: (context, value, child ) => SafeArea(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Text('热饮商店 欢迎购物', style: TextStyle(fontSize: 25)),
                SizedBox(height: 25),
                Expanded(
                    child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (BuildContext context,int index) {
                        // // 获取每一个热饮的信息
                        Coffee eachCoffee = value.coffeeShop[index];
                        return CoffeeTitle(coffee: eachCoffee, Icon: Icon(Icons.add), onPressed: () => addToCard(eachCoffee));
                      }
                    )
                )
          ],
        ),
      ),
    ));

  }
}

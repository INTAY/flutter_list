import 'package:flutter/material.dart';
import 'package:flutter_shop/models/coffee.dart';
import 'package:flutter_shop/models/coffee_shop.dart';
import 'package:provider/provider.dart';

import '../components/coffee_title.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFormCard(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemToCart(coffee);
    // 删除后提醒
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('${coffee.name}已经取消订单',style: TextStyle(backgroundColor: Colors.grey[200]),),
    ));
  }
  void onPayNow() {}
  @override
  Widget build(BuildContext context) {
    
    return Consumer<CoffeeShop>(builder: (context, value, child) => SafeArea(
      child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Text('购物车', style: TextStyle(fontSize: 20)),
              Expanded(
                  child: ListView.builder(
                    itemCount: value.userCart.length ,
                      itemBuilder: (context, index) {
                    Coffee eachCoffee = value.userCart[index];
                    return CoffeeTitle(coffee: eachCoffee, Icon: Icon(Icons.delete), onPressed: () => removeFormCard(eachCoffee));
                  }),
              ),
              GestureDetector(
                onTap: onPayNow,
                child: Container(
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                  child: Center(
                    child:  Text('付款', style: TextStyle(color: Colors.white)),
                  ),

                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(15)
                  ),

                ),
              )
            ],
          ),
      ),
    ));
  }
}

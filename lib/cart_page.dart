// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:online_food_app/colors.dart';
import 'package:online_food_app/place_order.dart';

class CartPage extends StatefulWidget {
  final String imagePath;
  final String name;
  final String price;

  CartPage(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _itemCount = 0;

  incrementCounter() {
    _itemCount++;
    return _itemCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Row(
            children: [
              Container(
                child: Image.asset(widget.imagePath,
                    height: 150, width: 150, fit: BoxFit.cover),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Column(
                  children: [Text(widget.name), Text('RS ${widget.price}')],
                ),
              ),
              SizedBox(width: 100),
              Container(
                child: Text(incrementCounter().toString()),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amberAccent)),
                    onPressed: () {
                      // incrementCounter();
                      print(incrementCounter());
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlaceOrder()));
              },
              child: Text(
                "Place an Order",
                style: TextStyle(color: Colors.black),
              )),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_food_app/cart_page.dart';
import 'package:online_food_app/colors.dart';
import 'package:online_food_app/constant.dart';
import 'package:online_food_app/style.dart';

class FoodDetail extends StatelessWidget {
  final String imagePath;
  final String name;
  final String weight;
  final String star;
  final String price;

  const FoodDetail(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.weight,
      required this.star,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage(imagePath: imagePath, name: name, price: price)))
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white),
                  )),
              Icon(Icons.chevron_right)
            ],
          ),
          style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          customAppBar(context),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: name,
                  size: 45,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/dollar.svg',
                      color: AppColors.tertiary,
                      width: 15,
                    ),
                    PrimaryText(
                      text: price,
                      size: 48,
                      fontWeight: FontWeight.w700,
                      color: AppColors.tertiary,
                      height: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            PrimaryText(
                              text: 'Size',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: weight, fontWeight: FontWeight.w600),
                            SizedBox(
                              height: 20,
                            ),
                            PrimaryText(
                              text: 'Crust',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: 'Thin Crust',
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: 20,
                            ),
                            PrimaryText(
                              text: 'Delivery in',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: '30 min', fontWeight: FontWeight.w600),
                          ]),
                    ),
                    Hero(
                      tag: imagePath.toString(),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey[400]!, blurRadius: 30),
                          ],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 200,
                        child: Image.asset(imagePath, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                PrimaryText(
                    text: 'Ingredients', fontWeight: FontWeight.w700, size: 22),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ingredients.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                child:
                    ingredientCard(ingredients[index]['imagePath'].toString()),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Container ingredientCard(String imagePath) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.only(
          right: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.grey[300]!),
            ]),
        child: Image.asset(
          imagePath,
          width: 90,
        ));
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey[400]!)),
              child: Icon(Icons.chevron_left),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.star, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/model/food.dart';
import 'package:food_app/scoped_model/main_model.dart';
import 'package:food_app/widgets/food_item_cart.dart';
import 'package:scoped_model/scoped_model.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
            model.fethFood();
            List<Food> foods=model.foods;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: foods.map((Food food) {
                  return FoodItemCard(
                    food.name,
                    food.description,
                    food.price.toString(),
                  );
                }).toList(),
              ),
            );
          },
        ),

    );
  }
}

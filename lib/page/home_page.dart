import 'package:flutter/material.dart';
import 'package:food_app/model/food.dart';
import 'package:food_app/scoped_model/main_model.dart';
import 'package:food_app/widgets/bought_food.dart';
import 'package:food_app/widgets/food_category.dart';
import 'package:food_app/widgets/home_top.dart';
import 'package:food_app/widgets/search_field.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
 // final FoodModel foodModel;
 // HomePage(this.foodModel);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final List<Food> _food=foods;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // widget.foodModel.fethFood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 30.0),
        children: <Widget>[
          HomeTop(),
          FoodCategory(),
          SizedBox(height: 7,),
          SearchField(),
          SizedBox(height: 7,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Frequenlty Bought Foods",style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold),),
              Text("View All",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w700,color: Colors.amber),)
            ],
          ),
          SizedBox(height: 7.0,),
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context,Widget child,MainModel model){
              return Column(
                children: model.foods.map(_buidFoodItems).toList(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buidFoodItems(Food food){
    return Container(
      margin: EdgeInsets.only(bottom: 22.0),
      child: BoughtFood(
        id:food.id,
        name: food.name,
        imagePath:food.imagePath,
        rating:food.rating,
        price:food.price,
        category: food.category,
      ),
    );
  }
}

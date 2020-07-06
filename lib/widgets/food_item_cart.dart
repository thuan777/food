import 'package:flutter/material.dart';
import 'package:food_app/widgets/small_button.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  FoodItemCard(this.title,this.description,this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      height: 120.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                offset: Offset(0, 0.5),
                color: Colors.black38)
          ]),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/burgers-food.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$title",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              SizedBox(
                height: 7.0,
              ),
              Container(
                  width: 200.0,
                  child: Text(
                    "$description",
                    style: TextStyle(fontSize: 17.0),
                  )),
              SizedBox(height: 7.0,),
              Container(
                width: 210.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "$price",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    SizedBox(height: 7.0,),
                    SmallButton(btnText:"Buy")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_list_title.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  bool turnOnNatification=false;
  bool turnOnLocationTracking=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3.0,
                              offset: Offset(0, 0.4),
                              color: Colors.black38),
                        ],
                        image: DecorationImage(
                            image: AssetImage("images/coffee-food.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 17.0,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Lionel Messi",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text("+032052052"),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 30.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue, fontSize: 17.0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Account",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Column(
                    children: <Widget>[
                      CustomList(icon: Icons.location_on, text: "Location"),
                      Divider(),
                      CustomList(icon: Icons.visibility, text: "Change password"),
                      Divider(),
                      CustomList(icon: Icons.shopping_cart, text: "Shipping"),
                      Divider(),
                      CustomList(icon: Icons.payment, text: "Payment"),
                      Divider(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 7.0,),
              Text("Notification", style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 7.0,),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("App Notification",style: TextStyle(fontSize: 17.0),),
                          Switch(value: turnOnNatification,
                          onChanged: (bool value){
                            setState(() {
                              turnOnNatification=value;
                            });
                          },),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Location Tracking",style: TextStyle(fontSize: 17.0),),
                          Switch(value: turnOnLocationTracking,
                            onChanged: (bool value){
                              setState(() {
                                turnOnLocationTracking=value;
                              });
                            },),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 7.0,),
              Text("Other",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 7.0,),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Language",style: TextStyle(fontSize: 17.0),),
                        Divider(),
                        Text("Currency",style: TextStyle(fontSize: 17.0),),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

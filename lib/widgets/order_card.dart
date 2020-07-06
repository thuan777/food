import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 77.0,
              width: 45.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {},
                      child: Icon(Icons.keyboard_arrow_up,
                          color: Color(0xFFD3D3D3))),
                  Text(
                    "0",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFD3D3D3)))
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/coffee-food.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(37),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        offset: Offset(0.5, 0.5))
                  ]),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Beer Tiger",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 5.0,),
                Text("17.0",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.amber)),
                SizedBox(height: 5.0,),
                Container(
                  height: 47.0,
                  width: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Chicken",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey)),
                          SizedBox(width: 5.0,),
                          Text("x",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap:(){},
                child:Icon(Icons.cancel,color: Colors.grey,)
            )
          ],
        ),
      ),
    );
  }
}

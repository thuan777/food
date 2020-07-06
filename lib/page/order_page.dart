import 'package:flutter/material.dart';
import 'package:food_app/page/sign_in.dart';
import 'package:food_app/widgets/order_card.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[OrderCard(), OrderCard(), OrderCard(), OrderCard()],
          ),
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer() {
    return Container(
      height: 220.0,
      margin: EdgeInsets.only(top:20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Cart Total", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text("24.0", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Discount", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text("2.0", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Tax", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text("0.5", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Divider(
            height: 20.0,
            color: Color(0xFFD3D3D3D),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Sub Total",style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text("26.5", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage(),));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Procced to Checkout",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

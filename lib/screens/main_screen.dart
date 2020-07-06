import 'package:flutter/material.dart';
import 'package:food_app/admin/add_food_item.dart';
import 'package:food_app/page/explore_page.dart';
import 'package:food_app/page/home_page.dart';
import 'package:food_app/page/order_page.dart';
import 'package:food_app/page/user_page.dart';
import 'package:food_app/scoped_model/main_model.dart';

class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  Widget currentPage;

  List<Widget> pages;
  HomePage homePage;
  OrderPage orderPage;
  ExplorePage explorePage;
  UserPage userPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.model.fethFood();
    homePage = HomePage();
    orderPage = OrderPage();
    explorePage = ExplorePage();
    userPage = UserPage();
    pages = [homePage, orderPage, explorePage, userPage];
    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddFoodItem(),));
                },
                leading: Icon(Icons.list),
                title: Text(
                  "Add food items",
                  style: TextStyle(fontSize: 17.0),
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: Text('Order')),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), title: Text('Explore')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('User')),
          ],
        ),
        body: currentPage,
      ),
    );
  }
}

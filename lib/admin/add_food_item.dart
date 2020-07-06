import 'package:flutter/material.dart';
import 'package:food_app/model/food.dart';
import 'package:food_app/scoped_model/main_model.dart';
import 'package:food_app/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  AddFoodItem({Key key}) : super(key: key);

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  String title, category, description, price, discount;

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 17.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage("images/no-image-available.png"),
                        fit: BoxFit.cover,
                      )),
                ),
                _buidTextFormField("Food Title"),
                _buidTextFormField("Category"),
                _buidTextFormField("Description", maxLine: 5),
                _buidTextFormField("Price"),
                _buidTextFormField("Discount"),
                SizedBox(
                  height: 50.0,
                ),
                ScopedModelDescendant(
                  builder:
                      (BuildContext context, Widget child, MainModel model) {
                    return GestureDetector(
                      onTap: () {
                          onSubmit(model.addFood);
                          if(model.isLoading){
                            showLoadingIndicator();
                          }
                      },
                      child: Button(
                        btnText: "Add Food Item",
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit(Function addFood)async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
    final Food food = Food(
        name: title,
        category: category,
        description: description,
        price: double.parse(price),
        discount: double.parse(discount));
   var value=await addFood(food);
   if(value){
     Navigator.of(context).pop();
     SnackBar snackBar=SnackBar(
       content: Text("Food item successfully added"),
     );
      _scaffoldState.currentState.showSnackBar(snackBar);
   }else if(!value){
     Navigator.of(context).pop();
     SnackBar snackBar=SnackBar(
       content: Text("Failed to add food item"),
     );
     _scaffoldState.currentState.showSnackBar(snackBar);
   }
  }

  Future<void> showLoadingIndicator(){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 10.0,),
              Text("Adding food item..."),
            ],
          ),
        );
      }
    );
  }

  Widget _buidTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      decoration: InputDecoration(hintText: "$hint"),
      maxLines: maxLine,
      keyboardType: hint == "Price" || hint == "Discount"
          ? TextInputType.number
          : TextInputType.text,
      validator: (String value) {
        var errorMsg = "";
        if (value.isEmpty && hint == "Food Title") {
          errorMsg = "The food title is required";
        }
        if (value.isEmpty && hint == "Category") {
          errorMsg = "The category title is required";
        }
        if (value.isEmpty && hint == "Description") {
          errorMsg = "The description title is required";
        }
        if (value.isEmpty && hint == "Price") {
          errorMsg = "The price title is required";
        }
        if (value.isEmpty && hint == "Discount") {
          errorMsg = "The discount title is required";
        }
        return errorMsg;
      },
      onChanged: (String value) {
        if (hint == "Food Title") {
          title = value;
        }
        if (hint == "Category") {
          category = value;
        }
        if (hint == "Description") {
          description = value;
        }
        if (hint == "Price") {
          price = value;
        }
        if (hint == "Discount") {
          discount = value;
        }
      },
    );
  }
}

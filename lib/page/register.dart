import 'package:flutter/material.dart';
import 'package:food_app/page/sign_in.dart';
import 'package:food_app/widgets/button.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Widget _buiUserNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your username",
          hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 17.0)),
    );
  }

  Widget _buiEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your email ",
          hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 17.0)),
    );
  }
  bool _togglePasswordVisibility=true;
  Widget _buiPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your password",
          hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 17.0),
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              _togglePasswordVisibility=!_togglePasswordVisibility;
            });
          },icon:_togglePasswordVisibility ? Icon(Icons.visibility_off):Icon(Icons.visibility),)),
      obscureText: _togglePasswordVisibility,
    );
  }
  bool _togglePressPasswordVisibility=true;

  Widget _buipressPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your press password",
          hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 17.0),
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              _togglePressPasswordVisibility=!_togglePressPasswordVisibility;
            });
          },icon:_togglePressPasswordVisibility ? Icon(Icons.visibility_off):Icon(Icons.visibility),)),
      obscureText: _togglePressPasswordVisibility,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign Up",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 7.0,
            ),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    _buiUserNameTextField(),
                    SizedBox(
                      height: 7.0,
                    ),
                    _buiEmailTextField(),
                    SizedBox(
                      height: 7.0,
                    ),
                    _buiPasswordTextField(),
                    SizedBox(
                      height: 7.0,
                    ),
                    _buipressPasswordTextField()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password ?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 17.0),
                )
              ],
            ),
            SizedBox(
              height: 7.0,
            ),
            Button(btnText: "Sign Up",),
            Divider(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account ?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInPage(),));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

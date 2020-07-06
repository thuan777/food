import 'package:flutter/material.dart';
import 'package:food_app/page/register.dart';
import 'package:food_app/widgets/button.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Widget _buiEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your email or username",
          hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 17.0)),
    );
  }
  bool _toggleVisibility=true;
  Widget _buiPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your password",
          hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 17.0),
      suffixIcon: IconButton(onPressed: (){
        setState(() {
          _toggleVisibility=!_toggleVisibility;
        });
      },icon:_toggleVisibility ? Icon(Icons.visibility_off):Icon(Icons.visibility),)),
      obscureText: _toggleVisibility,
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
              "Sign In",
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
                    _buiEmailTextField(),
                    SizedBox(
                      height: 7.0,
                    ),
                    _buiPasswordTextField(),
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
            Button(btnText: "Sign In",),
            Divider(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account ?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
                GestureDetector(
                  onTap:() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Register(),));
                  },
                  child: Text(
                    "Sign Up",
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

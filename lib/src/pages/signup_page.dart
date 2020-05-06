import 'package:flutter/material.dart';
import 'package:food_app/src/pages/signin_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _togglePasswordVisibility = true;
  bool _toggleConfirmPasswordVisibility = true;

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Email",
          hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 18.0)),
    );
  }

  Widget _buildUserNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Username",
          hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 18.0)),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 18.0),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _togglePasswordVisibility = !_togglePasswordVisibility;
            });
          },
          icon: _togglePasswordVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _togglePasswordVisibility,
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 18.0),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleConfirmPasswordVisibility =
                  !_toggleConfirmPasswordVisibility;
            });
          },
          icon: _toggleConfirmPasswordVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleConfirmPasswordVisibility,
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
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          _buildUserNameTextField(),
                          SizedBox(height: 10.0),
                          _buildEmailTextField(),
                          SizedBox(height: 10.0),
                          _buildPasswordTextField(),
                          SizedBox(height: 10.0),
                          _buildConfirmPasswordTextField(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Center(
                      child: Text("Sign up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Divider(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an accout?",
                          style: TextStyle(
                              color: Color(0xFFBDC2CB),
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0)),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignInPage()));
                        },
                        child: Text("Sign in",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                      ),
                    ],
                  ),
                ])));
  }
}

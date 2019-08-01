import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:data_dog_app/util/themes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat', fontSize: 15.0, color: HexColor('#FFFC00'));
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  _login() async {
    try {
      final response = await http.post(_localhost(), body: {
        "username": usernameController.text,
        "password": passwordController.text,
      });
      print(response.body);
      if (response.body.toString() == "1") {
        passwordController.clear();
        usernameController.clear();
        Navigator.pushNamed(context, '/home');
      } else
        return true;
    } catch (e) {
      print("Cannot access to server");
    }
  }

  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:3000/login';
    else // for iOS simulator
      return 'localhost:3000/login';
  }

  @override
  Widget build(BuildContext context) {
    final borderStyle = new OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(10.0),
      ),
      borderSide: BorderSide(
          color: HexColor("FFFC00"), width: 0, style: BorderStyle.none),
    );

    final usernameField = TextField(
        controller: usernameController,
        cursorColor: HexColor("FFFC00"),
        obscureText: false,
        style: style,
        decoration: InputDecoration(
          focusedBorder: borderStyle,
          enabledBorder: borderStyle,
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          fillColor: HexColor('#212121'),
          filled: true,
          hintText: "Username",
          hintStyle: TextStyle(color: HexColor("ffffff")),
        ));
    final passwordField = TextField(
        controller: passwordController,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          fillColor: HexColor('#212121'),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "Password",
          hintStyle: TextStyle(color: HexColor("ffffff")),
        ));
    final loginButton = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10.0),
      color: HexColor('#212121'),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.5,
        onPressed: () {
          _login();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: HexColor("ffffff"), fontWeight: FontWeight.bold)),
      ),
    );

    final signUp = Material(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.transparent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.2,
        onPressed: () {
          passwordController.clear();
          usernameController.clear();
          Navigator.pushNamed(context, '/signup');
        },
        child: Text("Sign up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: HexColor("#212121"), fontWeight: FontWeight.bold)),
      ),
    );

    return Stack(
      children: <Widget>[
        new Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            color: HexColor("#FFFC00"),
          ),
        ),
        new Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: signUp,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          "assets/datarakun_icon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    usernameField,
                    SizedBox(height: 5),
                    passwordField,
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    loginButton,
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                        child: Image.asset(
                          "assets/rakun_icon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

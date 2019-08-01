import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:data_dog_app/util/themes.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat', fontSize: 15.0, color: HexColor('#F0810F'));

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final passwordCheckController = TextEditingController();
  final emailController = TextEditingController();

  _signUp() async {
    try {
      final response = await http.post(_localhost(), body: {
        "username": usernameController.text,
        "password": passwordController.text,
        "name": nameController.text,
        "email": emailController.text,
      });
      print(response.body);
      if (response.body.toString() == "1") {
        passwordController.clear();
        usernameController.clear();
        nameController.clear();
        emailController.clear();
        Navigator.pushNamed(context, '/wait');
      } else
        return true;
    } catch (e) {
      print("Cannot access to server");
    }
  }

  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:3000/signup';
    else // for iOS simulator
      return 'localhost:3000/signup';
  }

  @override
  Widget build(BuildContext context) {
    final borderStyle = new OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(10.0),
      ),
      borderSide: BorderSide(
          color: HexColor("F0810F"), width: 0, style: BorderStyle.none),
    );

    final usernameField = TextField(
        controller: usernameController,
        cursorColor: HexColor("F0810F"),
        style: style,
        decoration: InputDecoration(
          focusedBorder: borderStyle,
          enabledBorder: borderStyle,
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          fillColor: HexColor('#212121'),
          filled: true,
          hintText: "Enter your username",
          hintStyle: TextStyle(color: HexColor("ffffff"), fontSize: 13),
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
          hintText: "Enter your password",
          hintStyle: TextStyle(color: HexColor("ffffff"), fontSize: 13),
        ));
    final passwordFieldCheck = TextField(
        controller: passwordCheckController,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          fillColor: HexColor('#212121'),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "Re-enter your password",
          hintStyle: TextStyle(color: HexColor("ffffff"), fontSize: 13),
        ));
    final nameField = TextField(
        controller: nameController,
        style: style,
        decoration: InputDecoration(
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          fillColor: HexColor('#212121'),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "Enter name",
          hintStyle: TextStyle(color: HexColor("ffffff"), fontSize: 13),
        ));
    final emailField = TextField(
        controller: emailController,
        style: style,
        decoration: InputDecoration(
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          fillColor: HexColor('#212121'),
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "Enter e-mail",
          hintStyle: TextStyle(color: HexColor("ffffff"), fontSize: 13),
        ));
    final signUpButton = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10.0),
      color: HexColor('#212121'),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.5,
        onPressed: () {
          if (passwordController.text == passwordCheckController.text)
            _signUp();
        },
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: HexColor("ffffff"), fontWeight: FontWeight.bold)),
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
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: new Text("Please, enter your information",
                            style: style.copyWith(
                                color: HexColor("#212121"),
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    nameField,
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    emailField,
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    usernameField,
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    passwordField,
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    passwordFieldCheck,
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    signUpButton,
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
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

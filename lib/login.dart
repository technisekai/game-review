import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_review/homepage.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  String _name = '';
  @override
  Widget build(BuildContext context) {
    Color dark_blue = const Color(0xFF112D4E);
    Color soft_blue = const Color(0xFF3F72AF);
    return Scaffold(
      body: (Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          /* center content vertically and horizontally */
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              /* logo and title about the project */
              child: Row(
                /* center content in row vertically */
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* image logo */
                  Image.asset(
                    'images/logo_login.png',
                    width: 100,
                  ),

                  /* distance between logo and title */
                  SizedBox(
                    width: 20,
                  ),

                  /* title */
                  Text(
                    'Game\nReview',
                    style: TextStyle(
                      color: dark_blue,
                      fontFamily: 'Smooch',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            /* distance between container */
            SizedBox(
              height: 30,
            ),

            /* input field */
            Container(
              child: TextField(
                /* rounded input with no border */
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    /*
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),*/
                  ),

                  /* icon input */
                  prefixIcon: Icon(
                    Icons.account_circle_outlined,
                    color: dark_blue,
                    size: 30,
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Your name?", //placeholder
                  fillColor: Colors.white,
                ),
                /* action input field */
                onChanged: (String value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),

            /* distance between container */
            SizedBox(
              height: 15,
            ),

            /* button login */
            Container(
              child: ElevatedButton(
                /* make rounded button */
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      soft_blue), //color button
                ),
                /* action button direct to homepage */
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage(
                          name: _name,
                        );
                      },
                    ),
                  );
                },
                /* text button */
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

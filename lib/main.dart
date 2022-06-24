import 'package:flutter/material.dart';
import 'package:game_review/homepage.dart';
import 'package:game_review/login.dart';
import 'package:game_review/detail_review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Review',
      theme: ThemeData(
        fontFamily: 'PT Sans',
        backgroundColor: Color(0xFFF9F2ED),
      ),
      home: Login(),
    );
  }
}

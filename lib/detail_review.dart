import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:game_review/model/get_data.dart';

class DetailReview extends StatelessWidget {
  final GameReview gameReviews;
  DetailReview({required this.gameReviews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* top padding automatically based on device */
      body: SafeArea(
        /* for responsive */
        child: SingleChildScrollView(
          /* padding screen */
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      /* title game */
                      Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        gameReviews.title
                            .split('–')[0], //split data and get index 0 data
                      ),

                      /* distance between title and time */
                      SizedBox(
                        height: 6.0,
                      ),

                      /* time and author data */
                      Text(
                        textAlign: TextAlign.center,
                        gameReviews.author + ' • ' + gameReviews.time,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                /* distance between container */
                SizedBox(
                  height: 12,
                ),

                /* thumbnail */
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(gameReviews.thumb),
                  ),
                ),

                /* distance between container*/
                SizedBox(
                  height: 30,
                ),

                /* description */
                Container(
                  child: Text(
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      gameReviews.desc),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

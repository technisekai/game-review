import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:game_review/detail_review.dart';
import 'package:http/http.dart' as http;
import 'package:game_review/model/get_data.dart';

/* get data from api */
Future<List<GameReview>> fetchPost() async {
  final response = await http.get(Uri.parse(
      'https://the-lazy-media-api.vercel.app/api/games/review?page=1'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<GameReview>((json) => GameReview.fromMap(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

class HomePage extends StatelessWidget {
  late Future<List<GameReview>> futurePost;
  final String name;

  HomePage({required this.name});

  @override
  Widget build(BuildContext context) {
    Color dark_blue = const Color(0xFF112D4E);
    Color soft_blue = const Color(0xFF3F72AF);
    return Scaffold(
      /* top padding automatically based on device */
      body: SafeArea(
        /* for responsive */
        child: SingleChildScrollView(
          /* padding screen */
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /* account information */
                      Container(
                        child: Row(
                          children: [
                            /* account image */
                            Image.asset('images/account_photo.png', width: 65),
                            /* distance between image and account name */
                            SizedBox(
                              width: 12.0,
                            ),
                            /* account information */
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                /* account name */
                                children: [
                                  Text(
                                    'Welcome back,',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '$name',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: dark_blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /* notify icon */
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(Icons.notifications_active_outlined),
                              color: dark_blue,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /* distance between container */
                SizedBox(
                  height: 40,
                ),

                /* reviewed games */
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reviewed games',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          color: dark_blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      /* distance between title and content */
                      SizedBox(
                        height: 15,
                      ),

                      /* reviewed game titles*/
                      Container(
                        height: 50,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final TitleGame title = titleGameList[index];
                            return Card(
                              /* rounded card */
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Row(
                                children: [
                                  /* icon game */
                                  CircleAvatar(
                                    backgroundColor: soft_blue,
                                    child: Icon(
                                      Icons.gamepad_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  /* padding between icon game and game title */
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 6.0, right: 10.0),
                                    child: Text(title.title), //title game
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: titleGameList.length, //count data
                          scrollDirection: Axis.horizontal, //direction scroll
                        ),
                      ),
                    ],
                  ),
                ),

                /* distance between container */
                SizedBox(
                  height: 40,
                ),

                /* details about reviewed games */
                Container(
                  child: Column(
                    children: <Widget>[
                      /* title */
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Text(
                            'Review terbaru',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              color: dark_blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      /* distance between title and content */
                      SizedBox(
                        height: 15,
                      ),

                      /* show reviewed games in card */
                      Container(
                        height: 298,
                        child: FutureBuilder<List<GameReview>>(
                          future: fetchPost(), //get data from api
                          builder: (context, snapshot) {
                            /* if data loaded show card with data */
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) => Container(
                                  child: Column(
                                    children: <Widget>[
                                      /* content */
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Column(
                                          children: [
                                            /* thumbnail */
                                            Container(
                                              height: 150,
                                              /* rounded thumbnail */
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(16.0),
                                                    topLeft:
                                                        Radius.circular(16.0)),
                                                child: Image.network(
                                                    '${snapshot.data![index].thumb}'),
                                              ),
                                            ),

                                            /* detail data */
                                            Container(
                                              width: 218,
                                              height: 140,
                                              padding: EdgeInsets.all(14.0),
                                              child: Column(
                                                children: [
                                                  /* game title */
                                                  Text(
                                                    '${snapshot.data![index].title.split('–')[0]}',
                                                    textAlign: TextAlign.start,
                                                    /* title style */
                                                    style: TextStyle(
                                                      color: dark_blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    softWrap: false,
                                                    maxLines: 3, //max lines
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),

                                                  /* distance between text */
                                                  SizedBox(
                                                    height: 8.0,
                                                  ),

                                                  /* date and read button */
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      /* time data */
                                                      Text(
                                                        '${snapshot.data![index].time}',
                                                      ),
                                                      /* read button */
                                                      ElevatedButton(
                                                        /* button style */
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty
                                                              .all<
                                                                  RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      soft_blue),
                                                        ),

                                                        /* button action if clicked */
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                                /* direct to detailreview with send data */
                                                                return DetailReview(
                                                                  gameReviews:
                                                                      snapshot.data![
                                                                          index],
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                        child: Text(
                                                            "Read"), //text in button
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                            /* if no data */
                            else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

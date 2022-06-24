import 'dart:convert';

/* get data reviewed games from api */
class GameReview {
  final String author;
  final String desc;
  final String key;
  final String tag;
  final String thumb;
  final String time;
  final String title;

  GameReview(
      {required this.author,
      required this.desc,
      required this.key,
      required this.tag,
      required this.thumb,
      required this.time,
      required this.title});

  factory GameReview.fromMap(Map<String, dynamic> json) {
    return GameReview(
      author: json['author'],
      desc: json['desc'],
      key: json['key'],
      tag: json['tag'],
      thumb: json['thumb'],
      time: json['time'],
      title: json['title'],
    );
  }
}

/* make tiles of game reviewed */
class TitleGame {
  String title;
  TitleGame({required this.title});
}

var titleGameList = [
  TitleGame(title: 'Gundam'),
  TitleGame(title: 'WarioWare'),
  TitleGame(title: 'Psychonauts 2'),
  TitleGame(title: 'Avengers: War of Wakanda'),
  TitleGame(title: 'Hades'),
  TitleGame(title: 'Returnal'),
  TitleGame(title: 'Nier Replicant'),
  TitleGame(title: 'Outriders'),
  TitleGame(title: 'Super Mario'),
];

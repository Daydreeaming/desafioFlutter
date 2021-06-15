import 'package:desafioflutter/informationMovie_view.dart';
import 'package:flutter/material.dart';
import 'package:desafioflutter/movie_view_page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieApp',
      debugShowCheckedModeBanner: false,
      home: MovieApp(),
      routes: {
        'informationsFilm' : (context) => InformationMovie()
      },
    );
  }
}

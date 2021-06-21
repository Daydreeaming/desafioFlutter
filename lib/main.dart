import 'package:desafioflutter/pages/information_Movie_view.dart';
import 'package:flutter/material.dart';
import 'package:desafioflutter/pages/movie_view_page1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // supportedLocales: [const Locale('pt', 'BR')],
      title: 'MovieApp',
      debugShowCheckedModeBanner: false,
      home: MovieApp(),
      routes: {'informationsFilm': (context) => InformationMovie()},
    );
  }
}

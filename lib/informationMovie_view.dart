import 'package:desafioflutter/movie.dart';
import 'package:flutter/material.dart';
import 'package:desafioflutter/movie_viewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class InformationMovie extends StatefulWidget {
  @override
  InformationMovieState createState() => InformationMovieState();
}

class InformationMovieState extends State<InformationMovie> {
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context).settings.arguments as Movie;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Image.network(
                    movie.urlImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    movie.title,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Container(
                  decoration: backgroundApp(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              '${movie.releaseDate}',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Column(
                              children: [
                                Text(
                                  '${movie.voteAverage}',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                Text(
                                  'score',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  print(movie.favorite);
                                  print('amigão?');
                                  if (movie.favorite) {
                                    movie.favorite = false;
                                    return;
                                  }
                                  movie.favorite = true;
                                });
                              },
                              child: movie.favorite == true
                                  ? Icon(Icons.star, color: Colors.yellow)
                                  : Icon(Icons.star, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Text(
                          '${movie.overview}',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: iconButtonBack(context),
          ),
        ],
      ),
    );
  }

  Material iconButtonBack(BuildContext context) {
    return Material(
      type: MaterialType.circle,
      color: Colors.white30,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
        color: Colors.black,
        highlightColor: Colors.grey.withOpacity(0.6),
        splashRadius: 20,
      ),
    );
  }
}

BoxDecoration backgroundApp() {
  return BoxDecoration(
    gradient: LinearGradient(
        colors: [Colors.black.withOpacity(1), Color(0xff580321)],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        stops: [0.2, 0.6]),
  );
}

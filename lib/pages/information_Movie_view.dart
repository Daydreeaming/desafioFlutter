import 'package:desafioflutter/Models/movie.dart';
import 'package:desafioflutter/DetailMovie/movie_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InformationMovie extends StatefulWidget {
  final Movie movie;

  const InformationMovie({Key key, this.movie}) : super(key: key);

  @override
  InformationMovieState createState() => InformationMovieState();
}

class InformationMovieState extends State<InformationMovie> {
  final viewModel = MovieViewModel();
  void loadMovie() async {
    await viewModel.isFavorite(widget.movie.id).then(
          (value) => setState(
            () => {widget.movie.favorite = value},
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                buildImageFilm(context),
                buildTitle(context),
                Container(
                  decoration: backgroundApp(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildRealeaseDate(),
                          buildScore(),
                          buildFavoriteStar(),
                        ],
                      ),
                      buildOverview(),
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

  Container buildTitle(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0XFF190005).withOpacity(0.7),
      ),
      child: Text(widget.movie.title,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center),
    );
  }

  Container buildOverview() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        '${widget.movie.overview}',
        style: TextStyle(fontSize: 24, color: Colors.white),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Container buildFavoriteStar() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: () {
          setState(
            () {
              if (widget.movie.favorite) {
                widget.movie.favorite = false;
                viewModel.changeFavorite(
                    widget.movie.id, widget.movie.favorite);
              } else {
                widget.movie.favorite = true;
                viewModel.changeFavorite(
                    widget.movie.id, widget.movie.favorite);
              }
            },
          );
        },
        child: widget.movie.favorite == true
            ? Icon(Icons.star, color: Colors.yellow)
            : Icon(Icons.star, color: Colors.white),
      ),
    );
  }

  Container buildScore() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text(
            '${widget.movie.voteAverage}',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            'score',
            style: TextStyle(fontSize: 24, color: Colors.white),
          )
        ],
      ),
    );
  }

  Container buildRealeaseDate() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Text(
        '${widget.movie.releaseDate}',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Container buildImageFilm(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
      child: Image.network(
        widget.movie.urlImage,
        fit: BoxFit.fill,
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

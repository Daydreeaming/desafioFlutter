import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MovieCard extends StatelessWidget {
  final String releaseDate;
  final String urlImage;
  final String title;

  MovieCard(
      {@required this.releaseDate,
      @required this.urlImage,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'informationsFilm');
      },
      child: Stack(
        children: [
          Image.network(
            urlImage,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.65,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 16,
            right: 16,
            child: textBox(releaseDate, 0.3, 16),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: textBox(title, 0.3, 24, width: double.infinity)),
          ),
        ],
      ),
    );
  }

  Container textBox(String text, double opacity, double fontSize,
      {double width}) {
    return Container(
      padding: EdgeInsets.all(8),
      width: width,
      decoration: BoxDecoration(
        color: Color(0XFF430218).withOpacity(opacity),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }
}

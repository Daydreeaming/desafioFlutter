import 'package:desafioflutter/components/loading.dart';
import 'package:desafioflutter/components/movieCard.dart';
import 'package:flutter/material.dart';
import 'package:desafioflutter/movie.dart';
import 'package:desafioflutter/movie_viewModel.dart';
import 'package:flutter/cupertino.dart';

class InformationMovie extends StatefulWidget {
  @override
  InformationMovieState createState() => InformationMovieState();
}

class InformationMovieState extends State<InformationMovie> {
  final viewModel = MovieViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: backgroundApp(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.65,
                        color: Colors.red,
                      ),
                      Positioned(
                        width: 100,
                        height: 100,
                        top: 20,
                        left: 20,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                          shape: CircleBorder(),
                          color: Colors.white12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Text('Xablau 1'),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Text('Xablau 2'),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (viewModel.favorite) {
                                  viewModel.favorite = false;
                                  return;
                                }
                                viewModel.favorite = true;
                              });
                            },
                            child: viewModel.favorite == true
                                ? Icon(Icons.star, color: Colors.yellow)
                                : Icon(Icons.star, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed venenatis est. Cras ac consequat massa. Fusce quis lacus non nulla venenatis elementum sit amet in orci. Nullam sit amet vehicula orci. Duis vitae accumsan magna. Fusce id tortor a erat condimentum euismod. Sed nibh eros, blandit id risus eu, sollicitudin auctor arcu. Nullam dapibus ac enim gravida pharetra. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                            style: TextStyle(fontSize: 17),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration backgroundApp() {
  return BoxDecoration(
    gradient: LinearGradient(
        colors: [Colors.blue, Colors.pink],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        stops: [0.2, 0.6]),
  );
}

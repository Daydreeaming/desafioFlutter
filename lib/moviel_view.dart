import 'package:desafioflutter/components/loading.dart';
import 'package:desafioflutter/components/movieCard.dart';
import 'package:flutter/material.dart';
import 'package:desafioflutter/movie.dart';
import 'package:desafioflutter/movie_controller.dart';
import 'package:flutter/cupertino.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final controller = MovieController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: buildTitleAppMovie(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: backgroundApp(),
              child: FutureBuilder<List<Movie>>(
                future: controller.loadMovie(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Loading();
                  }

                  if (snapshot.hasData) {
                    return buildListView(snapshot);
                  } else if (snapshot.hasError) {
                    return buildListViewError(snapshot);
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildTitleAppMovie() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0XFF430218).withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text('Lançamentos', style: TextStyle(fontSize: 20)),
    );
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
}

ListView buildListView(AsyncSnapshot<List<Movie>> snapshot) {
  return ListView.builder(
    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
    itemCount: snapshot.data.length,
    itemBuilder: (context, index) => Container(
      margin: EdgeInsets.only(bottom: 18),
      child: MovieCard(
          releaseDate: '${snapshot.data[index].releaseDate}',
          urlImage: snapshot.data[index].urlImage,
          title: '${snapshot.data[index].title}'),
    ),
  );
}

Container buildListViewError(AsyncSnapshot<List<Movie>> snapshot) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          snapshot.error,
          style: TextStyle(fontSize: 40),
        ),
        Container(
          child: Image.network(
            'https://pbs.twimg.com/media/EXNUDdPU4AAiy05?format=jpg&name=medium',
            width: 300,
            height: 400,
          ),
        )
      ],
    ),
  );
}

import 'package:desafioflutter/components/loading.dart';
import 'package:desafioflutter/components/movieCard.dart';
import 'package:flutter/material.dart';
import 'package:desafioflutter/Models/movie.dart';
import 'package:desafioflutter/DetailMovie/movie_viewModel.dart';
import 'package:flutter/cupertino.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final viewModel = MovieViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadMovie();
    
  }

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
              child: StreamBuilder<List<Movie>>(
                stream: viewModel.streamLista.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
        colors: [Colors.black.withOpacity(1), Color(0xff580321)],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        stops: [0.2, 0.6],
      ),
    );
  }

  ListView buildListView(AsyncSnapshot<List<Movie>> snapshot) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        if (index == snapshot.data.length - 5) {
          viewModel.loadMovie();
        }
        return Container(
          margin: EdgeInsets.only(bottom: 18),
          child: MovieCard(movie: snapshot.data[index]),
        );
      },
    );
  }
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

class Movie {
  int id;
  String title;
  String urlImage;
  String releaseDate;
  String overview;
  dynamic voteAverage;
  bool favorite;

  Movie(this.id, this.title, this.urlImage, this.releaseDate, this.overview,
      this.voteAverage, this.favorite);

  Movie.fromJson(Map<String, dynamic> json) {
    var postPath = json['poster_path'];
    id = json['id'];
    title = json['title'];
    urlImage = postPath == null
        ? 'https://e3z7c6v7.rocketcdn.me/blog/wp-content/uploads/2019/02/274034-erro-de-http-wordpress-como-corrigir.jpg.webp'
        : 'https://image.tmdb.org/t/p/w300' + postPath;
    releaseDate = json['release_date'];
    overview = json['overview'];
    voteAverage = json['vote_average'];
    favorite = false;
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'favorite': favorite};
  }
}

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
    id = json['id'];
    title = json['title'];
    urlImage = 'https://image.tmdb.org/t/p/w300' + json['poster_path'];
    releaseDate = json['release_date'];
    overview = json['overview'];
    voteAverage = json['vote_average'];
    favorite = false;
  }
}

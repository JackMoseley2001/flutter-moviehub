class DetailResult {
  String id;
  String title;
  String year;
  String type;
  String poster;
  String released;
  String runtime;
  String rated;
  String plot;
  List<String> actors;

  DetailResult.fromJson(Map<String, dynamic> json)
      : id = json['imdbID'],
        title = json['Title'],
        year = json['Year'],
        type = json['Type'],
        poster = json['Poster'],
        released = json['Released'],
        runtime = json['Runtime'],
        rated = json['Rated'],
        plot = json['Plot'],
        actors = json['Actors'].toString().split(", ");
}

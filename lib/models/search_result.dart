class SearchResult {
  String id;
  String title;
  String year;
  String type;
  String poster;

  SearchResult.fromJson(Map<String, dynamic> json)
      : id = json['imdbID'],
        title = json['Title'],
        year = json['Year'],
        type = json['Type'],
        poster = json['Poster'];
}

import 'package:moviehub/env.dart';

class API {
  final String _apiURL = 'http://www.omdbapi.com/?apikey=${ENV.apiKey}&';
  final String _imgURL = 'http://img.omdbapi.com/?apikey=${ENV.apiKey}&';

  Future<void> searchByTitle(String title) {}
}

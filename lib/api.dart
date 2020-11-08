import 'dart:convert';

import 'package:moviehub/env.dart';
import 'package:moviehub/models/search_result.dart';

import 'package:http/http.dart' as http;

class API {
  final String _apiURL = 'https://www.omdbapi.com/?apikey=${ENV.apiKey}';
  final String _imgURL = 'https://img.omdbapi.com/?apikey=${ENV.apiKey}';

  Future<List<SearchResult>> searchByQuery(String query) async {
    final searchURL = '$_apiURL&s=$query';
    var response = await http.get(searchURL);

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);
      final List<dynamic> jsonResults = responseJSON['Search'];
      final List<SearchResult> results =
          jsonResults.map((e) => SearchResult.fromJson(e)).toList();
      return results;
    } else {
      throw 'Invalid response from server';
    }
  }

  Future<void> searchByTitle(String title) {}
}

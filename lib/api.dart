import 'dart:convert';

import 'package:moviehub/env.dart';
import 'package:moviehub/models/detail_result.dart';
import 'package:moviehub/models/search_result.dart';

import 'package:http/http.dart' as http;

class API {
  final String _apiURL = 'https://www.omdbapi.com/?apikey=${ENV.apiKey}';

  //! Fails to load when special characters are in use e.g. I'm a celebrity
  Future<List<SearchResult>> searchByQuery(String query) async {
    final searchURL = Uri.encodeFull('$_apiURL&s=$query');
    var response = await http.get(searchURL);

    if (response.statusCode == 200) {
      final responseJSON = jsonDecode(response.body);

      if (responseJSON['Response'] == "False") {
        throw responseJSON['Error'];
      }

      final List<dynamic> jsonResults = responseJSON['Search'];
      final List<SearchResult> results =
          jsonResults.map((e) => SearchResult.fromJson(e)).toList();
      return results;
    } else {
      throw 'Invalid response from server';
    }
  }

  Future<DetailResult> searchByID(String id) async {
    final searchURL = Uri.encodeFull('$_apiURL&i=$id&plot=full');
    var response = await http.get(searchURL);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJSON = jsonDecode(response.body);
      final DetailResult result = DetailResult.fromJson(responseJSON);
      return result;
    } else {
      throw 'Invalid response from server';
    }
  }
}

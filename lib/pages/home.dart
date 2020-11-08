import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:moviehub/api.dart';
import 'package:moviehub/models/search_result.dart';
import 'package:moviehub/views/search_result_row.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SearchBar _searchBar;
  List<SearchResult> _results = [];

  _HomePageState() {
    _searchBar = SearchBar(
        inBar: true,
        setState: setState,
        buildDefaultAppBar: _buildAppBar,
        onSubmitted: _startSearch);
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        title: Text('Search'), actions: [_searchBar.getSearchAction(context)]);
  }

  void _startSearch(String text) async {
    List<SearchResult> searchResults = await API().searchByQuery(text);
    setState(() {
      _results = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchBar.build(context),
      body: Container(
        child: ListView.builder(
          itemCount: _results.length,
          itemBuilder: (context, index) {
            return SearchResultRow(result: _results[index]);
          },
        ),
      ),
    );
  }
}

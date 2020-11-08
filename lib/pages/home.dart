import 'package:flutter/material.dart';
import 'package:moviehub/api.dart';
import 'package:moviehub/models/search_result.dart';
import 'package:moviehub/views/search_result_row.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SearchResult> _results = [];

  @override
  void initState() {
    super.initState();
    API().searchByQuery('Star Wars').then((value) {
      setState(() {
        _results = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: _results.length,
        itemBuilder: (context, index) {
          return SearchResultRow(result: _results[index]);
        },
      )),
    );
  }
}

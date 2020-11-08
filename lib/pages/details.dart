import 'package:flutter/material.dart';
import 'package:moviehub/api.dart';
import 'package:moviehub/models/detail_result.dart';
import 'package:moviehub/views/future_loading_wrapper.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key key, this.title, this.id}) : super(key: key);
  final String title;
  final String id;

  Image _getPosterImage(DetailResult value) {
    final double posterHeight = 250;
    final double posterWidth = 250;

    return value.poster != "N/A"
        ? Image.network(
            value.poster,
            height: posterHeight,
            width: posterWidth,
          )
        : Image.asset(
            'images/no-image-placeholder.png',
            height: posterHeight,
            width: posterWidth,
          );
  }

  Widget _buildPoster(DetailResult value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_getPosterImage(value)],
    );
  }

  Widget _buildQuickInfo(DetailResult value) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.spaceEvenly,
          children: [
            Chip(
              label: Text('Runtime: ${value.runtime}'),
            ),
            Chip(
              label: Text('Rated: ${value.rated}'),
            ),
            Chip(
              label: Text('Released: ${value.released}'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlot(BuildContext context, DetailResult value) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Plot', style: Theme.of(context).textTheme.headline5),
          Text(value.plot),
        ],
      ),
    );
  }

  Widget _buildActorList(BuildContext context, DetailResult value) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Actors', style: Theme.of(context).textTheme.headline5),
            Wrap(
              spacing: 10,
              children: List.generate(
                value.actors.length,
                (index) {
                  return Chip(
                    label: Text(value.actors[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context, DetailResult value) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPoster(value),
            _buildQuickInfo(value),
            _buildPlot(context, value),
            _buildActorList(context, value),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureLoadingWrapper(
        future: API().searchByID(id),
        childBuilder: (value) {
          return SingleChildScrollView(child: _buildDetails(context, value));
        },
      ),
    );
  }
}

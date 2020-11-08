import 'package:flutter/material.dart';
import 'package:moviehub/models/search_result.dart';

class SearchResultRow extends StatelessWidget {
  const SearchResultRow({Key key, this.result}) : super(key: key);

  final SearchResult result;

  Image _getPosterImage() {
    final double posterHeight = 100;
    final double posterWidth = 100;

    return result.poster != "N/A"
        ? Image.network(
            result.poster,
            height: posterHeight,
            width: posterWidth,
          )
        : Image.asset(
            'images/no-image-placeholder.png',
            height: posterHeight,
            width: posterWidth,
          );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        child: InkWell(
          // todo: Add detail screen
          onTap: () => print('Row tapped with id: ${result.id}'),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () => print('Row tapped with id: ${result.id}'),
              child: Row(
                children: [
                  _getPosterImage(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          result.year,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

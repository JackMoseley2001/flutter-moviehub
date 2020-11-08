import 'package:flutter/material.dart';

typedef Widget FutureWidgetBuilder<T>(T value);

class FutureLoadingWrapper<T> extends StatelessWidget {
  const FutureLoadingWrapper(
      {Key key, @required this.childBuilder, @required this.future})
      : super(key: key);

  final FutureWidgetBuilder childBuilder;
  final Future<T> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            // case false:
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return childBuilder(snapshot.data);
          }
        });
  }
}

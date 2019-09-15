import 'package:flutter/material.dart';
import 'package:flutter_api/screens/albums.dart';

void main() => runApp(FlutterApi());

class FlutterApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Api",
      theme: _theme(),
      home: Albums(),
      //onGenerateRoute: _routes(),
    );
  }

  ThemeData _theme() {
    return ThemeData(primarySwatch: Colors.amber);
  }

  // todo: Will generate routes later here
  //_routes() {}
}

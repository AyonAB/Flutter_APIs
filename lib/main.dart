import 'package:flutter/material.dart';
import 'package:flutter_api/screens/albums.dart';
import 'package:flutter_api/screens/photos.dart';

void main() => runApp(FlutterApi());

const AlbumsRoute = '/';
const PhotosRoute = '/photos';

class FlutterApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Api",
      theme: _theme(),
      onGenerateRoute: _routes(),
    );
  }

  ThemeData _theme() {
    return ThemeData(primarySwatch: Colors.amber);
  }

  // todo: Will generate routes later here
  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> args = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case AlbumsRoute:
          screen = Albums();
          break;
        case PhotosRoute:
          screen = Photos(args['albumId']);
          break;
        default:
          break;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}

import 'package:flutter_api/models/album.dart';
import 'package:flutter_api/models/photo.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://jsonplaceholder.typicode.com";

Future<List<Album>> getAlbums() async {
  final response =
      await http.get('$baseUrl/albums').timeout(Duration(seconds: 10));
  if (response.statusCode == 200) {
    return albumFromJson(response.body);
  } else {
    return Future.error("Failed to fetch Albums",
        StackTrace.fromString("Failed to fetch Albums!"));
  }
}

Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
  final response = await http
      .get('$baseUrl/photos?albumId=$albumId')
      .timeout(Duration(seconds: 15));
  if (response.statusCode == 200) {
    return photoFromJson(response.body);
  } else {
    return Future.error("Failed to fetch Photos",
        StackTrace.fromString("Failed to fetch Photos!"));
  }
}

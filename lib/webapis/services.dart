import 'dart:io';

import 'package:flutter_api/models/album.dart';
import 'package:flutter_api/models/photo.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://jsonplaceholder.typicode.com";

Future<List<Album>> getAlbums() async {
  try {
    final response =
        await http.get('$baseUrl/albums').timeout(Duration(seconds: 15));
    if (response.statusCode == 200) {
      return albumFromJson(response.body);
    } else {
      return null;
    }
  } catch (ex) {
    print(ex.message);
    return null;
  }
}

Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
  final response = await http
      .get('$baseUrl/photos?albumId=$albumId')
      .timeout(Duration(seconds: 15));
  if (response.statusCode == 200) {
    return photoFromJson(response.body);
  } else {
    throw Exception('Failed to fetch Photos');
  }
}

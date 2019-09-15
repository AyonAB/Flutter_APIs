import 'package:flutter_api/models/album.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://jsonplaceholder.typicode.com";

Future<List<Album>> getAlbums() async {
  final response = await http.get('$baseUrl/albums');
  if(response.statusCode == 200){
    return albumFromJson(response.body);
  }
  else{
    throw Exception('Failed to load Albums');
  }
}

import 'dart:convert';

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) => new Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl']);
}

List<Photo> photoFromJson(String str) {
  var jsonData = json.decode(str) as List;
  return jsonData.map((photo) => Photo.fromJson(photo)).toList();
}

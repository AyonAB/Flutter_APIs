import 'dart:convert';

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) =>
      new Album(userId: json["userId"], id: json["id"], title: json["title"]);
}

List<Album> albumFromJson(String str) {
  var jsonData = json.decode(str) as List;
  return jsonData.map((album) => Album.fromJson(album)).toList();
}

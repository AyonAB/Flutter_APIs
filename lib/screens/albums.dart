import 'package:flutter/material.dart';
import 'package:flutter_api/models/album.dart';
import 'package:flutter_api/webapis/services.dart';

class Albums extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Albums")),
        body: FutureBuilder(
            future: getAlbums(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Album> albums = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: (context, index) =>
                        _itemBuilder(albums[index], context),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(child: Text("Error Gettings Albums!"));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  _itemBuilder(Album album, BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Text('${album.title}', style: TextStyle(fontSize: 20)));
  }
}

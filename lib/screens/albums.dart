import 'package:flutter/material.dart';
import 'package:flutter_api/models/album.dart';
import 'package:flutter_api/webapis/services.dart';

class Albums extends StatefulWidget {
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Albums> {

  Future<List<Album>> albums;

  @override
  void initState(){
    super.initState();
    albums = getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Albums")),
        body: FutureBuilder(
            future: albums,
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
    return ListTile(
        title: Text('${album.title}'),
        subtitle: Text('Click to see Photos'),
        onTap: () {
          final snackBar = SnackBar(
            content: Text(album.title),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          Scaffold.of(context).showSnackBar(snackBar);
        });
  }
}

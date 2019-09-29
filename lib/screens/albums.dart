import 'package:flutter/material.dart';
import 'package:flutter_api/main.dart';
import 'package:flutter_api/models/album.dart';
import 'package:flutter_api/webapis/services.dart';

class Albums extends StatefulWidget {
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Albums> {
  Future<List<Album>> albums;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    albums = getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Albums")),
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: FutureBuilder<List<Album>>(
              future: albums,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Album> albums = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: albums.length,
                      itemBuilder: (context, index) =>
                          _itemBuilder(albums[index], context),
                    );
                  }
                } else if (snapshot.hasError) {
                  return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Center(child: Text("Error Gettings Albums!")));
                }
                return Center(child: CircularProgressIndicator());
              }),
        ));
  }

  Future<Null> _refresh() async {
    setState(() {
      albums = getAlbums();
    });
    return null;
  }

  _itemBuilder(Album album, BuildContext context) {
    return ListTile(
        title: Text('${album.title}'),
        subtitle: Text('Click to see Photos'),
        onTap: () => _onAlbumTap(context, album.id));
  }

  _onAlbumTap(BuildContext context, int albumId) {
    Navigator.pushNamed(context, PhotosRoute, arguments: {"albumId": albumId});
  }
}

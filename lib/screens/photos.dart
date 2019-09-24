import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/models/photo.dart';
import 'package:flutter_api/webapis/services.dart';

class Photos extends StatefulWidget {
  final int albumId;

  const Photos(this.albumId);

  @override
  State<StatefulWidget> createState() => _PhotoState();
}

class _PhotoState extends State<Photos> {
  Future<List<Photo>> photos;

  @override
  void initState() {
    super.initState();
    photos = getPhotosByAlbumId(widget.albumId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Photos')),
        body: FutureBuilder(
            future: photos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Photo> photos = snapshot.data;
                return _gridView(photos);
              } else if (snapshot.hasError) {
                return Center(child: Text('Error Getting Photos!'));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  _gridView(List<Photo> photos) {
    return GridView.builder(
      itemCount: photos.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext build, int index) {
        return Card(
          margin: EdgeInsets.all(4),
          child: CachedNetworkImage(
              imageUrl: photos[index].thumbnailUrl,
              placeholder: (context, url) => CircularProgressIndicator()),
        );
      },
    );
  }
}

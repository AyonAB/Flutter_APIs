import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreenPhoto extends StatelessWidget {
  final String url;
  FullScreenPhoto(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
      ),
      backgroundColor: Colors.black,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: CachedNetworkImage(
          imageUrl: url,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

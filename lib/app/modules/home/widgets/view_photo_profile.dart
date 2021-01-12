import 'package:flutter/material.dart';

class ViewPhotoProfile extends StatefulWidget {
  final String urlPhoto;

  const ViewPhotoProfile({Key key,@required this.urlPhoto}) : super(key: key);
  @override
  _ViewPhotoProfileState createState() => _ViewPhotoProfileState();
}

class _ViewPhotoProfileState extends State<ViewPhotoProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Container(
      height: size.height,
      width: size.width,
      child: Image.network(widget.urlPhoto),
      );
  }
}

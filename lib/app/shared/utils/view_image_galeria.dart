import 'package:flutter/material.dart';

class DetalhesImagem extends StatefulWidget {
  final String pathImage;

  const DetalhesImagem({Key key, @required this.pathImage}) : super(key: key);
  @override
  _DetalhesImagemState createState() => _DetalhesImagemState();
}

class _DetalhesImagemState extends State<DetalhesImagem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Image.network(widget.pathImage)
    );
  }
}

import 'package:flutter/material.dart';

class ViewImagensGaleria extends StatefulWidget {
  final List<String> pathImage;

  const ViewImagensGaleria({Key key, @required this.pathImage}) : super(key: key);

  @override
  _ViewImagensGaleriaState createState() => _ViewImagensGaleriaState();
}

class _ViewImagensGaleriaState extends State<ViewImagensGaleria> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: PageView.builder(
        itemCount: widget.pathImage.length,
        itemBuilder: (context, index) {
        return Image.network(widget.pathImage[index]);
      }),
    );
  }
}

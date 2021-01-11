import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class SocialButtonWidget extends StatelessWidget {
  final Function function;
  final String imagePath;

  const SocialButtonWidget(
      {
        Key key, 
        this.function, 
        this.imagePath, 
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Observer(
        builder:(_) => Column(
        children: [
          InkWell(
            onTap: function,
            child: Container(
              padding: EdgeInsets.all(4),
              height: size.height * 0.07,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                margin: EdgeInsets.all(4),
                child: Image(
                  fit: BoxFit.contain,
                  image: Svg(imagePath),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

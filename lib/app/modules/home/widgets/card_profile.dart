import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class CardsWidget extends StatelessWidget {
  final String path;
  final String title;
  final Function function;
  final Color corText;

  const CardsWidget({
    Key key, 
    this.path, 
    this.title, 
    this.function,
    this.corText = Colors.black,
    })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: function,
      child: Container(
        child: Card(
          margin: EdgeInsets.all(8),
          elevation: 0,
          child: SizedBox(
            width: size.width * 0.2,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: Image.asset(
                      path,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                   width: size.width * 0.1,
                  ),
                  Container(
                    width: size.width * 0.32,
                    child: TextWidget(
                      text: title,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      textColor: corText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

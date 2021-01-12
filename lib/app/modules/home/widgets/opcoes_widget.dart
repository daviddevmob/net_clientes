import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class OpcoesHomeWidget extends StatelessWidget {
  final String title;
  final String descricao;
  final Function function;
  final String imagePath;

  const OpcoesHomeWidget({
    Key key,
    this.title,
    this.descricao,
    this.function,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: function,
      child: Container(
        width: size.width * 0.9,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(
              child: Container(
                height: size.height * 0.15,
                width: size.width * 0.25,
                child: Image.asset(imagePath),
              ),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      TextWidget(
                        text: title,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.007,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextWidget(
                          text: descricao,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

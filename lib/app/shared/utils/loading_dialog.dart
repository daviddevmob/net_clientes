import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class LoaderWidget extends StatelessWidget {
  final String mensagem;
  final int segundos;
  final Function function;

  const LoaderWidget({
    Key key,
    this.mensagem,
    this.segundos,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Observer(builder: (_) {
        Future.delayed(Duration(seconds: segundos)).then((value) {
          Navigator.pop(context);
          Navigator.pop(context);
        });
        return Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: mensagem,
                textColor: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoActivityIndicator(),
            ],
          ),
        );
      }),
    );
  }
}

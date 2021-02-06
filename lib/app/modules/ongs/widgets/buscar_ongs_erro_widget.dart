import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/modules/ongs/ongs_controller.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/lists/list_bairros.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class BuscarOngsPageErroWidget extends StatelessWidget {
  final OngsController controller;

  const BuscarOngsPageErroWidget({Key key, @required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.only(
        top: 25,
      ),
      child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.8,
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Observer(
                      builder: (_) => DropdownButtonHideUnderline(
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 2,
                            bottom: 2,
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Cores.verdeClaro,
                          ),
                          child: DropdownButton<int>(
                            value: controller.bairro,
                            isExpanded: true,
                            icon: Icon(
                              CupertinoIcons.list_bullet,
                              color: Colors.white,
                            ),
                            dropdownColor: Cores.verdeClaro,
                            style: TextStyle(
                              color: Cores.verdeClaro,
                            ),
                            hint: TextWidget(
                              text: 'Pesquise por bairro',
                            ),
                            items: listBairros,
                            onChanged: controller.setBairro,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: TextWidget(
                      text:
                          'Ops! Nenhum projeto social ou ong encontrado nesta pesquisa.',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                    ),
                  ),
                ],
            ),
    );
  }
}
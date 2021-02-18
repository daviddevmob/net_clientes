import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/modules/ongs/ongs_controller.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/lists/list_bairros.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class BuscarOngsPageWidget extends StatelessWidget {
  final OngsController controller;

  const BuscarOngsPageWidget({Key key, @required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
           children: [
             Container(
              margin: EdgeInsets.only(left: 10,),
                child: TextWidget(
                  text: 'Pesquise por bairro',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.grey,
                  ),
              ),
           ],
         ),
         Container(
            margin: EdgeInsets.only(
            left:10,
            right:20,
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
                            elevation: 8,
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
      ],
    );
                
  }
}
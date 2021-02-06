import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/modules/lojas/lojas_controller.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/lists/list_bairros.dart';
import 'package:net_cliente/app/shared/utils/lists/list_lojas.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';

class BuscarLojasPageResultWidget extends StatelessWidget {
  final LojasController controller;

  const BuscarLojasPageResultWidget({Key key, @required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Cores.verdeClaro,
                          ),
                          child: DropdownButton(
                            value: controller.categoria,
                            hint: TextWidget(
                              text: 'Todas Categorias',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                            items: listLojas,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Cores.verdeClaro,
                            onChanged: controller.setCategoriaLojas,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Cores.verdeClaro,
                          ),
                          child: DropdownButton(
                            value: controller.bairro,
                            hint: TextWidget(
                              text: 'Todos os Bairros',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                            items: listBairros,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Cores.verdeClaro,
                            onChanged: controller.getBairro,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: controller.domicilio == true
                                    ? Colors.transparent
                                    : Colors.grey)),
                        color: controller.domicilio == true
                            ? Cores.verdeClaro
                            : Colors.white,
                        onPressed: () async {
                          if (controller.domicilio == true) {
                            controller.domicilio = null;
                            await controller.getListLojas();
                          } else {
                            controller.domicilio = true;
                            await controller.getListLojas();
                          }
                        },
                        child: TextWidget(
                          text: 'Domicílio',
                          fontSize: 14,
                          textColor: controller.domicilio == true
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Observer(
                        builder: (_) => FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: controller.lojaFisica == true
                                    ? Colors.transparent
                                    : Colors.grey,
                              )),
                          color: controller.lojaFisica == true
                              ? Cores.verdeClaro
                              : Colors.white,
                          onPressed: () async {
                            if (controller.lojaFisica == true) {
                              controller.lojaFisica = null;
                              await controller.getListLojas();
                            } else {
                              controller.lojaFisica = true;
                              await controller.getListLojas();
                            }
                          },
                          child: TextWidget(
                            text: 'Retirar na Loja',
                            fontSize: 14,
                            textColor: controller.lojaFisica == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 300,
                        child: TextFieldWidget(
                          textEditingController: controller.textSearch,
                          hintText: 'Produto, Loja, Categoria..',
                          onSubmit: (string) {
                            controller.getListLojas();
                            print('att');
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(CupertinoIcons.search),
                        onPressed: () {
                          controller.getListLojas();
                        },
                      ),
                    ],
                  ),
        ],
      ),
    );
  }
}
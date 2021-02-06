import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/modules/servicos/servicos_controller.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/lists/list_bairros.dart';
import 'package:net_cliente/app/shared/utils/lists/list_servicos.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';

class BuscarServicoPageWidget extends StatelessWidget {
  final ServicosController controller;

  const BuscarServicoPageWidget({Key key, @required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                SizedBox(
                  height: size.height * 0.02,
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
                          value: controller.categoria,
                          hint: TextWidget(
                            text: 'Todas Categorias',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.white,
                          ),
                          items: listServicos,
                          iconEnabledColor: Colors.white,
                          dropdownColor: Cores.verdeClaro,
                          onChanged: controller.selectCategoria,
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
                          onChanged: controller.getServicesDistric,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: 300,
                      child: TextFieldWidget(
                        textEditingController: controller.pesquisaController,
                        hintText: 'Produto, Loja, Categoria..',
                        onSubmit: (string) {
                          controller.getServicosParams();
                          print('att');
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.search),
                      onPressed: () {
                        controller.getServicosParams();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
              ],
            ),
          );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/shared/models/loja/carrinho_loja_page_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class TipoEntregaLojaWidget extends StatelessWidget {
  final CarrinhoLojaPageModel carrinho;

  const TipoEntregaLojaWidget({Key key, this.carrinho}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (carrinho.tipoEntrega == 1) {
        return Row(
          children: [
            Wrap(
              direction: Axis.vertical,
              children: [
                TextWidget(
                  text: 'Tipo de Entrega: ',
                  fontSize: 18,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 10,
                ),
                Observer(
                  builder: (_) => DropdownButtonHideUnderline(
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Cores.verdeClaro,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<bool>(
                        value: carrinho.controller.entregaDomicilio,
                        iconEnabledColor: Colors.white,
                        items: [
                          DropdownMenuItem(
                            value: true,
                            child: TextWidget(
                              text: 'Entrega em Domicílio',
                              fontSize: 16,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownMenuItem(
                            value: false,
                            child: TextWidget(
                              text: 'Retirar na Loja',
                              fontSize: 16,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        dropdownColor: Cores.verdeClaro,
                        onChanged: carrinho.controller.setEntregaDomicilio,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else if (carrinho.tipoEntrega == 2) {
        return Wrap(
          direction: Axis.vertical,
          children: [
            TextWidget(
              text: 'Tipo de Entrega: ',
              fontSize: 16,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: TextWidget(
                text: 'Disponível somente entrega em domicílio',
                fontSize: 16,
              ),
            )
          ],
        );
      } else if (carrinho.tipoEntrega == 3) {
        return Wrap(
          direction: Axis.vertical,
          children: [
            TextWidget(
              text: 'Tipo de Entrega: ',
              fontSize: 16,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: TextWidget(
                text: 'Disponível somente retirada em loja',
                fontSize: 16,
              ),
            )
          ],
        );
      }

      return TextWidget(
        text: 'Loja não aceitando pedidos no momento :/',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        textColor: Colors.grey[400],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/carrinho_rest/carrinho_rest_controller.dart';
import 'package:net_cliente/app/shared/models/rest/carrinho_rest_page_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class MetodoPagamentoRestWidget extends StatelessWidget {
  final CarrinhoRestPageModel carrinho;
  final CarrinhoRestController controller;

  const MetodoPagamentoRestWidget({Key key, this.carrinho, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          direction: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              child: TextWidget(
                text: 'Método de Pagamento',
                fontSize: 16,
              ),
            ),
            Observer(
              builder:(_) => Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: controller.pagamentoDinheiro,
                    onChanged: controller.setDinheiroOuCartao,
                    activeColor: Cores.verdeClaro,
                  ),
                  TextWidget(
                    text: 'Dinheiro',
                    fontSize: 16,
                  ),
                ],
              ),
            ),
            Observer(
              builder:(_) => Row(
                children: [
                  Radio(
                    value: false,
                    groupValue: controller.pagamentoDinheiro,
                    onChanged: controller.setDinheiroOuCartao,
                    activeColor: Cores.verdeClaro,
                  ),
                  TextWidget(
                    text: 'Cartão de Crédito (entregador)',
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

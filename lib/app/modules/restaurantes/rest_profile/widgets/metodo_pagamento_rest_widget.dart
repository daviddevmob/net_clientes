import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/shared/models/rest/carrinho_rest_page_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class MetodoPagamentoRestWidget extends StatelessWidget {
  final CarrinhoRestPageModel carrinho;

  const MetodoPagamentoRestWidget({Key key, this.carrinho}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          direction: Axis.vertical,
          children: [
            TextWidget(
              text: 'Método de Pagamento',
              fontSize: 18,
              textColor: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            Observer(
              builder:(_) => Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: carrinho.controller.pagamentoDinheiro,
                    onChanged: carrinho.controller.setDinheiroOuCartao,
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
                    groupValue: carrinho.controller.pagamentoDinheiro,
                    onChanged: carrinho.controller.setDinheiroOuCartao,
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

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/shared/models/loja/carrinho_loja_page_model.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class MetodoPagamentoLojaWidget extends StatelessWidget {
  final CarrinhoLojaPageModel carrinho;

  const MetodoPagamentoLojaWidget({Key key, this.carrinho}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          direction: Axis.vertical,
          children: [
            TextWidget(
              text: 'Método de Pagamento',
              fontSize: 16,
            ),
            Observer(
              builder:(_) => Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: carrinho.controller.pagamentoDinheiro,
                    onChanged: carrinho.controller.setDinheiroOuCartao,
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

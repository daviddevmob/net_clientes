import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/models/pedidos/pedidos_loja.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class ItensPedidoLojaWidget extends StatelessWidget {
  final LojaPedido pedido;

  const ItensPedidoLojaWidget({Key key, this.pedido}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ExpansionTile(
      title: TextWidget(
        text: 'Itens do Pedido',
        fontSize: 16,
        textColor: Cores.verdeClaro,
        fontWeight: FontWeight.bold,
      ),
      children: [
        ListView.builder(
          itemCount: pedido.lojaPedidoItems.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            var item = pedido.lojaPedidoItems[index];
            return Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      item.lojaProduto.foto1Link == null ||
                              item.lojaProduto.foto1Link == ''
                          ? Row(
                              children: [
                                Container(
                                  height: size.height * 0.1,
                                  width: size.width * 0.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.transparent),
                                    color: Cores.verdeClaro,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Container(
                                  height: size.height * 0.1,
                                  width: size.width * 0.2,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                        item.lojaProduto.foto1Link,
                                      ))),
                                ),
                              ],
                            ),
                      Row(
                        children: [
                          TextWidget(
                            text: item.lojaProduto.produtoNome,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      TextWidget(
                        text:'Uni: R\$ ' + item.precoUnidade.toStringAsFixed(2),
                        fontSize: 16,
                      ),
                      TextWidget(
                        text:'Qtd: ' + item.quantidade.toString(),
                        fontSize: 16,
                      ),
                      TextWidget(
                        text:'Total: R\$' + item.total.toStringAsFixed(2),
                        fontSize: 16,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

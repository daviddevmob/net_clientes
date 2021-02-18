import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/models/rest/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class ItensPedidoRestWidget extends StatelessWidget {
  final RestPedido pedido;

  const ItensPedidoRestWidget({Key key, this.pedido}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ExpansionTile(
      title: TextWidget(
        text: 'Itens do Pedido',
        fontSize: 14,
        textColor: Cores.verdeClaro,
        fontWeight: FontWeight.bold,
      ),
      children: [
        ListView.builder(
          itemCount: pedido.restItemPedidos.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            var item = pedido.restItemPedidos[index];
            return Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: item.restProduto.foto == null ||
                              item.restProduto.foto == ''
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
                                        fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                        item.restProduto.foto,
                                      ))),
                                ),
                              ],
                            ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Row(
                       children: [
                        Container(
                          width: size.width * 0.5,
                          child: TextWidget(
                            text: ' ' + item.restProduto.nome,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.5,
                            child: TextWidget(
                              text:' ${item.opcoesProduto}'
                              .replaceAll(',', '\n')
                              .replaceAll('(', '')
                              .replaceAll(')', ''),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.5,
                            child: TextWidget(
                              text:" ${item.complementos}",
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                     item.obs == null || item.obs == ""
                     ? SizedBox()
                     : Row(
                        children: [
                          Container(
                            width: size.width * 0.5,
                            child: TextWidget(
                              text: " ${item.obs}",
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.5,
                            child: TextWidget(
                              text:' Total: R\$' + item.total.toStringAsFixed(2),
                              fontSize: 14,
                              textColor: Cores.verdeClaro,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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

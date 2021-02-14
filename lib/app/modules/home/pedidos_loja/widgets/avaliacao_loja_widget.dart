import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:net_cliente/app/modules/home/pedidos_loja/dialogs_avaliacao_loja.dart';
import 'package:net_cliente/app/modules/home/pedidos_loja/pedidos_loja_controller.dart';
import 'package:net_cliente/app/shared/models/pedidos/pedidos_loja.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class AvaliacaoLoja extends StatelessWidget {
  final LojaPedido pedido;
  final PedidosLojaController controller;
  final int clienteId;

  const AvaliacaoLoja({Key key, this.pedido, this.controller, this.clienteId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
                                              children: [
                                                RatingBar.builder(
                                                      initialRating: pedido.lojaAvaliacaos[0].nota,
                                                      minRating: 0.5,
                                                      direction: Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                                      itemBuilder: (context, _) => Icon(
                                                        CupertinoIcons.star_fill,
                                                        color: Colors.amber,
                                                        size: 14,
                                                      ),
                                                      onRatingUpdate: null,
                                                    ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                pedido.lojaAvaliacaos[0].texto == null || pedido.lojaAvaliacaos[0].texto == ""
                                                ? SizedBox()
                                                : Container(
                                                      child: TextWidget(
                                                        text: pedido.lojaAvaliacaos[0].texto,
                                                        fontSize: 14,
                                                      ),
                                                ),
                                                pedido.lojaAvaliacaos[0].lojaComentarioAvaliacao == null
                                                ? TextWidget(
                                                    text: 'Restaurante ainda não respondeu',
                                                    fontSize: 12,
                                                    textColor: Colors.grey[500],
                                                  )
                                                : pedido.lojaAvaliacaos[0].lojaComentarioAvaliacao.texto == null || pedido.lojaAvaliacaos[0].lojaComentarioAvaliacao.texto == ""
                                                  ? TextWidget(
                                                    text: 'Restaurante ainda não respondeu',
                                                    fontSize: 12,
                                                    textColor: Colors.grey[500],
                                                  )
                                                  : Container(
                                                    child: TextWidget(
                                                      text: "Restaurante: " + pedido.lojaAvaliacaos[0].lojaComentarioAvaliacao.texto,
                                                      fontSize: 12,
                                                      textColor: Colors.grey[500],
                                                    ),
                                                  ),
                                                FlatButton(
                                                shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  color: Cores.verdeClaro,
                                                  onPressed: (){
                                                    controller.editarTextAvaliacao.text = pedido.lojaAvaliacaos[0].texto;
                                                    controller.editAvaliacao = pedido.lojaAvaliacaos[0].nota;
                                                    return DialogsAvaliacaoLojas()
                                                    .editarAvaliacao(
                                                      context, 
                                                      controller, 
                                                      clienteId, 
                                                      pedido.lojaId, 
                                                      pedido.lojaPedidoId, 
                                                      pedido.lojaAvaliacaos[0].lojaAvaliacaoId,
                                                      );
                                                  }, 
                                                  child: TextWidget(
                                                    text: 'Editar Avaliação',
                                                    fontSize: 14,
                                                    textColor: Colors.white,
                                                  ),
                                                  )
                                              ],
                                            );
  }
}
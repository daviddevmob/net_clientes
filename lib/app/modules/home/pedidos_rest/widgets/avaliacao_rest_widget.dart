import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:net_cliente/app/modules/home/pedidos_rest/dialogs_avaliacao.dart';
import 'package:net_cliente/app/modules/home/pedidos_rest/pedidos_rest_controller.dart';
import 'package:net_cliente/app/shared/models/rest/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class AvaliacaoRest extends StatelessWidget {
  final RestPedido pedido;
  final PedidosRestController controller;
  final int clienteId;

  const AvaliacaoRest({Key key, this.pedido, this.controller, this.clienteId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
                                              children: [
                                                RatingBar.builder(
                                                      initialRating: pedido.restAvaliacao.nota,
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
                                                pedido.restAvaliacao.texto == null || pedido.restAvaliacao.texto == ""
                                                ? SizedBox()
                                                : Container(
                                                      child: TextWidget(
                                                        text: pedido.restAvaliacao.texto,
                                                        fontSize: 14,
                                                      ),
                                                ),
                                                pedido.restAvaliacao.restComentarioAvaliacao == null
                                                ? TextWidget(
                                                    text: 'Restaurante ainda não respondeu',
                                                    fontSize: 12,
                                                    textColor: Colors.grey[500],
                                                  )
                                                : pedido.restAvaliacao.restComentarioAvaliacao.text == null || pedido.restAvaliacao.restComentarioAvaliacao.text == ""
                                                  ? TextWidget(
                                                    text: 'Restaurante ainda não respondeu',
                                                    fontSize: 12,
                                                    textColor: Colors.grey[500],
                                                  )
                                                  : Container(
                                                    child: TextWidget(
                                                      text: "Restaurante: " + pedido.restAvaliacao.restComentarioAvaliacao.text,
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
                                                    controller.editarTextAvaliacao.text = pedido.restAvaliacao.texto;
                                                    controller.editAvaliacao = pedido.restAvaliacao.nota;
                                                    return DialogsAvaliacaoRest()
                                                    .editarAvaliacao(
                                                      context, 
                                                      controller, 
                                                      clienteId, 
                                                      pedido.restId, 
                                                      pedido.restPedidoId, 
                                                      pedido.restAvaliacao.restAvaliacaoId,
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
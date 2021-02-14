import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/entregador_loja/page_loja_entregador_model.dart';
import 'package:net_cliente/app/shared/models/pedidos/pedidos_loja.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class PedidoLojaEntregadorTile extends StatelessWidget {
  final LojaPedido pedido;

  const PedidoLojaEntregadorTile({Key key, this.pedido}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: TextWidget(
        text: 'Sobre a Entrega',
        fontSize: 16,
        textColor: Cores.verdeClaro,
        fontWeight: FontWeight.bold,
        ),
      children: [
        Wrap(
          spacing: 25,
          children: [
            Container(
              child: pedido.entregador.fotoLink != '' || pedido.entregador.fotoLink != null
            ? Wrap(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        pedido.entregador.fotoLink
                      ),
                    )
                  ),
                ),
              ],
            )
            : Container(),
            ),
            Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.start,
              children: [
                Container(
                  child: TextWidget(
                    text: 'Entregador: ' + pedido.entregador.nome.split(' ').first,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 30,
                  child: FlatButton(
                  color: Cores.azul,
                  onPressed: (){
                    PageLojaEntregadorModel entregador = new PageLojaEntregadorModel(
                            pedido.localizacao, 
                            pedido.entregadorId,
                            pedido.lojaPedidoId,
                            );
                          Modular.to.pushNamed(
                            '/maps_loja_entregador',
                            arguments: entregador,
                            );
                  },
                  child: TextWidget(
                    text: 'Ver no Mapa',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white,
                    )
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
          
        ),
        
      ],
       );
  }
}

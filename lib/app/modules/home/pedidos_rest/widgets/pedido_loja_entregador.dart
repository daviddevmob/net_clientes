import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/entregador/page_entregador_model.dart';
import 'package:net_cliente/app/shared/models/rest/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class PedidoRestEntregadorTile extends StatelessWidget {
  final RestPedido pedido;

  const PedidoRestEntregadorTile({Key key, this.pedido}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: TextWidget(
        text: 'Acompanhe a entrega',
        fontSize: 14,
        textColor: Cores.verdeClaro,
        fontWeight: FontWeight.bold,
        ),
      children: [
        Row(
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
                          fit: BoxFit.cover,
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
                        fontWeight: FontWeight.w500,
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
                        PageEntregadorModel entregador = new PageEntregadorModel(
                          pedido.localizacao, 
                          pedido.entregadorId,
                          pedido.restPedidoId,
                          );
                        Modular.to.pushNamed(
                          '/maps_entregador',
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
        ),
        
      ],
       );
  }
}

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/home/pedidos_loja/dialogs_avaliacao_loja.dart';
import 'package:net_cliente/app/modules/home/pedidos_loja/widgets/avaliacao_loja_widget.dart';
import 'package:net_cliente/app/modules/home/pedidos_loja/widgets/pedido_loja_entregador.dart';
import 'package:net_cliente/app/modules/home/pedidos_loja/widgets/pedido_loja_itens.dart';
import 'package:net_cliente/app/shared/models/localizacao_model.dart';
import 'package:net_cliente/app/shared/models/pedidos/pedidos_loja.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'pedidos_loja_controller.dart';

class PedidosLojaPage extends StatefulWidget {
  final int clienteId;
  const PedidosLojaPage({Key key, @required this.clienteId}) : super(key: key);

  @override
  _PedidosLojaPageState createState() => _PedidosLojaPageState();
}

class _PedidosLojaPageState
    extends ModularState<PedidosLojaPage, PedidosLojaController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getPedidosLojaUser(widget.clienteId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: 'Pedidos em Lojas',
          viewLeading: true,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.pedidos.data == null) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          // ignore: unrelated_type_equality_checks
          if (controller.pedidos.isEmpty == true) {
            return Center(
              child: TextWidget(
                text: 'Você ainda não tem pedidos',
              ),
            );
          }

          PedidosLojaModel pedidos = controller.pedidos.value;

          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  pedidos.lojaPedidos.isEmpty == false
                      ? SizedBox(
                          height: 20,
                        )
                      : SizedBox(),
                  pedidos.lojaPedidos.isEmpty == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: 'Sem pedidos até agora',
                              fontWeight: FontWeight.bold,
                              textColor: Colors.grey[400],
                            ),
                          ],
                        )
                      : ListView.separated(
                          itemCount: pedidos.lojaPedidos.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          separatorBuilder: (context, index){
                            return Divider(
                              color: Colors.transparent,
                            );
                          },
                          itemBuilder: (context, index) {
                            var pedido = pedidos.lojaPedidos[index];
                            String statusPedido = SwitchsUtils()
                                .getStatusPedido(pedido.statusPedido);
                            String metodoPagamento = SwitchsUtils()
                                .getMetodoPagamento(pedido.metodoPagamento);
                            return Container(
                              margin: EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                              ),
                              child: Card(
                                elevation: 2,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextWidget(
                                              text: pedido.lojaGeral.lojaNome,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text: 'Número do Pedido: ',
                                            fontSize: 14,
                                          ),
                                          TextWidget(
                                            text: pedido.numeroPedido.toString(),
                                            fontSize: 14,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text: 'Status do Pedido: ',
                                            fontSize: 14,
                                          ),
                                          TextWidget(
                                            text: statusPedido,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            textColor: pedido.statusPedido == 1
                                                ? Colors.orange
                                                : pedido.statusPedido == 2
                                                    ? Colors.green
                                                    : pedido.statusPedido == 3
                                                        ? Colors.blue
                                                        : pedido.statusPedido ==
                                                                5
                                                            ? Cores.azul
                                                            : Colors.red,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text: formatDate(
                                                pedido.criadoEm.toLocal(),
                                                [dd, '/', mm, '/', yyyy]),
                                            fontSize: 14,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Observer(
                                        builder: (_) {
                                          if (pedido.entrega == true &&
                                              pedido.statusPedido != 4 &&
                                              pedido.statusPedido != 5 &&
                                              pedido.statusPedido != 1) {
                                            if (pedido.entregadorId != null &&
                                            pedido.statusPedido == 3) {
                                              return PedidoLojaEntregadorTile(
                                                pedido: pedido,
                                              );
                                            }
                                            return Row(
                                              children: [
                                                TextWidget(
                                                  text: 'Preparando para entrega',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  textColor: Colors.blue,
                                                ),
                                              ],
                                            );
                                          }
                                          return SizedBox();
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      ItensPedidoLojaWidget(
                                        pedido: pedido,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      pedido.entrega == true
                                          ? Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    TextWidget(
                                                      text: 'Taxa de Entrega: ',
                                                      fontSize: 14,
                                                    ),
                                                    TextWidget(
                                                      text: 'R\$ ' +
                                                          pedido.taxaEntrega
                                                              .toStringAsFixed(2),
                                                      fontSize: 14,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.005,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextWidget(
                                                        text: 'Endereço: ' +
                                                            pedido.endereco,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TextWidget(
                                                  text: 'Retirada em Loja',
                                                  fontSize: 14,
                                                ),
                                                FlatButton(
                                                  color: Colors.blue,
                                                  onPressed: () {
                                                    var loc = pedido.lojaGeral
                                                        .usuario.localizacao;
                                                    LocalizacaoModel
                                                        localizacao =
                                                        new LocalizacaoModel(
                                                      complemento:
                                                          loc.complemento,
                                                      endereco: loc.endereco,
                                                      mapaLink: loc.mapaLink,
                                                    );
                                                    Modular.to.pushNamed(
                                                        '/maps_view',
                                                        arguments: localizacao);
                                                  },
                                                  child: TextWidget(
                                                    text: 'Ver no Mapa',
                                                    fontSize: 14,
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text: 'Pagamento: ',
                                            fontSize: 14,
                                          ),
                                          TextWidget(
                                            text: pedido.metodoPagamento == 0
                                                ? 'Dinheiro'
                                                : 'Crédito($metodoPagamento)',
                                            fontSize: 14,
                                          )
                                        ],
                                      ),
                                      pedido.troco == null || pedido.troco == ''
                                          ? SizedBox()
                                          : Row(
                                              children: [
                                                TextWidget(
                                                  text:
                                                      'Você pediu troco para:',
                                                  fontSize: 14,
                                                ),
                                                TextWidget(
                                                  text: ' R\$ ' + pedido.troco,
                                                  fontSize: 14,
                                                ),
                                              ],
                                            ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text: 'Total do Pedido: ',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          TextWidget(
                                            text: 'R\$ ' +
                                                pedido.totalPedido
                                                    .toStringAsFixed(2),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      pedido.statusPedido == 4
                                          ? Row(
                                              children: [
                                                Expanded(
                                                  child: TextWidget(
                                                    text: 'Cancelado por: ',
                                                    fontSize: 14,
                                                    textColor: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextWidget(
                                                    text: pedido.aviso != null
                                                        ? pedido.aviso
                                                        : '-',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    textColor: Colors.red,
                                                  ),
                                                )
                                              ],
                                            )
                                          : SizedBox(),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          child: pedido.statusPedido == 5 ?
                                          pedido.lojaAvaliacaos.isEmpty || pedido.lojaAvaliacaos == null
                                            ? FlatButton(
                                                shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              color: Cores.verdeClaro,
                                              onPressed: (){
                                                return DialogsAvaliacaoLojas()
                                                .salvarAvaliacao(
                                                  context, 
                                                  controller, 
                                                  widget.clienteId,
                                                  pedido.lojaId, 
                                                  pedido.lojaPedidoId,
                                                  );
                                              }, 
                                              child: TextWidget(
                                              text: 'Avalie o atendimento',
                                              fontSize: 14,
                                              textColor: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              ))
                                            : AvaliacaoLoja(
                                              clienteId: widget.clienteId,
                                              controller: controller,
                                              pedido: pedido,
                                            )
                                          : SizedBox(),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

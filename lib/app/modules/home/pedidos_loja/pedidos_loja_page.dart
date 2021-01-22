import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/home/pedidos_loja/widgets/pedido_loja_itens.dart';
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
                top: 30,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextWidget(
                        text: 'Meus Pedidos',
                        fontSize: 18,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ListView.builder(
                      itemCount: pedidos.lojaPedidos.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var pedido = pedidos.lojaPedidos[index];
                        String statusPedido =
                            SwitchsUtils().getStatusPedido(pedido.statusPedido);
                        String metodoPagamento = SwitchsUtils()
                            .getMetodoPagamento(pedido.metodoPagamento);
                        return Container(
                          margin: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          child: Card(
                            elevation: 4,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextWidget(
                                          text: pedido.lojaGeral.lojaNome,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text: 'Status do Pedido: ',
                                        fontSize: 16,
                                      ),
                                      TextWidget(
                                        text: statusPedido,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        textColor: pedido.statusPedido == 1
                                            ? Colors.orange
                                            : pedido.statusPedido == 2
                                                ? Colors.green
                                                : pedido.statusPedido == 3
                                                    ? Colors.blue
                                                    : pedido.statusPedido == 5
                                                        ? Cores.azul
                                                        : Colors.red,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  /* pedido.statusPedido == 3 
                                  ? Row(
                                    children: [
                                      FlatButton(
                                        color: Colors.blue,
                                        onPressed: (){

                                        }, 
                                        child: TextWidget(
                                          text: 'Ver no Mapa',
                                          fontSize: 16,
                                          textColor: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                  : SizedBox(),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ), */
                                  ItensPedidoLojaWidget(
                                    pedido: pedido,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  pedido.entrega == false
                                      ? Column(
                                          children: [
                                            Row(
                                              children: [
                                                TextWidget(
                                                  text: 'Taxa de Entrega: ',
                                                  fontSize: 16,
                                                ),
                                                TextWidget(
                                                  text: 'R\$ ' +
                                                      pedido.taxaEntrega
                                                          .toString(),
                                                  fontSize: 16,
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
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            TextWidget(
                                              text: 'Retirada em Loja',
                                              fontSize: 16,
                                            ),
                                          ],
                                        ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text: 'Pagamento: ',
                                        fontSize: 16,
                                      ),
                                      TextWidget(
                                        text: pedido.metodoPagamento == 0
                                        ? 'Dinheiro'
                                        : 'Crédito($metodoPagamento)',
                                        fontSize: 16,
                                      )
                                    ],
                                  ),
                                  pedido.troco == null || pedido.troco == ''
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            TextWidget(
                                              text: 'Você pediu troco para:',
                                              fontSize: 16,
                                            ),
                                            TextWidget(
                                              text: ' R\$ ' + pedido.troco,
                                              fontSize: 16,
                                            ),
                                          ],
                                        ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text: 'Total do Pedido: ',
                                        fontSize: 16,
                                      ),
                                      TextWidget(
                                        text: 'R\$ ' +
                                            pedido.totalPedido
                                                .toStringAsFixed(2),
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  pedido.statusPedido == 4
                                  ? Row(
                                    children: [
                                      Expanded(
                                       child: TextWidget(
                                          text: 'Cancelado por: ',
                                          fontSize: 16,
                                          textColor: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextWidget(
                                          text: pedido.aviso,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          textColor: Colors.red,
                                        ),
                                      )
                                    ],
                                  )
                                  : SizedBox()
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/widgets/metodo_pagamento_rest_widget.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/widgets/tipo_entrega_rest_widget.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
import 'carrinho_rest_controller.dart';
import 'package:net_cliente/app/shared/models/rest/carrinho_rest_page_model.dart';

class CarrinhoRestPage extends StatefulWidget {
  final CarrinhoRestPageModel carrinho;
  const CarrinhoRestPage({Key key, @required this.carrinho})
      : super(key: key);

  @override
  _CarrinhoRestPageState createState() => _CarrinhoRestPageState();
}

class _CarrinhoRestPageState
    extends ModularState<CarrinhoRestPage, CarrinhoRestController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: Observer(
          builder: (_) => AppBarWidget(
            title: 'Seu Carrinho',
            viewLeading: true,
          ),
        ),
      ),
      body: SingleChildScrollView(
        /* child: Observer(builder: (_) {
          double valorTotal = 0;
          double taxaEntrega = 0;
          bool entrega;
          if (widget.carrinho.controller.entregaDomicilio == true &&
                  widget.carrinho.tipoEntrega != 3 &&
                  widget.carrinho.tipoEntrega != 4 ||
              widget.carrinho.tipoEntrega == 2) {
            entrega = true;
            taxaEntrega = widget.carrinho.taxaEntrega;
          } else {
            entrega = false;
            taxaEntrega = 0;
          }
          if (widget.carrinho.controller.produtosCarrinho.isEmpty == false) {
            if (widget.carrinho.controller.entregaDomicilio == true &&
                    widget.carrinho.tipoEntrega != 3 &&
                    widget.carrinho.tipoEntrega != 4 ||
                widget.carrinho.tipoEntrega == 2) {
              valorTotal =
                  widget.carrinho.taxaEntrega + widget.carrinho.controller.totalPedido;
            } else {
              valorTotal = widget.carrinho.controller.totalPedido;
            }
          }
          if (widget.carrinho.controller.pedidoSalvo == true) {
            return Container(
              margin: EdgeInsets.only(
                top: 250,
              ),
              height: size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Column(
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text: 'Pedido Realizado!',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                CupertinoIcons.check_mark_circled,
                                color: Colors.green,
                                )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: 'Acompanhe em ',
                                fontSize: 14,
                              ),
                              TextWidget(
                                text: 'Meus Pedidos',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(CupertinoIcons.cube_box),
                            ],
                          ),
                        ],
                      ),
                  ],
              ),
            );
          }
          return Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: widget.carrinho.controller.produtosCarrinho.isEmpty == true
                ? Container(
                  margin: EdgeInsets.only(
                    top: 250,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'Sem itens no carrinho',
                          textColor: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                )
                : Observer(
                    builder: (_) => Form(
                      key: widget.carrinho.controller.formCarrinhoKey,
                      child: Column(
                        children: [
                          Observer(
                            builder: (_) => ListView.builder(
                              itemCount:
                                  widget.carrinho.controller.produtosCarrinho.length,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                var item =
                                   widget.carrinho.controller.produtosCarrinho[index];

                                double precoFinal;
                                if (item.produto.precoPromo != 0 &&
                                    item.produto.preco >
                                        item.produto.precoPromo) {
                                  precoFinal = item.produto.precoPromo;
                                } else {
                                  precoFinal = item.produto.preco;
                                }

                                return Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: Stack(
                                    children: [
                                      Wrap(
                                        spacing: 10,
                                        children: [
                                          Observer(
                                            builder: (_) => Container(
                                              child: item.produto.foto ==
                                                          null ||
                                                      item.produto.foto ==
                                                          ''
                                                  ? Container(
                                                      height: 60,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        color: Cores.verdeClaro,
                                                        border: Border.all(
                                                            color: Colors
                                                                .transparent),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 60,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .transparent),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image:
                                                              CachedNetworkImageProvider(
                                                            item.produto
                                                                .foto,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: Wrap(
                                              direction: Axis.vertical,
                                              spacing: 5,
                                              children: [
                                                TextWidget(
                                                  text:
                                                      item.produto.nome,
                                                  textColor: Colors.black,
                                                  fontSize: 14,
                                                ),
                                                TextWidget(
                                                  text:
                                                      'R\$ ${precoFinal.toStringAsFixed(2)}',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        left: 250,
                                        child: Row(
                                          children: [
                                            Observer(
                                              builder: (_) => IconButton(
                                                  iconSize: 25,
                                                  icon: Icon(
                                                    item.quantidade == 1
                                                        ? CupertinoIcons.delete
                                                        : CupertinoIcons
                                                            .minus_circle,
                                                    color: item.quantidade == 1
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                  onPressed: () async {
                                                    if (await ConnectionVerify
                                                        .connectionStatus()) {
                                                      if(item.quantidade == 1){
                                                        widget.carrinho.controller
                                                          .deleteItemCarrinho(
                                                            item.produto);
                                                      }else{
                                                        widget.carrinho.controller
                                                          .removeItemCarrinho(
                                                          item.produto);
                                                      }
                                                    } else {
                                                      return InternetFlushBar()
                                                          .showFlushBarInternet(
                                                              context);
                                                    }
                                                  }),
                                            ),
                                            Observer(
                                              builder: (_) => TextWidget(
                                                text: '${item.quantidade}',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Observer(
                                              builder: (_) => IconButton(
                                                iconSize: 25,
                                                icon: Icon(
                                                  CupertinoIcons.add_circled,
                                                  color: Colors.green,
                                                ),
                                                onPressed: () async {
                                                  if (await ConnectionVerify
                                                      .connectionStatus()) {
                                                    bool add = await widget.carrinho
                                                        .controller
                                                        .addItemCarrinho(
                                                            item.produto);
                                                    if (add == true) {
                                                      print('ok');
                                                    } else {
                                                      return AvisoFlushBar()
                                                          .showFlushBarAviso(
                                                        context,
                                                        'Ops!',
                                                        'Produto sem estoque',
                                                      );
                                                    }
                                                  } else {
                                                    return InternetFlushBar()
                                                        .showFlushBarInternet(
                                                            context);
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TipoEntregaRestWidget(
                            carrinho: widget.carrinho,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: 'Total dos produtos: ',
                                  fontSize: 16,
                                ),
                                Observer(
                                  builder: (_) => TextWidget(
                                    text:
                                        'R\$ ${widget.carrinho.controller.totalPedido.toStringAsFixed(2)}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Observer(
                            builder: (_) => Container(
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                child: widget.carrinho.controller.entregaDomicilio ==
                                                true &&
                                            widget.carrinho.tipoEntrega != 3 &&
                                            widget.carrinho.tipoEntrega != 4 ||
                                        widget.carrinho.tipoEntrega == 2
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: 'Taxa de Entrega: ',
                                            fontSize: 16,
                                          ),
                                          Observer(
                                            builder: (_) => TextWidget(
                                              text:
                                                  'R\$ ${widget.carrinho.taxaEntrega.toStringAsFixed(2)}',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox()),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: 'Total do Pedido: ',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                Observer(
                                  builder: (_) => TextWidget(
                                    text:
                                        'R\$ ${valorTotal.toStringAsFixed(2)}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MetodoPagamentoRestWidget(
                            carrinho: widget.carrinho,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Observer(
                            builder: (_) => Visibility(
                              visible: !widget.carrinho.controller.pagamentoDinheiro,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    DropdownButtonHideUnderline(
                                      child: Container(
                                        height: 40,
                                        padding: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Cores.verdeClaro,
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: DropdownButton<int>(
                                          value: widget.carrinho
                                              .controller.metodoPagamentoCartaoId,
                                          hint: TextWidget(
                                            text: 'Selecione a bandeira do cartão',
                                            fontSize: 16,
                                            textColor: Colors.white,
                                          ),
                                          dropdownColor: Cores.verdeClaro,
                                          items: widget.carrinho.metodos.map((e) {
                                            return DropdownMenuItem<int>(
                                              value: e.metodoId,
                                              child: TextWidget(
                                                text: e.nomeMetodo,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                textColor: Colors.white,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: widget.carrinho.controller
                                              .setMetodoPagamentoCartaoId,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                ),
                                width: size.width * 0.8,
                                child: Visibility(
                                  visible:
                                      widget.carrinho.controller.pagamentoDinheiro,
                                  child: Wrap(
                                    spacing: 10,
                                    children: [
                                      Observer(
                                        builder: (_) => TextFieldWidget(
                                          textEditingController: widget.carrinho
                                              .controller.trocoParaController,
                                          hintText: 'Com quanto você pagará ?',
                                          textInputType: TextInputType.number,
                                          labelText: 'Troco para: ',
                                          prefix: TextWidget(
                                            text: 'R\$ ',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            textColor: Colors.green,
                                          ),
                                          validator: (value) {
                                            if (value == '' || value == null) {
                                              return 'Campo obrigatório';
                                            }
                                            if (double.parse(value
                                                    .replaceAll(',', '.')
                                                    .replaceAll(' ', '')) <
                                                widget.carrinho
                                                    .controller.totalPedido) {
                                              return 'Valor abaixo do total do pedido';
                                            }
                                            if (double.parse(value
                                                    .replaceAll(',', '.')
                                                    .replaceAll(' ', '')) ==
                                                0) {
                                              return 'Você precisa informar com quanto irá pagar';
                                            }

                                            return null;
                                          },
                                        ),
                                      ),
                                      TextWidget(
                                        text:
                                            'É necessário sabermos com quanto você irá pagar para levarmos o troco.',
                                        fontSize: 16,
                                        textColor: Colors.grey[500],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Observer(
                            builder: (_) => Observer(
                              builder:(_) => FlatButton(
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(color: Colors.transparent)),
                                color: Colors.blue,
                                disabledColor: Colors.grey,
                                onPressed: widget.carrinho.aberto == null
                                ? null
                                : () async {
                                  if (await ConnectionVerify.connectionStatus()) {
                                    if (widget.carrinho
                                        .controller.formCarrinhoKey.currentState
                                        .validate()) {
                                      if (widget.carrinho.controller.pagamentoDinheiro ==
                                              false &&
                                          widget.carrinho.controller
                                                  .metodoPagamentoCartaoId ==
                                              null) {
                                        return AvisoFlushBar().showFlushBarAviso(
                                          context,
                                          'Cartão de Crédito',
                                          'Selecione a bandeira do cartão de crédito',
                                        );
                                      } else {
                                        await widget.carrinho.controller.savePedido(
                                          widget.carrinho.restProfileModule,
                                          widget.carrinho,
                                          entrega,
                                          taxaEntrega,
                                          valorTotal,
                                        );
                                      }
                                    } 
                                  } else {
                                      return InternetFlushBar()
                                          .showFlushBarInternet(context);
                                    }
                                },
                                child: TextWidget(
                                  text: widget.carrinho.aberto == null 
                                  ? 'Loja Fechada'
                                  : 'Concluir Pedido',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        }), */
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/carrinho_rest/widget/metodo_pagamento_rest.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/carrinho_rest/widget/tipo_entrega_rest.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
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

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      controller.taxaEntrega = widget.carrinho.taxaEntrega;
      controller.clienteId = widget.carrinho.restProfileModule.cliente.clienteId;
    });
    super.initState();
  }

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
         child: Observer(builder: (_) {

            if(controller.produtos == null){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                      text: 'Nenhum Produto cadastrado',
                    ),
                ],
              );
            }

           if(controller.produtos.isEmpty){
             return Center(
               child: TextWidget(
                 text: 'Carrinho vazio',
               ),
              );
           } 

          if(controller.salvo == true){
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
                              Icon(CupertinoIcons.bag),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          FlatButton(
                            color: Cores.verdeClaro,
                            onPressed: (){
                              Modular.to.pop();
                              Modular.to.pop();
                              Modular.to.pushReplacementNamed(
                                '/home/pedidos_rest/',
                                arguments: widget.carrinho.restProfileModule.cliente.clienteId,
                                );
                            }, 
                            child: TextWidget(
                              text: 'Ir para Pedidos',
                              fontSize: 16,
                              textColor: Colors.white,
                            ),
                            )
                        ],
                      ),
                  ],
              ),
            );
          }

          if(controller.salvando == true){
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

           var produto = controller.produtos;
           return Container(
             child: Observer(
                builder:(_) => Form(
                 key: controller.formKey,
                  child: Column(
                   children: [
                     SizedBox(
                       height: 25,
                     ),
                     ListView.separated(
                       itemCount: produto.length,
                       shrinkWrap: true,
                       separatorBuilder: (context, index){
                         return Divider(
                           color: Colors.transparent,
                         );
                       },
                       physics: ScrollPhysics(),
                       itemBuilder: (context, index){
                         var p = produto[index];
                         return ListTile(
                           leading: p.foto == null || p.foto == ''
                           ? SizedBox()
                           : GestureDetector(
                              onTap: (){
                                Modular.to.pushNamed('/rest_profile/carrinho_rest/view_foto',
                                arguments: p.foto);
                              },
                              child: Container(
                               height: 80,
                               width: 80,
                               decoration: BoxDecoration(
                                 border: Border.all(
                                   color: Colors.transparent,
                                 ),
                                 borderRadius: BorderRadius.circular(4),
                                 image: DecorationImage(
                                   fit: BoxFit.cover,
                                   image: CachedNetworkImageProvider(
                                     p.foto,
                                   )
                                 )
                               ),
                             ),
                           ),
                           title: TextWidget(
                             text: p.nome,
                             fontSize: 16,
                             fontWeight: FontWeight.w400,
                           ),
                           subtitle: Column(
                             children: [
                               Row(
                                 children: [
                                   TextWidget(
                                     text: p.opcoes
                                     .replaceAll('(', '')
                                     .replaceAll(')', '')
                                     .replaceAll(',', '\n')
                                     .replaceAll(' ', '')
                                     .replaceAll(':', ': '),
                                     fontSize: 12,
                                   ),
                                 ],
                               ),
                               p.complementos == null && p.complementos == ''
                               ?  SizedBox()
                               : Row(
                                 children: [
                                   Container(
                                     width: 160,
                                     child: Container(
                                       width: 150,
                                       child: TextWidget(
                                         text: p.complementos,
                                         fontSize: 12,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   TextWidget(
                                    text: 'R\$ ${p.total.toStringAsFixed(2)}',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                   )
                                 ],
                               ),
                             ],
                           ),
                           trailing: IconButton(
                             icon: Icon(
                               CupertinoIcons.delete,
                               size: 18,
                               ), 
                             onPressed: () async {
                               await controller.deleteProduto(p);
                             },
                             ),
                         );
                       },
                     ),
                     SizedBox(
                       height: 30,
                     ),
                     Observer(
                        builder:(_) => TipoEntregaRest(
                         carrinho: widget.carrinho,
                         controller: controller,
                       ),
                     ),
                     SizedBox(
                       height: 30,
                     ),
                    Observer(
                      builder:(_) => MetodoPagamentoRestWidget(
                        carrinho: widget.carrinho,
                        controller: controller,
                      ),
                    ),
                    Observer(
                      builder: (_) => Visibility(
                      visible: !controller.pagamentoDinheiro,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              DropdownButtonHideUnderline(
                                child: Container(
                                  height: 40,
                                  padding: EdgeInsets.only(left: 10,),
                                  decoration: BoxDecoration(
                                    color: Cores.verdeClaro,
                                    border: Border.all(color: Colors.transparent,),
                                    borderRadius: BorderRadius.circular(8),
                                        ),
                                    child: Observer(
                                      builder:(_) => DropdownButton<int>(
                                        value: controller.metodoPagamentoCartaoId,
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
                                                  onChanged: controller.setMetodoPagamentoCartaoId,
                                                ),
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
                                        visible: controller.pagamentoDinheiro,
                                        child: Wrap(
                                          spacing: 10,
                                          children: [
                                            Observer(
                                              builder: (_) => TextFieldWidget(
                                                textEditingController: controller.trocoParaController,
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
                                                      controller.totalPedido) {
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
                    ],
                 ),
               ),
             ),
           );
         }
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_){
          if(controller.produtos == null){
            return SizedBox();
          }

          if(controller.produtos.isEmpty){
            return SizedBox();
          }

          if(controller.salvando == true || controller.salvo == true){
            return SizedBox();
          }

          return Container(
            height: 50,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.grey[500],
                )
              ]
            ),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'Total: R\$ ${controller.totalPedido.toStringAsFixed(2).replaceAll('.', ',')}',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.black,
                ),
                Observer(
                  builder:(_) => FlatButton(
                    color: Colors.red,
                    disabledColor: Colors.grey,
                    onPressed: controller.liberarPedir == false
                    ? null
                    : () async {
                      if(controller.pagamentoDinheiro == true){
                        if(controller.formKey.currentState.validate()){
                        var salvar = await controller.fazerPedido(
                            widget.carrinho.restProfileModule.cliente.clienteId, 
                            widget.carrinho.restProfileModule.restGeral.restId, 
                            widget.carrinho.restProfileModule.cliente.bairro, 
                            widget.carrinho.restProfileModule.cliente.firebaseId, 
                            widget.carrinho.restProfileModule.endereco.endereco, 
                            widget.carrinho.restProfileModule.endereco.latlgn,
                            );
                          print(salvar);
                        } else{
                          return AvisoFlushBar().showFlushBarAviso(
                            context, 
                            'Erro ao pedir', 
                            'O valor para troco precisa ser maior ou igual ao total do pedido',
                            );
                        }
                      } else{
                        var salvar = await controller.fazerPedido(
                            widget.carrinho.restProfileModule.cliente.clienteId, 
                            widget.carrinho.restProfileModule.restGeral.restId, 
                            widget.carrinho.restProfileModule.cliente.bairro, 
                            widget.carrinho.restProfileModule.cliente.firebaseId, 
                            widget.carrinho.restProfileModule.endereco.endereco, 
                            widget.carrinho.restProfileModule.endereco.latlgn,
                            );
                          print(salvar);
                      } 
                    }, 
                    child: TextWidget(
                      text: 'Pedir Agora!',
                      fontSize: 18,
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

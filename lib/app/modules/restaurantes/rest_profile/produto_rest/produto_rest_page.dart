import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/rest/produto_view/produto_view_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'produto_rest_controller.dart';

class ProdutoRestPage extends StatefulWidget {
  final ProdutoRestViewModel produto;
  const ProdutoRestPage({Key key, @required this.produto})
      : super(key: key);

  @override
  _ProdutoRestPageState createState() => _ProdutoRestPageState();
}

class _ProdutoRestPageState
    extends ModularState<ProdutoRestPage, ProdutoRestController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
     await controller.getProdutoView(widget.produto.produtoId, widget.produto.categoriaId);
     await controller.criarRadios();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: Observer(builder: (_) {
          if (controller.produto != null) {
            return AppBarWidget(
              title: controller.produto.restProdutos[0].nome,
              viewLeading: true,
                  );
             }
            return SizedBox();
          }),
      ),
      body:  Observer(
        builder: (_){
          if(controller.produto != null){
           return SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                height: 300,
                child: Observer(builder: (_) {
                  if (controller.produto.restProdutos[0].foto != null) {
                    return  Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                controller.produto.restProdutos[0].foto,
                              ))));
                  }
                  double preco = 
                  controller.produto.restProdutos[0].precoPromo != 0 
                  && controller.produto.restProdutos[0].precoPromo < controller.produto.restProdutos[0].preco
                    ? controller.produto.restProdutos[0].precoPromo
                    : controller.produto.restProdutos[0].preco;
                  return Container(
                    color: Cores.verdeClaro,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'Produto Sem Foto',
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextWidget(
                        text: controller.produto.restProdutos[0].nome,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextWidget(
                        text: controller.produto.restProdutos[0].descricao,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              controller.produto.restProdutos[0].restOpcaos.isEmpty == true
              ? SizedBox()
              : ListView.builder(
                itemCount: controller.produto.restProdutos[0].restOpcaos.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index){
                  var op = controller.produto.restProdutos[0].restOpcaos[index];
                  return  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Stack(
                        children: [
                         TextWidget(
                              text: op.opcaoNome,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top:20,
                              left: 0,
                            ),
                            child: ListView.builder(
                              itemCount: op.restOpcaoItems.length,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, x){
                                var i = op.restOpcaoItems[x];
                                return Observer(
                                  builder:(_) => RadioListTile(
                                    groupValue: controller.value[index],
                                    value: i.itemPreco,
                                    title: TextWidget(
                                      text: i.itemNome,
                                      fontSize: 16,
                                      textColor: Colors.black,
                                    ),
                                    subtitle: TextWidget(
                                      text: 'R\$ ${i.itemPreco.toStringAsFixed(2)}',
                                      fontSize: 16,
                                        ),
                                    onChanged: (value){
                                       setState(() {
                                          controller.value[index] = value;
                                       });
                                      },
                                      ),
                                );
                                  }
                                ),
                          )
                            ],
                    ),
                  );
                },
                ),
              SizedBox(
                height: 20,
              ),
              controller.produto.restProdutos[0].precoPromo != 0 &&
                      controller.produto.restProdutos[0].precoPromo < controller.produto.restProdutos[0].preco
                  ? Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text:
                                    'De: R\$ ${controller.produto.restProdutos[0].preco.toStringAsFixed(2)}',
                                fontSize: 13,
                                textColor: Colors.grey[500],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text:
                                    'Por: R\$ ${controller.produto.restProdutos[0].precoPromo.toStringAsFixed(2)}',
                                fontSize: 18,
                                textColor: Colors.green,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          TextWidget(
                            text:
                                'R\$ ${controller.produto.restProdutos[0].preco.toStringAsFixed(2)}',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 35,
              ),
             controller.produto.restAdicionals.isEmpty
              ? SizedBox()
              : Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 10
                        ),
                        child: TextWidget(
                          text: 'Adicionais: ',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: controller.produto.restAdicionals.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index){
                      var add = controller.produto.restAdicionals[index];
                      int quantidade = 0;
                      return ListTile(
                        title: TextWidget(
                          text: add.nome,
                          fontSize: 16,
                        ),
                        subtitle: TextWidget(
                          text: 'R\$ ${add.preco.toStringAsFixed(2)}',
                          fontSize: 16,
                        ),
                        trailing: Container(
                          width: 120,
                          child: Stack(
                            children: [
                              Positioned(
                                right: 1,
                                child: Observer(
                                  builder:(_) => IconButton(
                                    icon: Icon(
                                      CupertinoIcons.add_circled,
                                      color: Colors.black,
                                      ),
                                    onPressed: (){
                                      quantidade = quantidade + 1;
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                top: 12,
                                child: Observer(
                                  builder:(_) => TextWidget(
                                        text: quantidade.toString(),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                    ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  CupertinoIcons.minus_circle,
                                  color: Colors.black,
                                  ),
                                onPressed: quantidade == 0 
                                ? null
                                : (){
                                  quantidade = quantidade - 1;
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () async {
                        if (await ConnectionVerify.connectionStatus()) {
                          bool add = await controller
                              .addItemCarrinho(widget.produto.produtoId);
                          if (add == true) {
                            Modular.to.pop();
                            return AvisoFlushBar().showFlushBarAviso(
                              context,
                              'Produto Adicionado ao Carrinho!',
                              'Verifique na barra superior',
                            );
                          } else {
                            return AvisoFlushBar().showFlushBarAviso(
                              context,
                              'Ops!',
                              'Produto sem estoque',
                            );
                          }
                        } else {
                          return InternetFlushBar()
                              .showFlushBarInternet(context);
                        }
                      },
                      child: TextWidget(
                        text: 'Adicionar ao Carrinho',
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),  
      );
          }

          return Center(child: CupertinoActivityIndicator(),);
      })
      
    );
  }
}

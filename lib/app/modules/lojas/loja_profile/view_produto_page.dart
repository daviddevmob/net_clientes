import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/loja/loja_view_produto_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class ViewProdutoPage extends StatelessWidget {
  final LojaViewProduto produto;

  const ViewProdutoPage({
    Key key,
    this.produto,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: Observer(
          builder: (_) => AppBarWidget(
            title: produto.produto.produtoNome,
            viewLeading: true,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                  if (produto.produto.foto1Link != null &&
                      produto.produto.foto2Link != null) {
                    return Stack(
                      children: [
                        PageView(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                produto.produto.foto1Link,
                              ))),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                produto.produto.foto2Link,
                              ))),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Card(
                                color: Colors.grey[400],
                                child: Container(
                                  margin: EdgeInsets.all(4),
                                  child: TextWidget(
                                    text: 'Duas Foto',
                                    fontSize: 16,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (produto.produto.foto1Link != null &&
                      produto.produto.foto2Link == null) {
                    return Stack(
                      children: [
                        PageView(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                produto.produto.foto1Link,
                              ))),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Card(
                                color: Colors.grey[400],
                                child: Container(
                                  margin: EdgeInsets.all(4),
                                  child: TextWidget(
                                    text: 'Uma Foto',
                                    fontSize: 16,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (produto.produto.foto1Link == null &&
                      produto.produto.foto2Link != null) {
                    return Stack(
                      children: [
                        PageView(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                produto.produto.foto2Link,
                              ))),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          padding: EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Card(
                                color: Colors.grey[400],
                                child: Container(
                                  margin: EdgeInsets.all(4),
                                  child: TextWidget(
                                    text: 'Uma Foto',
                                    fontSize: 16,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
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
                        text: produto.produto.produtoNome,
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
                        text: produto.produto.descricao,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              produto.produto.precoPromo != 0 &&
                      produto.produto.precoPromo < produto.produto.preco
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
                                    'De: R\$ ${produto.produto.preco.toStringAsFixed(2)}',
                                fontSize: 13,
                                textColor: Colors.grey[500],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text:
                                    'Por: R\$ ${produto.produto.precoPromo.toStringAsFixed(2)}',
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
                                'R\$ ${produto.produto.preco.toStringAsFixed(2)}',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 35,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  children: [
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () async {
                        if (await ConnectionVerify.connectionStatus()) {
                          bool add = await produto.controller
                              .addItemCarrinho(produto.produto);
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/widgets/rest_profile_top_foto.dart';
import 'package:net_cliente/app/shared/models/rest/carrinho_rest_page_model.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile_page.dart';
import 'package:net_cliente/app/shared/models/rest/rest_view_produto_page.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/distancia.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'rest_profile_controller.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile.dart';

class RestProfilePage extends StatefulWidget {
  final RestProfilePageModel rest;
  const RestProfilePage({Key key, @required this.rest})
      : super(key: key);

  @override
  _RestProfilePageState createState() => _RestProfilePageState();
}


class _RestProfilePageState
    extends ModularState<RestProfilePage, RestProfileController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getRestaurante(widget.rest.restGeral.restId);
      
      if(widget.rest.restGeral.entregaDomicilio != false ||
      widget.rest.restGeral.usuario.localizacao.mapaLink != ''){

        controller.distanciaEntrega = DistanciaCalculo().getDistacia(
        double.parse(widget.rest.endereco.latlgn.split(',')[0]),
        double.parse(widget.rest.endereco.latlgn.split(',')[1]),
        double.parse(
            controller.rest.usuario.localizacao.mapaLink.split(',')[0]),
        double.parse(
            controller.rest.usuario.localizacao.mapaLink.split(',')[1]),
        );
        controller.taxaEntrega = controller.distanciaEntrega *
          controller.rest.usuario.taxaEntrega.taxaEntrega;
      }

      controller.clienteId = widget.rest.cliente.clienteId;
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
          if (controller.rest != null) {
            var loja = controller.rest;
            bool aberto;
            var dia = DateTime.now().weekday;
            if (dia == 1 && loja.usuario.diasSemana.segunda == true) {
              aberto = true;
            } else if (dia == 2 && loja.usuario.diasSemana.terca == true) {
              aberto = true;
            } else if (dia == 3 && loja.usuario.diasSemana.quarta == true) {
              aberto = true;
            } else if (dia == 4 && loja.usuario.diasSemana.quinta == true) {
              aberto = true;
            } else if (dia == 5 && loja.usuario.diasSemana.sexta == true) {
              aberto = true;
            } else if (dia == 6 && loja.usuario.diasSemana.sabado == true) {
              aberto = true;
            } else if (dia == 7 && loja.usuario.diasSemana.domingo == true) {
              aberto = true;
            }
            return AppBarWidget(
              title: widget.rest.restGeral.restNome,
              viewLeading: true,
              actions: [
                Container(
                  width: 70,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.cart,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            var metUser =
                                controller.rest.usuario.metodoPagamento;
                            List<MetodosPagamentoAceitos> metodos =
                                new List<MetodosPagamentoAceitos>();
                            if (metUser.visa == true) {
                              metodos.add(MetodosPagamentoAceitos(1, 'Visa'));
                            }
                            if (metUser.americanExpress == true) {
                              metodos.add(MetodosPagamentoAceitos(
                                  2, 'American Express'));
                            }
                            if (metUser.mastercard == true) {
                              metodos.add(
                                  MetodosPagamentoAceitos(3, 'MasterCard'));
                            }
                            if (metUser.elo == true) {
                              metodos.add(MetodosPagamentoAceitos(4, 'Elo'));
                            }
                            if (metUser.amex == true) {
                              metodos.add(MetodosPagamentoAceitos(5, 'Amex'));
                            }
                            if (metUser.sodexoAlimentacao == true) {
                              metodos.add(MetodosPagamentoAceitos(
                                  6, 'Sodexo Alimentação'));
                            }
                            if (metUser.sodexoRefeicao == true) {
                              metodos.add(MetodosPagamentoAceitos(
                                  7, 'Sodexo Refeição'));
                            }
                            if (metUser.aleloAlimentacao == true) {
                              metodos.add(MetodosPagamentoAceitos(
                                  8, 'Alelo Alimentação'));
                            }
                            if (metUser.aleloRefeicao == true) {
                              metodos.add(
                                  MetodosPagamentoAceitos(9, 'Alelo Refeição'));
                            }
                            if (metUser.ticketAlimentacao == true) {
                              metodos.add(MetodosPagamentoAceitos(
                                  10, 'Ticket Alimentação'));
                            }
                            if (metUser.ticketRestaurante == true) {
                              metodos.add(MetodosPagamentoAceitos(
                                  11, 'Tikect Restaurante'));
                            }
                            int tipoEntrega;
                            if (controller.rest.entregaDomicilio == true &&
                                controller.rest.retiradaLoja == true) {
                              tipoEntrega = 1;
                            } else if (controller.rest.entregaDomicilio ==
                                    true &&
                                controller.rest.retiradaLoja == false) {
                              tipoEntrega = 2;
                            } else if (controller.rest.entregaDomicilio ==
                                    false &&
                                controller.rest.retiradaLoja == true) {
                              tipoEntrega = 3;
                            } else {
                              tipoEntrega = 4;
                            }

                            CarrinhoRestPageModel carrinho =
                                new CarrinhoRestPageModel(
                              controller,
                              controller.taxaEntrega,
                              controller.distanciaEntrega,
                              metodos,
                              tipoEntrega,
                              widget.rest,
                              aberto,
                            );
                            Modular.to.pushNamed('/rest_profile/carrinho_rest',
                                arguments: carrinho);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return SizedBox();
        }),
      ),
      body: Observer(builder: (_) {
        if (controller.rest != null) {
          RestProfile rest = controller.rest;

          var dia = DateTime.now().weekday;
          bool aberto;
          String funcionamento = '';
          if (dia == 1 && rest.usuario.diasSemana.segunda == true) {
            aberto = true;
            funcionamento = rest.usuario.horarioAtendimento.segunda;
          } else if (dia == 2 && rest.usuario.diasSemana.terca == true) {
            aberto = true;
            funcionamento = rest.usuario.horarioAtendimento.terca;
          } else if (dia == 3 && rest.usuario.diasSemana.quarta == true) {
            aberto = true;
            funcionamento = rest.usuario.horarioAtendimento.quarta;
          } else if (dia == 4 && rest.usuario.diasSemana.quinta == true) {
            aberto = true;
            funcionamento = rest.usuario.horarioAtendimento.quinta;
          } else if (dia == 5 && rest.usuario.diasSemana.sexta == true) {
            aberto = true;
            funcionamento = rest.usuario.horarioAtendimento.sexta;
          } else if (dia == 6 && rest.usuario.diasSemana.sabado == true) {
            aberto = true;
            funcionamento = rest.usuario.horarioAtendimento.sabado;
          } else if (dia == 7 && rest.usuario.diasSemana.domingo == true) {
            aberto = true;
            funcionamento = rest.usuario.horarioAtendimento.domingo;
          }

          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width - 20,
                        child: Stack(
                          children: [
                            Observer(
                              builder: (_) => RestProfileInfosWidget(
                                rest: rest,
                                funcionamento: funcionamento,
                                aberto: aberto,
                                distancia: controller.distanciaEntrega,
                                controller: controller,
                              ),
                            ),
                            Positioned(
                              left: 320,
                              child: Observer(
                                builder: (_) {

                                if (controller.restFavorito.value == null) {
                                  return CupertinoActivityIndicator();
                                }

                                if (controller.restFavorito.value
                                    .clienteFavoritoRest.isEmpty) {
                                  return IconButton(
                                    icon: Icon(
                                      CupertinoIcons.star,
                                      color: Cores.verdeClaro,
                                    ),
                                    onPressed: () async {
                                      if (await ConnectionVerify
                                          .connectionStatus()) {
                                        controller.salvarFavorito(
                                          widget.rest.restGeral.restId,
                                        );
                                        controller.favoritado = true;
                                      } else {
                                        return InternetFlushBar()
                                            .showFlushBarInternet(context);
                                      }
                                    },
                                  );
                                } 
                                else if (controller.restFavorito.value
                                        .clienteFavoritoRest[0].ativo ==
                                    true) {
                                  return IconButton(
                                    icon: Icon(
                                      CupertinoIcons.star_fill,
                                      color: Cores.verdeClaro,
                                    ),
                                    onPressed: () async {
                                      if (await ConnectionVerify
                                          .connectionStatus()) {
                                        controller.deletarFavorito(widget
                                            .rest.restGeral.restId);
                                      } else {
                                        return InternetFlushBar()
                                            .showFlushBarInternet(context);
                                      }
                                    },
                                  );
                                } 
                                else if (controller.restFavorito.value
                                        .clienteFavoritoRest[0].ativo ==
                                    false) {
                                  return IconButton(
                                    icon: Icon(
                                      CupertinoIcons.star,
                                      color: Cores.verdeClaro,
                                    ),
                                    onPressed: () async {
                                      if (await ConnectionVerify
                                          .connectionStatus()) {
                                        controller.deletarFavorito(widget
                                            .rest.restGeral.restId,
                                            );
                                      } else {
                                        return InternetFlushBar()
                                            .showFlushBarInternet(context);
                                      }
                                    },
                                  );
                                }
                                return CupertinoActivityIndicator();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    itemCount: controller.rest.restProdCategoria.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var categ = controller.rest.restProdCategoria[index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text: categ.nomeCategoria,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                textColor: Colors.black,
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: Cores.verdeClaro,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            itemCount: categ.restProdutos.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index){
                             var produto = categ.restProdutos[index];
                              bool promocao;
                              if (produto.precoPromo != 0 &&
                                  produto.precoPromo < produto.preco) {
                                promocao = true;
                              } else {
                                promocao = false;
                              }
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      RestViewProduto prod =
                                          new RestViewProduto(
                                            produto, 
                                            controller, 
                                            categ.restAdicionals,
                                            );
                                      Modular.to.pushNamed(
                                        '/rest_profile/view_produto',
                                        arguments: prod,
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 20, top: 20),
                                      child: Wrap(
                                        spacing: 10,
                                        children: [
                                        Observer(
                                          builder:(_) => Container(
                                            child:  produto.foto == null ||
                                                    produto.foto == ''
                                                ? Container(
                                                    height: 80,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.transparent),
                                                        color: Cores.verdeClaro,
                                                        borderRadius:
                                                            BorderRadius.circular(4)),
                                                  )
                                                : Container(
                                                    height: 80,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(4),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: CachedNetworkImageProvider(
                                                            produto.foto),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                          Wrap(
                                            direction: Axis.vertical,
                                            children: [
                                              TextWidget(
                                                text: produto.nome,
                                                fontSize: 14,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              produto.disponivel == true
                                                  ? Container(
                                                      child: promocao == true
                                                          ? Wrap(
                                                              direction: Axis.vertical,
                                                              children: [
                                                                TextWidget(
                                                                  text:
                                                                      'De: R\$ ${produto.preco.toStringAsFixed(2)}',
                                                                  fontSize: 13,
                                                                  textColor:
                                                                      Colors.grey[500],
                                                                ),
                                                                TextWidget(
                                                                  text:
                                                                      'Por: R\$ ${produto.precoPromo.toStringAsFixed(2)}',
                                                                  fontSize: 18,
                                                                  textColor:
                                                                      Colors.green,
                                                                )
                                                              ],
                                                            )
                                                          : TextWidget(
                                                              text:
                                                                  'R\$ ${produto.preco.toStringAsFixed(2)}',
                                                              fontSize: 18,
                                                            ),
                                                    )
                                                  : TextWidget(
                                                      text: 'Aguardando atualização',
                                                      fontSize: 14,
                                                      textColor: Colors.grey[400],
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            )
                        ],
                      );/* 
                       */
                    }
                  ),
                ],
              ),
            ),
          );
        }

        return Center(child: CupertinoActivityIndicator());
      }),
    );
  }
}

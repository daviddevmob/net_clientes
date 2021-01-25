import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/lojas/loja_profile/widgets/loja_profile_top_foto.dart';
import 'package:net_cliente/app/shared/models/loja/loja_perfil_page_model.dart';
import 'package:net_cliente/app/shared/models/loja/loja_profile.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/distancia.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'loja_profile_controller.dart';
import 'package:net_cliente/app/shared/models/loja/carrinho_loja_page_model.dart';

class LojaProfilePage extends StatefulWidget {
  final LojaProfileModel lojaProfile;
  const LojaProfilePage({Key key, @required this.lojaProfile})
      : super(key: key);

  @override
  _LojaProfilePageState createState() => _LojaProfilePageState();
}

class _LojaProfilePageState
    extends ModularState<LojaProfilePage, LojaProfileController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getLoja(widget.lojaProfile.lojaGeral.lojaId);
      controller.distanciaEntrega = DistanciaCalculo().getDistacia(
        double.parse(widget.lojaProfile.endereco.latlgn.split(',')[0]),
        double.parse(widget.lojaProfile.endereco.latlgn.split(',')[1]),
        double.parse(
            controller.loja.usuario.localizacao.mapaLink.split(',')[0]),
        double.parse(
            controller.loja.usuario.localizacao.mapaLink.split(',')[1]),
      );
      controller.taxaEntrega = controller.distanciaEntrega *
          controller.loja.usuario.taxaEntrega.taxaEntrega;
      controller.clienteId = widget.lojaProfile.cliente.clienteId;
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
            title: widget.lojaProfile.lojaGeral.lojaNome,
            viewLeading: true,
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      var metUser = controller.loja.usuario.metodoPagamento;
                      List<MetodosPagamentoAceitos> metodos =
                          new List<MetodosPagamentoAceitos>();
                      if (metUser.visa == true) {
                        metodos.add(MetodosPagamentoAceitos(1, 'Visa'));
                      }
                      if (metUser.americanExpress == true) {
                        metodos.add(
                            MetodosPagamentoAceitos(2, 'American Express'));
                      }
                      if (metUser.mastercard == true) {
                        metodos.add(MetodosPagamentoAceitos(3, 'MasterCard'));
                      }
                      if (metUser.elo == true) {
                        metodos.add(MetodosPagamentoAceitos(4, 'Elo'));
                      }
                      if (metUser.amex == true) {
                        metodos.add(MetodosPagamentoAceitos(5, 'Amex'));
                      }
                      if (metUser.sodexoAlimentacao == true) {
                        metodos.add(
                            MetodosPagamentoAceitos(6, 'Sodexo Alimentação'));
                      }
                      if (metUser.sodexoRefeicao == true) {
                        metodos
                            .add(MetodosPagamentoAceitos(7, 'Sodexo Refeição'));
                      }
                      if (metUser.aleloAlimentacao == true) {
                        metodos.add(
                            MetodosPagamentoAceitos(8, 'Alelo Alimentação'));
                      }
                      if (metUser.aleloRefeicao == true) {
                        metodos
                            .add(MetodosPagamentoAceitos(9, 'Alelo Refeição'));
                      }
                      if (metUser.ticketAlimentacao == true) {
                        metodos.add(
                            MetodosPagamentoAceitos(10, 'Ticket Alimentação'));
                      }
                      if (metUser.ticketRestaurante == true) {
                        metodos.add(
                            MetodosPagamentoAceitos(11, 'Tikect Restaurante'));
                      }
                      int tipoEntrega;
                      if (controller.loja.entregaDomicilio == true &&
                          controller.loja.lojaFisica == true) {
                        tipoEntrega = 1;
                      } else if (controller.loja.entregaDomicilio == true &&
                          controller.loja.lojaFisica == false) {
                        tipoEntrega = 2;
                      } else if (controller.loja.entregaDomicilio == false &&
                          controller.loja.lojaFisica == true) {
                        tipoEntrega = 3;
                      } else {
                        tipoEntrega = 4;
                      }
                      CarrinhoLojaPageModel carrinho =
                          new CarrinhoLojaPageModel(
                        controller,
                        controller.taxaEntrega,
                        controller.distanciaEntrega,
                        metodos,
                        tipoEntrega,
                        widget.lojaProfile,
                      );
                      Modular.to.pushNamed('/loja_profile/carrinho_loja',
                          arguments: carrinho);
                    },
                  ),
                  controller.produtosCarrinho.isEmpty
                      ? SizedBox()
                      : Positioned(
                          left: 20,
                          top: 12,
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.black,
                            child: TextWidget(
                              text: controller.produtosCarrinho.isEmpty
                                  ? ''
                                  : '${controller.produtosCarrinho.length}',
                              fontSize: 11,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.loja == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

        LojaPerfilPageModel loja = controller.loja;

        var dia = DateTime.now().weekday;
        bool aberto;
        String funcionamento = '';
        if (dia == 1 && loja.usuario.diasSemana.segunda == true) {
          aberto = true;
          funcionamento = loja.usuario.horarioAtendimento.segunda;
        } else if (dia == 2 && loja.usuario.diasSemana.terca == true) {
          aberto = true;
          funcionamento = loja.usuario.horarioAtendimento.terca;
        } else if (dia == 3 && loja.usuario.diasSemana.quarta == true) {
          aberto = true;
          funcionamento = loja.usuario.horarioAtendimento.quarta;
        } else if (dia == 4 && loja.usuario.diasSemana.quinta == true) {
          aberto = true;
          funcionamento = loja.usuario.horarioAtendimento.quinta;
        } else if (dia == 5 && loja.usuario.diasSemana.sexta == true) {
          aberto = true;
          funcionamento = loja.usuario.horarioAtendimento.sexta;
        } else if (dia == 6 && loja.usuario.diasSemana.sabado == true) {
          aberto = true;
          funcionamento = loja.usuario.horarioAtendimento.sabado;
        } else if (dia == 7 && loja.usuario.diasSemana.domingo == true) {
          aberto = true;
          funcionamento = loja.usuario.horarioAtendimento.domingo;
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
                    LojaProfileInfosWidget(
                      loja: loja,
                      funcionamento: funcionamento,
                      aberto: aberto,
                      distancia: controller.distanciaEntrega,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Observer(
                      builder: (_) => DropdownButtonHideUnderline(
                          child: Container(
                          height: 45,
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                          color: Cores.verdeClaro,
                            border: Border.all(
                              color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: DropdownButton<int>(
                            value: controller.categoria,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Cores.verdeClaro,
                            hint: TextWidget(
                              text: 'Todas Categorias',
                              fontSize: 12,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            items: loja.lojaProdCategoria.map((e) {
                              return DropdownMenuItem(
                                value: e.lojaProdCategoriaId,
                                child: TextWidget(
                                  text: e.nomeCategoria,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.white,
                                ),
                              );
                            }).toList(),
                            onChanged: controller.setCategoria,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ListView.builder(
                  itemCount: controller.produtoList.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    var produto = controller.produtoList[index];
                    bool promocao;
                    if (produto.precoPromo != 0 &&
                        produto.precoPromo < produto.preco) {
                      promocao = true;
                    } else {
                      promocao = false;
                    }
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20, top: 20),
                          child: Wrap(
                            spacing: 10,
                            children: [
                              produto.foto1Link == null ||
                                      produto.foto1Link == ''
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
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                              produto.foto1Link),
                                        ),
                                      ),
                                    ),
                              Wrap(
                                direction: Axis.vertical,
                                children: [
                                  TextWidget(
                                    text: produto.produtoNome,
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
                                                      textColor: Colors.green,
                                                    )
                                                  ],
                                                )
                                              : TextWidget(
                                                  text:
                                                      'Por: R\$ ${produto.preco.toStringAsFixed(2)}',
                                                  fontSize: 18,
                                                ),
                                        )
                                      : TextWidget(
                                          text: 'Aguardando atualização',
                                          fontSize: 14,
                                          textColor: Colors.grey[400],
                                        )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Observer(
                          builder: (_) => Container(
                            child: produto.disponivel == true
                                ? Positioned(
                                    left: 320,
                                    top: 22,
                                    child: IconButton(
                                      icon: Icon(
                                        CupertinoIcons.cart_badge_plus,
                                      ),
                                      onPressed: () async {
                                        if (await ConnectionVerify
                                            .connectionStatus()) {
                                          bool add = await controller
                                              .addItemCarrinho(produto);
                                          if (add == true) {
                                            print('OK');
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
                                              .showFlushBarInternet(context);
                                        }
                                      },
                                    ),
                                  )
                                : SizedBox(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

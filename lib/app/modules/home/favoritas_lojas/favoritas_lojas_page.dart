import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/loja/loja_profile.dart';
import 'package:net_cliente/app/shared/models/loja/lojas_search.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/distancia.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'favoritas_lojas_controller.dart';
import 'package:net_cliente/app/shared/models/loja/list_lojas.dart';

class FavoritasLojasPage extends StatefulWidget {
  final LojasSearch lojasSearch;
  const FavoritasLojasPage({Key key, @required this.lojasSearch})
      : super(key: key);

  @override
  _FavoritasLojasPageState createState() => _FavoritasLojasPageState();
}

class _FavoritasLojasPageState
    extends ModularState<FavoritasLojasPage, FavoritasLojasController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getLojas(widget.lojasSearch.cliente.clienteId);
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
          title: 'Lojas Favoritas',
          viewLeading: true,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.list.clienteFavoritoLoja == null) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (controller.list == null) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (controller.list.clienteFavoritoLoja.isEmpty) {
            return Center(
              child: TextWidget(
                text: 'Você ainda não favoritou nenhuma loja',
                fontSize: 16,
                textColor: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            );
          }

          if (controller.list.clienteFavoritoLoja.isNotEmpty) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    ListView.separated(
                      itemCount: controller.list.clienteFavoritoLoja.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: size.height * 0.01,
                        );
                      },
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var loja = controller.list.clienteFavoritoLoja[index];
                        double distancia = DistanciaCalculo().getDistacia(
                          double.parse(
                              widget.lojasSearch.endereco.latlgn.split(',')[0]),
                          double.parse(
                              widget.lojasSearch.endereco.latlgn.split(',')[1]),
                          double.parse(loja
                              .lojaGeral.usuario.localizacao.mapaLink
                              .split(',')[0]),
                          double.parse(loja
                              .lojaGeral.usuario.localizacao.mapaLink
                              .split(',')[1]),
                        );

                        String categoriaLoja = SwitchsUtils()
                            .getCategoriaLoja(loja.lojaGeral.categoria);

                        return ListTile(
                          onTap: () async {
                            if (await ConnectionVerify.connectionStatus()) {
                              Localizacao loc = new Localizacao(
                                mapaLink:
                                    loja.lojaGeral.usuario.localizacao.mapaLink,
                                bairro:
                                    loja.lojaGeral.usuario.localizacao.bairro,
                              );
                              TaxaEntrega tax = new TaxaEntrega(
                                taxaEntrega: loja
                                    .lojaGeral.usuario.taxaEntrega.taxaEntrega,
                              );
                              Usuario user = new Usuario(
                                localizacao: loc,
                                taxaEntrega: tax,
                              );
                              LojaGeral lojaG = new LojaGeral(
                                categoria: loja.lojaGeral.categoria,
                                lojaNome: loja.lojaGeral.lojaNome,
                                entregaDomicilio:
                                    loja.lojaGeral.entregaDomicilio,
                                fotoPerfilLink: loja.lojaGeral.fotoPerfilLink,
                                lojaFisica: loja.lojaGeral.lojaFisica,
                                usuario: user,
                                lojaId: loja.lojaGeral.lojaId,
                              );
                              LojaProfileModel lojaProfile =
                                  new LojaProfileModel(
                                widget.lojasSearch.cliente,
                                widget.lojasSearch.endereco,
                                lojaG,
                              );
                              Modular.to.pushNamed(
                                '/loja_profile/',
                                arguments: lojaProfile,
                              );
                            } else {
                              return InternetFlushBar()
                                  .showFlushBarInternet(context);
                            }
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: loja.lojaGeral.fotoPerfilLink == null ||
                                  loja.lojaGeral.fotoPerfilLink == ''
                              ? Container(
                                height: size.height * 0.1,
                                width: size.width * 0.2,
                                decoration: BoxDecoration(
                                color: Cores.verdeClaro,
                                border: Border.all(color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(4),
                                ))
                              : Container(
                                  height: size.height * 0.1,
                                  width: size.width * 0.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[400]),
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          loja.lojaGeral.fotoPerfilLink),
                                    ),
                                  ),
                                ),
                          title: Wrap(
                            direction: Axis.vertical,
                            children: [
                              TextWidget(
                                text: loja.lojaGeral.lojaNome,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    text: '$categoriaLoja',
                                    fontSize: 13,
                                  ),
                                  TextWidget(
                                    text: ' ● ',
                                    fontSize: 10,
                                    textColor: Colors.grey,
                                  ),
                                  TextWidget(
                                    text:
                                        '${distancia.toStringAsPrecision(1)} km',
                                    fontSize: 13,
                                  )
                                ],
                              ),
                            ],
                          ),
                          subtitle: loja.lojaGeral.entregaDomicilio == false
                              ? TextWidget(
                                  text: 'Não entrega em domicílio',
                                  textColor: Colors.grey[400],
                                  fontSize: 13,
                                )
                              : Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    TextWidget(
                                      text: 'Entrega',
                                      textColor: Colors.green,
                                      fontSize: 13,
                                    ),
                                    TextWidget(
                                      text: ' ● ',
                                      fontSize: 10,
                                      textColor: Colors.green,
                                    ),
                                    TextWidget(
                                      text:
                                          'R\$ ${(distancia * loja.lojaGeral.usuario.taxaEntrega.taxaEntrega).toStringAsFixed(2)}',
                                      fontSize: 13,
                                      textColor: Colors.green,
                                    )
                                  ],
                                ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  CupertinoActivityIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

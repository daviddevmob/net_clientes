import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/loja/lojas_search.dart';
import 'package:net_cliente/app/shared/models/rest/list_rest.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/distancia.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'favoritos_rest_controller.dart';

class FavoritosRestPage extends StatefulWidget {
  final LojasSearch lojasSearch;
  const FavoritosRestPage({Key key, @required this.lojasSearch})
      : super(key: key);

  @override
  _FavoritosRestPageState createState() => _FavoritosRestPageState();
}

class _FavoritosRestPageState
    extends ModularState<FavoritosRestPage, FavoritosRestController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getRestFavoritos(widget.lojasSearch.cliente.clienteId);
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
          title: 'Restaurantes Favoritos',
          viewLeading: true,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.list.data == null) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }


          // ignore: unrelated_type_equality_checks
          if (controller.list.isEmpty == true) {
            return Center(
              child: TextWidget(
                text: 'Você ainda não favoritou nenhuma loja',
                fontSize: 16,
                textColor: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            );
          }

         
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
                    Container(
                      child: controller.list.value.clienteFavoritoRest.isEmpty == true 
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'Sem favoritos',
                            fontSize: 16,
                            textColor: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )
                      : ListView.separated(
                        itemCount: controller.list.value.clienteFavoritoRest.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: size.height * 0.01,
                          );
                        },
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          var rest = controller.list.value.clienteFavoritoRest[index];
                          double distancia = DistanciaCalculo().getDistacia(
                            double.parse(
                                widget.lojasSearch.endereco.latlgn.split(',')[0]),
                            double.parse(
                                widget.lojasSearch.endereco.latlgn.split(',')[1]),
                            double.parse(rest
                                .restGeral.usuario.localizacao.mapaLink
                                .split(',')[0]),
                            double.parse(rest
                                .restGeral.usuario.localizacao.mapaLink
                                .split(',')[1]),
                          );

                          String categoriaLoja = SwitchsUtils()
                              .getCategoriaRest(rest.restGeral.categoria);

                          return ListTile(
                            onTap: () async {
                              if (await ConnectionVerify.connectionStatus()) {
                                Localizacao loc = new Localizacao(
                                  mapaLink:
                                      rest.restGeral.usuario.localizacao.mapaLink,
                                  bairro:
                                      rest.restGeral.usuario.localizacao.bairro,
                                );
                                TaxaEntrega tax = new TaxaEntrega(
                                  taxaEntrega: rest
                                      .restGeral.usuario.taxaEntrega.taxaEntrega,
                                );
                                Usuario user = new Usuario(
                                  localizacao: loc,
                                  taxaEntrega: tax,
                                );
                                RestGeral restGeral = new RestGeral(
                                  categoria: rest.restGeral.categoria,
                                  restNome: rest.restGeral.restNome,
                                  entregaDomicilio:
                                      rest.restGeral.entregaDomicilio,
                                  fotoLink: rest.restGeral.fotoLink,
                                  retiradaLoja: rest.restGeral.retiradaLoja,
                                  usuario: user,
                                  restId: rest.restGeral.restId,
                                );
                                RestProfilePageModel lojaProfile =
                                    new RestProfilePageModel(
                                  widget.lojasSearch.cliente,
                                  widget.lojasSearch.endereco,
                                  restGeral,
                                );
                                Modular.to.pushNamed(
                                  '/rest_profile/',
                                  arguments: lojaProfile,
                                );
                              } else {
                                return InternetFlushBar()
                                    .showFlushBarInternet(context);
                              }
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: rest.restGeral.fotoLink == null ||
                                    rest.restGeral.fotoLink == ''
                                ? Container(
                                    height: size.height * 0.1,
                                    width: size.width * 0.2,
                                    color: Cores.verdeClaro,
                                  )
                                : Container(
                                    height: size.height * 0.1,
                                    width: size.width * 0.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey[400]),
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                            rest.restGeral.fotoLink),
                                      ),
                                    ),
                                  ),
                            title: Wrap(
                              direction: Axis.vertical,
                              children: [
                                TextWidget(
                                  text: rest.restGeral.restNome,
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
                            subtitle: rest.restGeral.entregaDomicilio == false
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
                                            'R\$ ${(distancia * rest.restGeral.usuario.taxaEntrega.taxaEntrega).toStringAsFixed(2)}',
                                        fontSize: 13,
                                        textColor: Colors.green,
                                      )
                                    ],
                                  ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/lojas/widgets_lojas/buscar_lojas.dart';
import 'package:net_cliente/app/modules/lojas/widgets_lojas/buscar_lojas2.dart';
import 'package:net_cliente/app/shared/models/loja/list_lojas.dart';
import 'package:net_cliente/app/shared/models/loja/loja_profile.dart';
import 'package:net_cliente/app/shared/models/loja/lojas_search.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/distancia.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'lojas_controller.dart';

class LojasPage extends StatefulWidget {
  final LojasSearch lojasSearch;
  const LojasPage({Key key, @required this.lojasSearch}) : super(key: key);

  @override
  _LojasPageState createState() => _LojasPageState();
}

class _LojasPageState extends ModularState<LojasPage, LojasController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getListLojas();
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
          title: 'Lojas',
          viewLeading: true,
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.listLojas == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (controller.listLojas.lojaGeral.isEmpty == true) {
          return BuscarLojasPageWidget(
            controller: controller,
          );
        }

        if (controller.listLojas == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (controller.listLojas.lojaGeral.isNotEmpty) {
          ListLojasModel lojas = controller.listLojas;

          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  BuscarLojasPageResultWidget(
                    controller: controller,
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: 'Lojas',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ListView.separated(
                    itemCount: lojas.lojaGeral.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: size.height * 0.01,
                      );
                    },
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var loja = lojas.lojaGeral[index];
                      double distancia = 0;
                      if (loja.usuario.localizacao.mapaLink != '') {
                        distancia = DistanciaCalculo().getDistacia(
                          double.parse(
                              widget.lojasSearch.endereco.latlgn.split(',')[0]),
                          double.parse(
                              widget.lojasSearch.endereco.latlgn.split(',')[1]),
                          double.parse(
                              loja.usuario.localizacao.mapaLink.split(',')[0]),
                          double.parse(
                              loja.usuario.localizacao.mapaLink.split(',')[1]),
                        );
                      }

                      String categoriaLoja =
                          SwitchsUtils().getCategoriaLoja(loja.categoria);

                      var n =loja.lojaAvaliacaos.map((e) => e.nota);
                      double nota = loja.lojaAvaliacaos.isEmpty 
                      ? 5.0
                      : (n.fold(0, (previousValue, element) => previousValue + element))/loja.lojaAvaliacaos.length;

                      return ListTile(
                        onTap: () async {
                          if (await ConnectionVerify.connectionStatus()) {
                            LojaProfileModel lojaProfile = new LojaProfileModel(
                              widget.lojasSearch.cliente,
                              widget.lojasSearch.endereco,
                              loja,
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
                        leading: loja.fotoPerfilLink == null ||
                                loja.fotoPerfilLink == ''
                            ? Container(
                                height: size.height * 0.1,
                                width: size.width * 0.2,
                                decoration: BoxDecoration(
                                color: Cores.verdeClaro,
                                border: Border.all(color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(4),
                                ),
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
                                        loja.fotoPerfilLink),
                                  ),
                                ),
                              ),
                        title: Wrap(
                          direction: Axis.vertical,
                          children: [
                            TextWidget(
                              text: loja.lojaNome,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            Row(
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      size: 13.5,
                                      color: Colors.orange,
                                      ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    TextWidget(
                                      text: "${nota.toStringAsFixed(1)}".replaceAll('.', ','),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      textColor: Colors.orange,
                                    ),
                                  ],
                                ),
                                TextWidget(
                                  text: ' ● ',
                                  fontSize: 10,
                                  textColor: Colors.grey,
                                ),
                                TextWidget(
                                  text: '$categoriaLoja',
                                  fontSize: 13,
                                ),
                                TextWidget(
                                  text: ' ● ',
                                  fontSize: 10,
                                  textColor: Colors.grey,
                                ),
                                Observer(
                                  builder: (_) => Container(
                                    child: 
                                    loja.usuario.localizacao.mapaLink == ''
                                    ? SizedBox()
                                    : TextWidget(
                                      text: '${distancia.toStringAsPrecision(2)} km',
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: loja.entregaDomicilio == false
                            ? TextWidget(
                                text: 'Não entrega em domicílio',
                                textColor: Colors.grey[400],
                                fontSize: 13,
                              )
                            : loja.usuario.localizacao.mapaLink == ''
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
                                    text: 'R\$ ${(distancia * loja.usuario.taxaEntrega.taxaEntrega).toStringAsFixed(2)}',
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
            child: CupertinoActivityIndicator(),
          );
        }
      }),
    );
  }
}

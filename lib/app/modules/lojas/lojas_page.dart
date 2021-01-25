import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/lojas/widgets_lojas/categorias_lojas_widget.dart';
import 'package:net_cliente/app/shared/models/loja/list_lojas.dart';
import 'package:net_cliente/app/shared/models/loja/loja_profile.dart';
import 'package:net_cliente/app/shared/models/loja/lojas_search.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/distancia.dart';
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
        if (controller.listLojas.lojaGeral.isEmpty == true) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'Nenhuma Loja Encontrada',
                  fontSize: 16,
                  textColor: Colors.grey,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Observer(
                  builder: (_) => FlatButton(
                    color: Cores.azul,
                    onPressed: () {
                      controller.domicilio = null;
                      controller.lojaFisica = null;
                      controller.getListLojas();
                    },
                    child: TextWidget(
                      text: 'Pesquisa Padrão',
                      textColor: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        }

        if (controller.listLojas.lojaGeral == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: controller.domicilio == true
                                  ? Colors.transparent
                                  : Colors.grey)),
                      color: controller.domicilio == true
                          ? Cores.verdeClaro
                          : Colors.white,
                      onPressed: () async {
                        if (controller.domicilio == true) {
                          controller.domicilio = null;
                          await controller.getListLojas();
                        } else {
                          controller.domicilio = true;
                          await controller.getListLojas();
                        }
                      },
                      child: TextWidget(
                        text: 'Entrega em Domicílio',
                        fontSize: 14,
                        textColor: controller.domicilio == true
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Observer(
                      builder: (_) => FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: controller.lojaFisica == true
                                  ? Colors.transparent
                                  : Colors.grey,
                            )),
                        color: controller.lojaFisica == true
                            ? Cores.verdeClaro
                            : Colors.white,
                        onPressed: () async {
                          if (controller.lojaFisica == true) {
                            controller.lojaFisica = null;
                            await controller.getListLojas();
                          } else {
                            controller.lojaFisica = true;
                            await controller.getListLojas();
                          }
                        },
                        child: TextWidget(
                          text: 'Retirar na Loja',
                          fontSize: 14,
                          textColor: controller.lojaFisica == true
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                CategoriasLojasWidget(
                  lojasSearch: widget.lojasSearch,
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Row(
                  children: [
                    TextWidget(
                      text: 'Lojas',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
                    /* String categoriaLoja =
                        SwitchsUtils().getCategoriaLoja(loja.categoria); */
                    double distancia = DistanciaCalculo().getDistacia(
                      double.parse(
                          widget.lojasSearch.endereco.latlgn.split(',')[0]),
                      double.parse(
                          widget.lojasSearch.endereco.latlgn.split(',')[1]),
                      double.parse(
                          loja.usuario.localizacao.mapaLink.split(',')[0]),
                      double.parse(
                          loja.usuario.localizacao.mapaLink.split(',')[1]),
                    );
                    String categoriaLoja =
                        SwitchsUtils().getCategoriaLoja(loja.categoria);
                    return ListTile(
                      onTap: () {
                        LojaProfileModel lojaProfile = new LojaProfileModel(
                          widget.lojasSearch.cliente,
                          widget.lojasSearch.endereco,
                          loja,
                        );
                        Modular.to.pushNamed(
                          '/loja_profile/',
                          arguments: lojaProfile,
                          );
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: loja.fotoPerfilLink == null ||
                              loja.fotoPerfilLink == ''
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
                                text: '${distancia.toStringAsPrecision(1)} km',
                                fontSize: 13,
                              )
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
                                      'R\$ ${(distancia * loja.usuario.taxaEntrega.taxaEntrega).toStringAsFixed(2)}',
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
      }),
    );
  }
}

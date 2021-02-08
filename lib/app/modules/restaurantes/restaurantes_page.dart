import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/rest/list_rest.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile.dart';
import 'package:net_cliente/app/shared/models/rest/rest_search_list_page_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/distancia.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/lists/list_bairros.dart';
import 'package:net_cliente/app/shared/utils/lists/list_restaurantes.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
import 'restaurantes_controller.dart';

class RestaurantesPage extends StatefulWidget {
  final RestSearch restSearch;
  const RestaurantesPage({Key key,@required this.restSearch})
      : super(key: key);

  @override
  _RestaurantesPageState createState() => _RestaurantesPageState();
}

class _RestaurantesPageState
    extends ModularState<RestaurantesPage, RestaurantesController> {
  //use 'controller' variable to access controller

   ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getListRests();
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
          title: 'Restaurantes',
          viewLeading: true,
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.rests == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (controller.rests.restGeral.isEmpty == true) {
          return Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Cores.verdeClaro,
                        ),
                        child: Observer(
                          builder:(_) => DropdownButton(
                            value: controller.categoria,
                            hint: TextWidget(
                              text: 'Todas Categorias',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                            items: listRests,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Cores.verdeClaro,
                            onChanged: controller.setCategoriaRests,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Cores.verdeClaro,
                        ),
                        child: Observer(
                          builder:(_) => Observer(
                            builder:(_) => DropdownButton(
                              value: controller.bairro,
                              hint: TextWidget(
                                text: 'Todos os Bairros',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                textColor: Colors.white,
                              ),
                              items: listBairros,
                              iconEnabledColor: Colors.white,
                              dropdownColor: Cores.verdeClaro,
                              onChanged: controller.getBairro,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Observer(
                      builder:(_) => FlatButton(
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
                            await controller.getListRests();
                          } else {
                            controller.domicilio = true;
                            await controller.getListRests();
                          }
                        },
                        child: TextWidget(
                          text: 'Domicílio',
                          fontSize: 14,
                          textColor: controller.domicilio == true
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
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
                            await controller.getListRests();
                          } else {
                            controller.lojaFisica = true;
                            await controller.getListRests();
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
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: 300,
                      child: TextFieldWidget(
                        textEditingController: controller.textSearch,
                        hintText: 'Pizza, Hambúrgueres, Pastel...',
                        onSubmit: (string) {
                          controller.getListRests();
                          print('att');
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.search),
                      onPressed: () {
                        controller.getListRests();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                TextWidget(
                  text: 'Nenhum restaurante encontrado',
                  textColor: Colors.grey[400],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          );
        }

        if (controller.rests == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (controller.rests.restGeral.isNotEmpty) {
          RestListModel rests = controller.rests;

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
                    children: [
                      DropdownButtonHideUnderline(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Cores.verdeClaro,
                          ),
                          child: DropdownButton(
                            value: controller.categoria,
                            hint: TextWidget(
                              text: 'Todas Categorias',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                            items: listRests,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Cores.verdeClaro,
                            onChanged: controller.setCategoriaRests,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Cores.verdeClaro,
                          ),
                          child: DropdownButton(
                            value: controller.bairro,
                            hint: TextWidget(
                              text: 'Todos os Bairros',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                            ),
                            items: listBairros,
                            iconEnabledColor: Colors.white,
                            dropdownColor: Cores.verdeClaro,
                            onChanged: controller.getBairro,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            await controller.getListRests();
                          } else {
                            controller.domicilio = true;
                            await controller.getListRests();
                          }
                        },
                        child: TextWidget(
                          text: 'Domicílio',
                          fontSize: 14,
                          textColor: controller.domicilio == true
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                              await controller.getListRests();
                            } else {
                              controller.lojaFisica = true;
                              await controller.getListRests();
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
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 300,
                        child: TextFieldWidget(
                          textEditingController: controller.textSearch,
                          hintText: 'Pizza, Hambúrgueres, Pastel...',
                          onSubmit: (string) {
                            controller.getListRests();
                            print('att');
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(CupertinoIcons.search),
                        onPressed: () {
                          controller.getListRests();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: 'Restaurantes',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ListView.separated(
                    itemCount: rests.restGeral.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: size.height * 0.01,
                      );
                    },
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var rest = rests.restGeral[index];
                      double distancia = 0;
                      if (rest.usuario.localizacao.mapaLink != '') {
                        distancia = DistanciaCalculo().getDistacia(
                          double.parse(
                              widget.restSearch.endereco.latlgn.split(',')[0]),
                          double.parse(
                              widget.restSearch.endereco.latlgn.split(',')[1]),
                          double.parse(
                              rest.usuario.localizacao.mapaLink.split(',')[0]),
                          double.parse(
                              rest.usuario.localizacao.mapaLink.split(',')[1]),
                        );
                      }

                      String categoriaLoja =
                          SwitchsUtils().getCategoriaRest(rest.categoria);

                      return ListTile(
                        onTap: () async {
                          if (await ConnectionVerify.connectionStatus()) {
                            RestProfilePageModel restProfile = new RestProfilePageModel(
                              widget.restSearch.cliente,
                              widget.restSearch.endereco,
                              rest,
                            );
                            Modular.to.pushNamed(
                              '/rest_profile/',
                              arguments: restProfile,
                            ); 
                          } else {
                            return InternetFlushBar()
                                .showFlushBarInternet(context);
                          }
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: rest.fotoLink == null ||
                                rest.fotoLink == ''
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
                                        rest.fotoLink,
                                        ),
                                  ),
                                ),
                              ),
                        title: Wrap(
                          direction: Axis.vertical,
                          children: [
                            TextWidget(
                              text: rest.restNome,
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
                                Observer(
                                  builder: (_) => Container(
                                    child: 
                                    rest.usuario.localizacao.mapaLink == ''
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
                        subtitle: rest.entregaDomicilio == false
                            ? TextWidget(
                                text: 'Não entrega em domicílio',
                                textColor: Colors.grey[400],
                                fontSize: 13,
                              )
                            : rest.usuario.localizacao.mapaLink == ''
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
                                    text: 'R\$ ${(distancia * rest.usuario.taxaEntrega.taxaEntrega).toStringAsFixed(2)}',
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

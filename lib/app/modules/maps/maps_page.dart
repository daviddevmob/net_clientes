import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/maps/widgets/dialogs_maps.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/lists/list_bairros.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
import 'maps_controller.dart';

class MapsPage extends StatefulWidget {
  final EnderecoClienteModel localizacao;
  const MapsPage({Key key, @required this.localizacao}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends ModularState<MapsPage, MapsController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      if (widget.localizacao.latlgn == null ||
          widget.localizacao.latlgn == '') {
        print('vazio');
      } else {
        var values = widget.localizacao.latlgn.split(',');
        controller.center =
            LatLng(double.parse(values[0]), double.parse(values[1]));

        Future.delayed(Duration(seconds: 3), () {
          controller.setMapPosition(
            widget.localizacao.endereco,
            'Localização Atual do Negócio',
          );
        });
      }
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
              viewLeading: true,
              title: 'Endereço',
            ),
          ),
        ),
        body: Stack(
          children: [
            Observer(
              builder: (_) => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.center,
                  zoom: 14,
                ),
                onMapCreated: controller.criarMapa,
                markers: controller.markers,
                zoomControlsEnabled: false,
                mapType: controller.mapType,
              ),
            ),
            widget.localizacao.endereco == '' ||
                    widget.localizacao.endereco == null ||
                    widget.localizacao.endereco.isEmpty
                ? SizedBox()
                : Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Observer(
                              builder: (_) => Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    deleteLocalizacaoDialog(
                                      context,
                                      controller,
                                      widget.localizacao.enderecoId,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(
                left: 330,
                bottom: 90,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Observer(
                    builder: (_) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: IconButton(
                        icon: Icon(
                          CupertinoIcons.map,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (controller.mapType == MapType.normal) {
                            controller.mapType = MapType.satellite;
                          } else {
                            controller.mapType = MapType.normal;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Observer(
                          builder: (_) => SingleChildScrollView(
                                child: Container(
                                  width: size.width * 0.9,
                                  child: Card(
                                    elevation: 6,
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: controller.verBotaoSalvar == true
                                            ? Column(
                                                children: [
                                                  TextWidget(
                                                    text: controller.verBotaoSalvar ==
                                                            false
                                                        ? widget.localizacao
                                                            .endereco
                                                        : controller
                                                            .localizacaoModel
                                                            .candidates[0]
                                                            .formattedAddress,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  DropdownButtonHideUnderline(
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                        top: 0,
                                                        bottom: 0,
                                                        left: 10,
                                                        right: 10,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.white,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: Cores.verde,
                                                      ),
                                                      child:
                                                          DropdownButton<int>(
                                                        value:
                                                            controller.bairro,
                                                        dropdownColor:
                                                            Cores.verde,
                                                        iconEnabledColor:
                                                            Colors.white,
                                                        hint: TextWidget(
                                                          text:
                                                              'Selecione um bairro',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          textColor:
                                                              Colors.white,
                                                        ),
                                                        items: listBairros,
                                                        onChanged: controller
                                                            .setBairro,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: FlatButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .transparent)),
                                                          color: Colors.grey,
                                                          onPressed: () {
                                                            controller
                                                                    .verBotaoSalvar =
                                                                false;
                                                          },
                                                          child: TextWidget(
                                                            text: 'Cancelar',
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                        child: FlatButton(
                                                          disabledColor: Colors.grey,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .transparent)),
                                                          color: Colors.blue,
                                                          onPressed: controller
                                                                      .bairro ==
                                                                  null
                                                              ? null
                                                              : () async {
                                                                  await controller
                                                                      .salvarLocalizacao(widget
                                                                          .localizacao
                                                                          .clienteId);
                                                                  Modular.to
                                                                      .pop();
                                                                },
                                                          child: TextWidget(
                                                            text: 'Salvar',
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  TextFieldWidget(
                                                      textEditingController:
                                                          controller
                                                              .enderecoController,
                                                      hintText:
                                                          'Insira seu endereço com número',
                                                      labelText:
                                                          'Endereço com número',
                                                      onSubmit: (value) {
                                                        controller
                                                            .pesquisarLocalizacao();
                                                      }),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  FlatButton(
                                                    shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .transparent)),
                                                    color: Colors.blue,
                                                    onPressed: () {
                                                      controller
                                                          .pesquisarLocalizacao();
                                                    },
                                                    child: TextWidget(
                                                      text: 'Pesquisar',
                                                      textColor: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              )),
                                  ),
                                ),
                              )),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: 330,
                bottom: 150,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Observer(
                      builder: (_) => IconButton(
                          tooltip: 'Localização Atual do Negócio',
                          icon: Icon(
                            CupertinoIcons.location,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (widget.localizacao.endereco.isNotEmpty) {
                              controller.setMapPosition(
                                widget.localizacao.endereco,
                                'Localização Atual do Negócio',
                              );
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

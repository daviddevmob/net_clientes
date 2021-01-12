import 'package:eusebio_project/app/modules/maps/widgets/app_bar_search.dart';
import 'package:eusebio_project/app/shared/models/localizacao_model.dart';
import 'package:eusebio_project/app/shared/utils/loading_dialog.dart';
import 'package:eusebio_project/app/shared/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'maps_controller.dart';

class MapsPage extends StatefulWidget {
  final LocalizacaoModel localizacao;
  const MapsPage({Key key, @required this.localizacao}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends ModularState<MapsPage, MapsController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      if (widget.localizacao.mapaLink == null ||
          widget.localizacao.mapaLink == '') {
        print('vazio');
      } else {
        var values = widget.localizacao.mapaLink.split(',');
        controller.center =
            LatLng(double.parse(values[0]), double.parse(values[1]));

        Future.delayed(Duration(seconds: 1), () {
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
          preferredSize: (Size(size.width, 50)),
          child: SearchAppBar(
            controller: controller,
          ),
        ),
        body: Stack(
          children: [
            Observer(
              builder: (_) => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.center,
                  zoom: 18,
                ),
                onMapCreated: controller.criarMapa,
                markers: controller.markers,
                myLocationEnabled: true,
                mapType: controller.mapType,
              ),
            ),
            Positioned(
              top: 550,
              left: 20,
              child: Observer(
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
                      await controller.deleteLocalizacaoMaps(
                        widget.localizacao.localizacaoId,
                      );
                     showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return LoaderWidget(
                              mensagem: 'Deletando Localização',
                              segundos: 2,
                            );
                          });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: 450,
              left: 20,
              child: Observer(
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
            ),
            Observer(
              builder: (_) => Visibility(
                visible: controller.verBotaoSalvar,
                child: Positioned(
                  top: 400,
                  left: 110,
                  child: FlatButton(
                    minWidth: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.transparent)),
                    color: Colors.blue,
                    onPressed: () async {
                      await controller
                          .salvarLocalizacao(widget.localizacao.localizacaoId);
                      Modular.to.pop();
                    },
                    child: TextWidget(
                      text: 'Salvar Localização do Negócio',
                      textColor: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 450,
              left: 330,
              child: Container(
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
            )
          ],
        ));
  }
}

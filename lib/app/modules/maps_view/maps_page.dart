import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/localizacao_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/loading_dialog.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
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
          child: AppBarWidget(
            title: 'Localização',
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

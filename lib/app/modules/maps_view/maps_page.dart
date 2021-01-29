import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' as map;
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/localizacao_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
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

        Future.delayed(Duration(seconds: 2), () {
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
                  zoom: 15,
                ),
                onMapCreated: controller.criarMapa,
                markers: controller.markers,
                mapType: controller.mapType,
                zoomControlsEnabled: false,
              ),
            ),
            Positioned(
              top: 445,
              left: 5,
              child: Container(
                height: 130,
                width: 300,
                child: Card(
                  color: Cores.verdeClaro,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: widget.localizacao.endereco,
                          textColor: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 520,
              left: 330,
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
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Observer(
                        builder: (_) => FlatButton(
                          color: Colors.blue,
                          onPressed: () async {
                            await openMapsSheet(context, widget.localizacao);
                          },
                          child: TextWidget(
                            text: 'Abrir Rota',
                            textColor: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

openMapsSheet(context, LocalizacaoModel loc) async {
  try {
    final coords = map.Coords(
      double.parse(loc.mapaLink.split(',')[0]),
      double.parse(loc.mapaLink.split(',').last),
    );
    final title = loc.endereco;
    final availableMaps = await map.MapLauncher.installedMaps;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () {
                        Modular.to.pop();
                        Modular.to.pop();
                        map.showMarker(
                          coords: coords,
                          title: title,
                        );
                      },
                      title: TextWidget(
                        text: map.mapName,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.black,
                      ),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  } catch (e) {
    print(e);
  }
}

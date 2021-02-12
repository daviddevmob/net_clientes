import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/entregador/entregador_localizacao.dart';
import 'package:net_cliente/app/shared/models/entregador/page_entregador_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'maps_entregador_controller.dart';
import 'package:flutter/services.dart' show rootBundle;


class MapsEntregadorPage extends StatefulWidget {
  final PageEntregadorModel entregador;
  const MapsEntregadorPage({Key key, @required this.entregador})
      : super(key: key);

  @override
  _MapsEntregadorPageState createState() => _MapsEntregadorPageState();
}

class _MapsEntregadorPageState
    extends ModularState<MapsEntregadorPage, MapsEntregadorController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
       await controller.getLocalizacao(widget.entregador.entregadorId, widget.entregador.pedidoId);
       await controller.setSourceAndDestinationIcons();
       await rootBundle.loadString('assets/maps_style/style.txt').then((string) {
       controller.mapStyle = string;
        });

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
          title: 'Seu Pedido',
          viewLeading: true,
        ),
      ),
      body: Observer(
        builder: (_){
          if(controller.entregador.data == null){
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if(controller.entregador.isEmpty == true){
            return Center(
              child: TextWidget(
                text: 'Nenhum entregador encontrado',
                fontSize: 14,
                textColor: Colors.grey[500],
                fontWeight: FontWeight.bold,
              ),
            );
          }

          EntregadorLocalizacaoModel entregador = controller.entregador.value;

          if(entregador.entregadorLocalizacao.ativo == false){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Container(
                          width: size.width * 0.9,
                          child: TextWidget(
                            text: 'Aguardando entregador disponibilizar localização...',
                            fontSize: 12,
                            textColor: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    SizedBox(
                      height: 25,
                    ),
                    CupertinoActivityIndicator(),
                  ],
                ),
              ],
            );
          } else if(entregador.restPedidos[0].statusPedido == 5){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Pedido entregue!',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Obrigado pela preferência!',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
                      ),
                  ],
                )
              ],
            );
          } else{
            if (widget.entregador.localizacao == null ||
            widget.entregador.localizacao == '') {
           print('vazio');
          } else {

          var values = widget.entregador.localizacao.split(',');
          controller.center = LatLng(double.parse(values[0]), double.parse(values[1]));
        
        Observer(builder: (_){
          if(controller.movimento == true){
            controller.setPolylines();
          }
          return SizedBox();
        });
        
        return Stack(
          children: [
            Observer(
              builder: (_) => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.localizacaoEntregador,
                  zoom: 12.2,
                  bearing:45,
                  tilt: 80,
                ),
                onMapCreated: controller.criarMapa,
                markers: controller.pinos,
                zoomControlsEnabled: false,
              ),
            ),
          ],
        );

      }
    }
        }));
  }
}



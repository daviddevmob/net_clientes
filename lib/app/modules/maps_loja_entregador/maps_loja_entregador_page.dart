import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/entregador_loja/entregador_loja_localizacao.dart';
import 'package:net_cliente/app/shared/models/entregador_loja/page_loja_entregador_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'maps_loja_entregador_controller.dart';
import 'package:flutter/services.dart' show rootBundle;

class MapsLojaEntregadorPage extends StatefulWidget {
  final PageLojaEntregadorModel entregadorModel;
  const MapsLojaEntregadorPage({Key key, @required this.entregadorModel})
      : super(key: key);

  @override
  _MapsLojaEntregadorPageState createState() => _MapsLojaEntregadorPageState();
}

class _MapsLojaEntregadorPageState
    extends ModularState<MapsLojaEntregadorPage, MapsLojaEntregadorController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
       await controller.getEntregador(widget.entregadorModel.entregadorId, widget.entregadorModel.pedidoId);
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

          EntregadorLojaLocalizacaoModel entregador = controller.entregador.value;

         if(entregador.lojaPedidos[0].statusPedido == 5){
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
          } else if(entregador.lojaPedidos[0].statusPedido == 2){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Pedido voltou para aprovado',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Aguarde ele sair novamente',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      CupertinoIcons.clock_solid,
                      ),
                  ],
                )
              ],
            );
          } else if(entregador.entregadorLocalizacao.ativo == false){
            return Container(
              margin: EdgeInsets.only(
                left: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoActivityIndicator(),
                          SizedBox(
                            height: 25,
                          ),
                           Container(
                                child: TextWidget(
                                  text: 'Aguardando entregador disponibilizar localização...',
                                  fontSize: 12,
                                  textColor: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        ],
                  ),
                ],
              ),
            );
          } else{
            if (widget.entregadorModel.localizacao == null ||
            widget.entregadorModel.localizacao == '') {
           print('vazio');
          } else {

          var values = widget.entregadorModel.localizacao.split(',');
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



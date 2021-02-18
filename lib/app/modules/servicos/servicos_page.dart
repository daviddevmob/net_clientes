import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/servicos/widgets/buscar_servico_erro_widget.dart';
import 'package:net_cliente/app/modules/servicos/widgets/buscar_servico_widget.dart';
import 'package:net_cliente/app/shared/models/servicos/base_service_profile.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_search_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'servicos_controller.dart';

class ServicosPage extends StatefulWidget {
  final int clienteId;
  const ServicosPage({Key key, @required this.clienteId}) : super(key: key);

  @override
  _ServicosPageState createState() => _ServicosPageState();
}

class _ServicosPageState
    extends ModularState<ServicosPage, ServicosController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: 'Serviços',
          viewLeading: true,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.servicosSearchModel == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Carregando..',
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CupertinoActivityIndicator(),
                ],
              ),
            );
          }

          if (controller.servicosSearchModel.servicoGeral.isEmpty == true) {
            return Observer(
              builder:(_) => BuscarServicoErroWidget(
                controller: controller,
              ),
            );
          }

          ServicosSearchModel servicos = controller.servicosSearchModel;

           

          return SingleChildScrollView(
            child: Align(
              child: Container(
                margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                child: ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    BuscarServicoPageWidget(
                      controller: controller,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.9,
                          child: ListView.separated(
                            physics: ScrollPhysics(),
                            itemCount: servicos.servicoGeral.length,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: size.height * 0.04,
                              );
                            },
                            itemBuilder: (context, index) {
                              var servico = servicos.servicoGeral[index];
                              var categoria;
                              switch (servico.categoria) {
                                case 1:
                                  categoria = 'Babá';
                                  break;
                                case 2:
                                  categoria = 'Eventos / Festas';
                                  break;
                                case 3:
                                  categoria = 'Informática';
                                  break;
                                case 4:
                                  categoria = 'Profissionais liberais';
                                  break;
                                case 5:
                                  categoria = 'Reparação / Conserto / Reforma';
                                  break;
                                case 6:
                                  categoria = 'Saúde / Beleza';
                                  break;
                                case 7:
                                  categoria = 'Tradução';
                                  break;
                                case 8:
                                  categoria = 'Transporte / Mudanças';
                                  break;
                                case 9:
                                  categoria = 'Turismo';
                                  break;
                                case 10:
                                  categoria = 'Outros';
                                  break;
                              }

                              var n = servico.servicoAvaliacaos.map((e) => e.nota);
                                double nota = servico.servicoAvaliacaos.isEmpty
                                ? 5.0
                                : (n.fold(0, (previousValue, element) => previousValue + element))/servico.servicoAvaliacaos.length;


                              return ListTile(
                        onTap: () async {
                          if (await ConnectionVerify.connectionStatus()) {
                           BaseServiceProfile base =
                                      new BaseServiceProfile(
                                    servico.usuarioId,
                                    servico.servicoNome,
                                    widget.clienteId,
                                    servico.servicoId,
                                  );
                                  Modular.to.pushNamed(
                                    '/servicos/servico_profile',
                                    arguments: base,
                                  );
                          } else {
                            return InternetFlushBar()
                                .showFlushBarInternet(context);
                          }
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: size.height * 0.1,
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 0,
                              ),
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: 
                            servico.servicoFotoPerfil == null 
                            || servico.servicoFotoPerfil == ''
                            ? AssetImage(
                              'assets/images/imagens-perfil/profile.png',
                                  )
                            : CachedNetworkImageProvider(
                              servico.servicoFotoPerfil,
                              ),
                              fit: BoxFit.cover,
                              )),
                           ),
                        title: Container(
                          height: 30,
                          child: TextWidget(
                            text: servico.servicoNome,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle:Container(
                          height: 30,
                          child: Wrap(
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
                                text: categoria,
                                fontSize: 13,
                                textColor: Colors.grey,
                                fontWeight: FontWeight.w500,
                                       ),
                            ],
                          ),
                        )
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: TotemCeWidget(),
    );
  }
}

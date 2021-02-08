import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/servicos/base_service_profile.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'favotiros_servicos_controller.dart';

class FavotirosServicosPage extends StatefulWidget {
  final int clienteId;
  const FavotirosServicosPage({Key key,@required this.clienteId})
      : super(key: key);

  @override
  _FavotirosServicosPageState createState() => _FavotirosServicosPageState();
}

class _FavotirosServicosPageState
    extends ModularState<FavotirosServicosPage, FavotirosServicosController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getServicos(widget.clienteId);
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
          title: 'Serviços Favoritos',
          viewLeading: true,
        ),
      ),
      body: Observer(
        builder: (_){
          if(controller.servicos == null){
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if(controller.servicos.clenteFavoritoServico.isEmpty){
            return Center(
              child: TextWidget(
                text: 'Nenhum serviço favoritado',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textColor: Colors.grey[500],
              ),
            );
          }

          if(controller.servicos.clenteFavoritoServico.isNotEmpty){
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                          width: size.width * 0.9,
                          child: ListView.separated(
                            physics: ScrollPhysics(),
                            itemCount: controller.servicos.clenteFavoritoServico.length,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: size.height * 0.04,
                              );
                            },
                            itemBuilder: (context, index) {
                              var servico = controller.servicos.clenteFavoritoServico[index];
                              var categoria;
                              switch (servico.servicoGeral.categoria) {
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
                              return ListTile(
                        onTap: () async {
                          if (await ConnectionVerify.connectionStatus()) {
                           BaseServiceProfile base =
                                      new BaseServiceProfile(
                                    servico.servicoGeral.usuarioId,
                                    servico.servicoGeral.servicoNome,
                                    widget.clienteId,
                                    servico.servicoGeral.servicoId,
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
                              color: Colors.grey[400],
                              width: 0,
                              ),
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: 
                            servico.servicoGeral.servicoFotoPerfil == null 
                            || servico.servicoGeral.servicoFotoPerfil == ''
                            ? AssetImage(
                              'assets/images/imagens-perfil/profile.png',
                                  )
                            : CachedNetworkImageProvider(
                              servico.servicoGeral.servicoFotoPerfil,
                              ),
                              fit: BoxFit.cover,
                              )),
                           ),
                        title: TextWidget(
                          text: servico.servicoGeral.servicoNome,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        subtitle: TextWidget(
                          text: categoria,
                          fontSize: 13,
                          textColor: Colors.grey,
                          fontWeight: FontWeight.w500,
                                 )
                              );
                            },
                          ),
                        ),
              ),
            );
          }
        },
      ),
    );
  }
}

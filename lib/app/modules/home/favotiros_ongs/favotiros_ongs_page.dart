import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_params_profile.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_search_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'favotiros_ongs_controller.dart';

class FavotirosOngsPage extends StatefulWidget {
  final int clienteId;
  const FavotirosOngsPage({Key key, @required this.clienteId})
      : super(key: key);

  @override
  _FavotirosOngsPageState createState() => _FavotirosOngsPageState();
}

class _FavotirosOngsPageState
    extends ModularState<FavotirosOngsPage, FavotirosOngsController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getOns(widget.clienteId);
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
          title: 'Contas Sociais Favoritas',
          viewLeading: true,
        ),
      ),
      body: Observer(
        builder: (_){
          if(controller.ongs == null){
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if(controller.ongs.clienteFavoritaOng.isEmpty){
            return Center(
              child: TextWidget(
                text: 'Nenhum serviço favoritado',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textColor: Colors.grey[500],
              ),
            );
          }

          if(controller.ongs.clienteFavoritaOng.isNotEmpty){
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                child: SizedBox(
                          width: size.width * 0.9,
                          child: ListView.separated(
                            physics: ScrollPhysics(),
                            itemCount: controller.ongs.clienteFavoritaOng.length,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: size.height * 0.04,
                              );
                            },
                            itemBuilder: (context, index) {
                              var ong = controller.ongs.clienteFavoritaOng[index];
                              String bairro = 
                              SwitchsUtils().getBairro(controller.ongs.clienteFavoritaOng[index].ongGeral.usuario.localizacao.bairro);
                              return ListTile(
                        onTap: () async {
                          if (await ConnectionVerify.connectionStatus()) {
                            Localizacao localizacao = new Localizacao(
                              bairro: ong.ongGeral.usuario.localizacao.bairro,
                            );
                            OngGeral ongGeral = new OngGeral(
                              ongNome: ong.ongGeral.ongNome,
                              ongDescricao: '',
                              ongId: ong.ongGeral.ongId,
                              ongImagemPerfil: ong.ongGeral.ongImagemPerfil,
                              usuarioId: ong.ongGeral.usuarioId,
                            );
                            Usuario usuario = new Usuario(
                              localizacao: localizacao,
                              ongGeral: ongGeral,
                            );
                           OngParamsProfile params = new OngParamsProfile(
                                  usuario,
                                  widget.clienteId,
                                );
                                Modular.to.pushNamed(
                                      '/ongs/ong_profile/',
                                      arguments: params,
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
                            ong.ongGeral.ongImagemPerfil == null 
                            || ong.ongGeral.ongImagemPerfil == ''
                            ? AssetImage(
                              'assets/images/imagens-perfil/profile.png',
                                  )
                            : CachedNetworkImageProvider(
                              ong.ongGeral.ongImagemPerfil,
                              ),
                              fit: BoxFit.cover,
                              )),
                           ),
                        title: TextWidget(
                          text: ong.ongGeral.ongNome,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        subtitle: TextWidget(
                          text: bairro,
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

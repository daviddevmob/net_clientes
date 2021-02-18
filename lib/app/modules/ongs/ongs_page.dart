import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/ongs/widgets/buscar_ongs_erro_widget.dart';
import 'package:net_cliente/app/modules/ongs/widgets/buscar_ongs_widget.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_params_profile.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_search_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'ongs_controller.dart';

class OngsPage extends StatefulWidget {
  final int clienteId;
  const OngsPage({Key key, @required this.clienteId}) : super(key: key);

  @override
  _OngsPageState createState() => _OngsPageState();
}

class _OngsPageState extends ModularState<OngsPage, OngsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: AppBarWidget(
          title: 'Projetos Sociais e ONGs',
          viewLeading: true,
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.ong == null) {
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

        if (controller.ong.usuario.isEmpty == true) {
          return BuscarOngsPageErroWidget(
            controller: controller,
          );
        }

        OngSearchModel ong = controller.ong;

        return SingleChildScrollView(
          child: Align(
            child: Container(
              margin: EdgeInsets.only(top: 0, left: 5, right: 5),
              height: size.height,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  BuscarOngsPageWidget(
                    controller: controller,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10
                    ),
                    child: Row(
                      children: [
                        TextWidget(
                          text: 'Contas Sociais',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: size.width * 0.9,
                        height: size.height * 0.9,
                        child: ListView.separated(
                          itemCount: ong.usuario.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: size.height * 0.04,
                            );
                          },
                          itemBuilder: (context, index) {
                            var user = ong.usuario[index];
                            var bairro; 
                              switch (user.localizacao.bairro) {
                                case 1:
                                  bairro = 'Amador';
                                  break;
                                case 2:
                                  bairro = 'Autódromo';
                                  break;
                                case 3:
                                  bairro = 'Cararu';
                                  break;
                                case 4:
                                  bairro = 'Centro';
                                  break;
                                case 5:
                                  bairro = 'Cidade Nova';
                                  break;
                                case 6:
                                  bairro = 'Coaçu';
                                  break;
                                case 7:
                                  bairro = 'Coité';
                                  break;
                                case 8:
                                  bairro = 'Encantada';
                                  break;
                                case 9:
                                  bairro = 'Guaribas';
                                  break;
                                case 10:
                                  bairro = 'Jabuti';
                                  break;
                                case 11:
                                  bairro = 'Lagoinha';
                                  break;
                                case 12:
                                  bairro = 'Mangabeira';
                                  break;
                                case 13:
                                  bairro = 'Novo Portugal';
                                  break;
                                case 14:
                                  bairro = 'Olho D’água';
                                  break;
                                case 15:
                                  bairro = 'Parque Havaí';
                                  break;
                                case 16:
                                  bairro = 'Pires Façanha';
                                  break;
                                case 17:
                                  bairro = 'Precabura';
                                  break;
                                case 18:
                                  bairro = 'Santa Clara';
                                  break;
                                case 19:
                                  bairro = 'Santo Antônio';
                                  break;
                                case 20:
                                  bairro = 'Tamatanduba';
                                  break;
                                case 21:
                                  bairro = 'Timbú';
                                  break;
                                case 22:
                                  bairro = 'Urucunema';
                                  break;
                                case 23:
                                  bairro = 'Vereda Tropical';
                                  break;
                              }
                           return ListTile(
                              onTap: () async {
                                if (await ConnectionVerify.connectionStatus()) {
                                OngParamsProfile params = new OngParamsProfile(
                                  ong.usuario[index],
                                  widget.clienteId,
                                );
                                Modular.to.pushNamed(
                                      '/ongs/ong_profile',
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
                                    color: Colors.transparent,
                                    width: 0,
                                    ),
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(
                                  image: 
                                  user.ongGeral.ongImagemPerfil == null 
                                  || user.ongGeral.ongImagemPerfil == ''
                                  ? AssetImage(
                                    'assets/images/imagens-perfil/profile.png',
                                        )
                                  : CachedNetworkImageProvider(
                                  user.ongGeral.ongImagemPerfil,
                                    ),
                                    fit: BoxFit.cover,
                                    )),
                                ),
                              title: TextWidget(
                                text: user.ongGeral.ongNome,
                                fontSize: 14,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: TotemCeWidget(),
    );
  }
}

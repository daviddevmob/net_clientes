import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/ongs/ong_profile/dialogs.dart';
import 'package:net_cliente/app/modules/ongs/ong_profile/widgets/como_ajudar_widget.dart';
import 'package:net_cliente/app/shared/models/localizacao_model.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_search_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/social_button.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'ong_profile_controller.dart';

class OngProfilePage extends StatefulWidget {
  final Usuario ongSearch;
  const OngProfilePage({Key key, @required this.ongSearch}) : super(key: key);

  @override
  _OngProfilePageState createState() => _OngProfilePageState();
}

class _OngProfilePageState
    extends ModularState<OngProfilePage, OngProfileController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getOng(widget.ongSearch.ongGeral.usuarioId.toInt());
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
          title: widget.ongSearch.ongGeral.ongNome,
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

        var ong = controller.ong.usuario[0];

        return SingleChildScrollView(
            child: Column(
              children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.45,
              ),
              GestureDetector(
                onTap: () {
                  ong.ongGeral.ongImagemCapa == null 
                  || ong.ongGeral.ongImagemCapa == ''
                  ? print('Vazio')
                  : Modular.to.pushNamed(
                    '/ongs/ong_profile/view_capa_perfil',
                     arguments: ong.ongGeral.ongImagemCapa);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    left: 5,
                    right: 5,
                  ),
                  height: size.height * 0.3,
                  width: size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[200],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ong.ongGeral.ongImagemCapa == null ||
                                ong.ongGeral.ongImagemCapa == ''
                            ? AssetImage(
                                'assets/images/imagens-perfil/profile.png')
                            : CachedNetworkImageProvider(
                                ong.ongGeral.ongImagemCapa),
                      )),
                ),
              ),
              Positioned(
                top: 150,
                left: size.width * 0.29,
                child: Card(
                  elevation: 2,
                  child: GestureDetector(
                    onTap: (){
                      ong.ongGeral.ongImagemPerfil == null 
                  || ong.ongGeral.ongImagemPerfil == ''
                  ? print('Vazio')
                  : Modular.to.pushNamed(
                    '/ongs/ong_profile/view_capa_perfil',
                     arguments: ong.ongGeral.ongImagemPerfil);
                    },
                    child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[200],
                        ),
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                            image: ong.ongGeral.ongImagemPerfil == null ||
                                    ong.ongGeral.ongImagemPerfil == ''
                                ? AssetImage(
                                    'assets/images/imagens-perfil/profile.png')
                                : CachedNetworkImageProvider(
                                    ong.ongGeral.ongImagemPerfil),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: ong.ongGeral.ongNome,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Container(
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextWidget(
                        text: ong.ongGeral.ongDescricao,
                        fontSize: 18,
                        textColor: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.0015,
                margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                width: size.width * 0.9,
                color: Cores.verdeClaro,
              ),
              TextWidget(
                text: 'Galeria de Fotos',
                fontWeight: FontWeight.w500,
              ),
              ong.ongGeral.ongFotos.isEmpty
                  ? SizedBox(
                      height: size.height * 0.02,
                    )
                  : SizedBox(
                      height: size.height * 0.05,
                    ),
              Observer(builder: (_) {
                if (ong.ongGeral.ongFotos.isEmpty) {
                  return TextWidget(
                    text: 'Nenhuma foto inserida',
                  );
                } else {
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      height: size.height * 0.35,
                    ),
                    itemCount: ong.ongGeral.ongFotos.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              List<String> pathImages =
                              ong.ongGeral.ongFotos
                              .map((e) => e.ongFotoLink).toList();
                              Modular.to.pushNamed(
                    '/ongs/ong_profile/view_imagens_galeria',
                     arguments: pathImages);
                            },
                            child: Container(
                              height: size.height * 0.25,
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[200]),
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        ong.ongGeral.ongFotos[index]
                                            .ongFotoLink,
                                      ))),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                width: size.width * 0.7,
                                child: TextWidget(
                                  text: ong.ongGeral.ongFotos[index]
                                      .ongFotoDescricao,
                                  fontSize: 16,
                                  textColor: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              }),
              Container(
                height: size.height * 0.0015,
                margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                width: size.width * 0.9,
                color: Cores.verdeClaro,
              ),
              Container(
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Como você pode ajudar',
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              ong.ongGeral.ongContrubiocaos.isEmpty
                  ? SizedBox()
                  : Container(
                      width: size.width * 0.8,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: ong.ongGeral.ongContrubiocaos.length,
                        itemBuilder: (context, index) {
                          var contribuicoes =
                              ong.ongGeral.ongContrubiocaos[index];
                          return ComoAjudarWidget(
                            text: contribuicoes.texto,
                          );
                        },
                      ),
                    ),
              Container(
                height: size.height * 0.0015,
                margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                width: size.width * 0.9,
                color: Cores.verdeClaro,
              ),
              Container(
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Localização',
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              ong.localizacao.endereco == null || ong.localizacao.endereco == ''
                  ? TextWidget(
                      text: 'Endereço não compartilhado',
                    )
                  : Container(
                      width: size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextWidget(
                              text: ong.localizacao.endereco,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                Divider(
                  color: Colors.transparent,
                  height: 35,
                ),
              ong.localizacao.mapaLink == null || ong.localizacao.mapaLink == ''
                  ? SizedBox()
                  : FlatButton(
                      color: Cores.azul,
                      onPressed: () {
                        LocalizacaoModel localizacaoModel =
                            new LocalizacaoModel(
                          complemento: ong.localizacao.complemento,
                          endereco: ong.localizacao.endereco,
                          mapaLink: ong.localizacao.mapaLink,
                        );
                        Modular.to.pushNamed('/ongs/ong_profile/maps_view',
                            arguments: localizacaoModel);
                      },
                      child: TextWidget(
                        text: 'Ver no Mapa',
                        textColor: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
              Container(
                height: size.height * 0.0015,
                margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                width: size.width * 0.9,
                color: Cores.verdeClaro,
              ),
              TextWidget(
                text: 'Contatos',
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ong.socialLinks == null ||
                      ong.socialLinks.whatsapp == '' &&
                          ong.socialLinks.instagram == '' &&
                          ong.socialLinks.email == '' &&
                          ong.socialLinks.telefone == ''
                  ? TextWidget(
                      text: 'Nenhum Contato Disponibilizado',
                      fontSize: 18,
                      textColor: Colors.grey,
                    )
                  : Container(
                      width: size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ong.socialLinks.whatsapp == null ||
                                  ong.socialLinks.whatsapp == ''
                              ? SocialButtonWidget(
                                  function: () {
                                    avisoVazioContatoDialog(
                                      context,
                                      'WhatsApp',
                                    );
                                  },
                                  imagePath:
                                      'assets/images/icons-social/zap-vazio.svg')
                              : SocialButtonWidget(
                                  function: () {
                                    controller
                                        .sendWhatsApp(ong.socialLinks.whatsapp);
                                  },
                                  imagePath:
                                      'assets/images/icons-social/zap.svg'),
                          ong.socialLinks.instagram == null ||
                                  ong.socialLinks.instagram == ''
                              ? SocialButtonWidget(
                                  function: () {
                                    avisoVazioContatoDialog(
                                      context,
                                      'Instagram',
                                    );
                                  },
                                  imagePath:
                                      'assets/images/icons-social/instagram-vazio.svg')
                              : SocialButtonWidget(
                                  function: () {
                                    controller.sendInstagram(
                                        ong.socialLinks.instagram);
                                  },
                                  imagePath:
                                      'assets/images/icons-social/instagram.svg'),
                          ong.socialLinks.email == null ||
                                  ong.socialLinks.email == ''
                              ? SocialButtonWidget(
                                  function: () {
                                    avisoVazioContatoDialog(
                                      context,
                                      'E-mail',
                                    );
                                  },
                                  imagePath:
                                      'assets/images/icons-social/email-vazio.svg')
                              : SocialButtonWidget(
                                  function: () {
                                    controller.sendEmail(ong.socialLinks.email);
                                  },
                                  imagePath:
                                      'assets/images/icons-social/email.svg'),
                          ong.socialLinks.telefone == null ||
                                  ong.socialLinks.telefone == ''
                              ? SocialButtonWidget(
                                  function: () {
                                    avisoVazioContatoDialog(
                                      context,
                                      'Telefone',
                                    );
                                  },
                                  imagePath:
                                      'assets/images/icons-social/call-vazio.svg')
                              : SocialButtonWidget(
                                  function: () {
                                    controller
                                        .sendLigacao(ong.socialLinks.telefone);
                                  },
                                  imagePath:
                                      'assets/images/icons-social/call.svg'),
                        ],
                      ),
                    ),
              ong.socialLinks == null
                  ? SizedBox()
                  : SizedBox(
                      height: size.height * 0.05,
                    ),
            ],
          ),
        ]));
      }),
      bottomNavigationBar: TotemCeWidget(),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/ongs/ong_profile/dialogs.dart';
import 'package:net_cliente/app/modules/servicos/servico_profile/servicos_list.dart';
import 'package:net_cliente/app/shared/models/localizacao_model.dart';
import 'package:net_cliente/app/shared/models/servicos/base_service_profile.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/dias_semana.dart';
import 'package:net_cliente/app/shared/utils/social_button.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'servico_profile_controller.dart';

class ServicoProfilePage extends StatefulWidget {
  final BaseServiceProfile baseServiceProfile;
  const ServicoProfilePage(
      {Key key, @required this.baseServiceProfile})
      : super(key: key);

  @override
  _ServicoProfilePageState createState() => _ServicoProfilePageState();
}

class _ServicoProfilePageState
    extends ModularState<ServicoProfilePage, ServicoProfileController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getServicoUser(widget.baseServiceProfile.userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(size.width, 50),
          child: AppBarWidget(
            title: widget.baseServiceProfile.title,
            viewLeading: true,
            actions: [
              IconButton(
                icon: Icon(CupertinoIcons.star), 
                onPressed: (){
                  
                },
                )
            ],
            ),
          ),
      body: Observer(
        builder: (_) {
          if (controller.servicoUser == null) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (controller.servicoUser.usuario.isEmpty == true) {
            return Center(
              child: TextWidget(
                text: 'Erro',
              ),
            );
          }

          ServicoModel user = controller.servicoUser;
          ServicoGeral infosGerais = user.usuario[0].servicoGeral;
          List<ServicoList> list = user.usuario[0].servicoGeral.servicoLists;
          List<ServicoFoto> imagens = user.usuario[0].servicoGeral.servicoFotos;
          bool domicilio = user.usuario[0].servicoGeral.servicoDomicilio;
          bool local = user.usuario[0].servicoGeral.servicoLocal;
          DiasSemana dias = user.usuario[0].diasSemana;
          HorarioAtendimento horarios = user.usuario[0].horarioAtendimento;
          Localizacao localizacao = user.usuario[0].localizacao;
          SocialLinks links = user.usuario[0].socialLinks;

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
                        infosGerais.servicoFotoCapa == null ||
                                infosGerais.servicoFotoCapa == ''
                            ? print('Vazio')
                            : Modular.to.pushNamed(
                                '/ongs/ong_profile/view_capa_perfil',
                                arguments: infosGerais.servicoFotoCapa);
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
                              image: infosGerais.servicoFotoCapa == null ||
                                      infosGerais.servicoFotoCapa == ''
                                  ? AssetImage(
                                      'assets/images/imagens-perfil/profile.png')
                                  : CachedNetworkImageProvider(
                                      infosGerais.servicoFotoCapa),
                            )),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: size.width * 0.29,
                      child: Card(
                        elevation: 2,
                        child: GestureDetector(
                          onTap: () {
                            infosGerais.servicoFotoPerfil == null ||
                                    infosGerais.servicoFotoPerfil == ''
                                ? print('Vazio')
                                : Modular.to.pushNamed(
                                    '/ongs/ong_profile/view_capa_perfil',
                                    arguments: infosGerais.servicoFotoPerfil,
                                  );
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
                                  image: infosGerais.servicoFotoPerfil ==
                                              null ||
                                          infosGerais.servicoFotoPerfil == ''
                                      ? AssetImage(
                                          'assets/images/imagens-perfil/profile.png')
                                      : CachedNetworkImageProvider(
                                          infosGerais.servicoFotoPerfil,
                                        ),
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
                  width: size.width * 0.8,
                  child: Align(
                    child: TextWidget(
                        text: infosGerais.servicoNome,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                  ),
                ),
                Divider(color: Colors.transparent),
                Container(
                  width: size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextWidget(
                          text: infosGerais.servicoDescricao,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              Container(
                height: size.height * 0.0015,
                margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                width: size.width * 0.9,
                color: Cores.verdeClaro,
              ),
                TextWidget(
                  text: 'Meus Serviços:',
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                infosGerais.servicoLists.isEmpty == true
                    ? TextWidget(
                        text: 'Nenhum serviço cadastrado',
                      )
                    : Container(
                        width: size.width * 0.8,
                        margin: EdgeInsets.only(top: size.height * 0.02),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            var servico = list[index];
                            return MeusServicosWidget(
                              servicoList: servico,
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
                TextWidget(
                  text: 'Galeria de Fotos:',
                  fontWeight: FontWeight.w500,
                ),
                imagens.isEmpty
                    ? SizedBox(
                        height: size.height * 0.02,
                      )
                    : SizedBox(
                        height: size.height * 0.05,
                      ),
                Observer(builder: (_) {
                  if (imagens.isEmpty) {
                    return TextWidget(
                      text: 'Nenhuma foto inserida',
                    );
                  } else {
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: size.height * 0.35,
                      ),
                      itemCount: imagens.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                List<String> pathImages =
                                    imagens.map((e) => e.link).toList();
                                Modular.to.pushNamed(
                                  '/ongs/ong_profile/view_imagens_galeria',
                                  arguments: pathImages,
                                );
                              },
                              child: Container(
                                height: size.height * 0.25,
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                          imagens[index].link,
                                        ))),
                              ),
                            ),
                            Divider(
                              color: Colors.transparent,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  width: size.width * 0.7,
                                  child: TextWidget(
                                    text: imagens[index].descricao,
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
                TextWidget(
                  text: 'Como Atendemos:',
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Column(
                    children: [
                      local == false && domicilio == false 
                      ? TextWidget(
                        text: 'Não estamos atendendo no momento',
                        fontWeight: FontWeight.w500,
                        textColor: Colors.grey,
                      )
                      : SizedBox(),
                      local == true
                          ? GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.map,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  TextWidget(
                                    text: 'Atendimento Local',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    textColor: Colors.green,
                                  )
                                ],
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      domicilio == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  CupertinoIcons.home,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                TextWidget(
                                  text: 'Em Domicílio',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  textColor: Colors.green,
                                )
                              ],
                            )
                          : SizedBox(),
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
                  text: 'Dias de Atendimento:',
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Observer(
                        builder: (_) => Expanded(
                            child: Container(
                          child: DiasSemanaWidget(
                            dia: 'Segunda',
                            horarioDia: horarios.segunda == null ||
                                    horarios.segunda == ''
                                ? 'Não informado'
                                : horarios.segunda,
                            atividade: dias.segunda,
                          ),
                        )),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Observer(
                        builder: (_) => Expanded(
                            child: Container(
                          child: DiasSemanaWidget(
                            dia: 'Terça',
                            horarioDia:
                                horarios.terca == null || horarios.terca == ''
                                    ? 'Não informado'
                                    : horarios.terca,
                            atividade: dias.terca,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Row(
                    children: [
                      Observer(
                        builder: (_) => Expanded(
                            child: Container(
                          child: DiasSemanaWidget(
                            dia: 'Quarta',
                            horarioDia:
                                horarios.quarta == null || horarios.quarta == ''
                                    ? 'Não informado'
                                    : horarios.quarta,
                            atividade: dias.quarta,
                          ),
                        )),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Observer(
                        builder: (_) => Expanded(
                            child: Container(
                          child: DiasSemanaWidget(
                            dia: 'Quinta',
                            horarioDia:
                                horarios.quinta == null || horarios.quinta == ''
                                    ? 'Não informado'
                                    : horarios.quinta,
                            atividade: dias.quinta,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Observer(
                        builder: (_) => Expanded(
                            child: Container(
                          child: DiasSemanaWidget(
                            dia: 'Sexta',
                            horarioDia:
                                horarios.sexta == null || horarios.sexta == ''
                                    ? 'Não informado'
                                    : horarios.sexta,
                            atividade: dias.sexta,
                          ),
                        )),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Observer(
                        builder: (_) => Expanded(
                            child: Container(
                          child: DiasSemanaWidget(
                            dia: 'Sábado',
                            horarioDia:
                                horarios.sabado == null || horarios.sabado == ''
                                    ? 'Não informado'
                                    : horarios.sabado,
                            atividade: dias.sabado,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Observer(
                    builder: (_) => Container(
                          width: size.width * 0.4,
                          child: DiasSemanaWidget(
                            dia: 'Domingo',
                            horarioDia: horarios.domingo == null ||
                                    horarios.domingo == ''
                                ? 'Não informado'
                                : horarios.domingo,
                            atividade: dias.domingo,
                          ),
                        )),
              Container(
                height: size.height * 0.0015,
                margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                width: size.width * 0.9,
                color: Cores.verdeClaro,
              ),
                TextWidget(
                  text: 'Localização:',
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                localizacao.endereco == '' || localizacao.endereco == null
                    ? TextWidget(
                        text: 'Endereço não disponibilizado',
                        fontSize: 18,
                      )
                    : Column(
                        children: [
                          Container(
                            width: size.width * 0.8,
                            child: Row(
                              children: [
                                TextWidget(
                                  text: 'Endereço: ',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width * 0.8,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextWidget(
                                    text: localizacao.endereco,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                Divider(
                  color: Colors.transparent,
                  height: 35,
                ),
                localizacao.mapaLink == null || localizacao.mapaLink == ''
                    ? SizedBox()
                    : FlatButton(
                        color: Cores.azul,
                        onPressed: () {
                          LocalizacaoModel localizacaoModel =
                              new LocalizacaoModel(
                            complemento: localizacao.complemento,
                            endereco: localizacao.endereco,
                            mapaLink: localizacao.mapaLink,
                          );
                          Modular.to.pushNamed(
                              '/servicos/servico_profile/maps_view',
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
                  text: 'Contatos:',
                  fontWeight: FontWeight.w500,
                ),
                Divider(color: Colors.transparent),
                links == null
                    ? SizedBox()
                    : Container(
                        width: size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            links.whatsapp == null || links.whatsapp == ''
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
                                      controller.sendWhatsApp(links.whatsapp);
                                    },
                                    imagePath:
                                        'assets/images/icons-social/zap.svg'),
                            links.instagram == null || links.instagram == ''
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
                                      controller.sendInstagram(links.instagram);
                                    },
                                    imagePath:
                                        'assets/images/icons-social/instagram.svg'),
                            links.email == null || links.email == ''
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
                                      controller.sendEmail(links.email);
                                    },
                                    imagePath:
                                        'assets/images/icons-social/email.svg'),
                            links.telefone == null || links.telefone == ''
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
                                      controller.sendCall(links.telefone);
                                    },
                                    imagePath:
                                        'assets/images/icons-social/call.svg'),
                          ],
                        ),
                      ),
                links == null
                    ? SizedBox()
                    : SizedBox(
                        height: size.height * 0.05,
                      ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: TotemCeWidget(),
    );
  }
}

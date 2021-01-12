import 'package:cached_network_image/cached_network_image.dart';
import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/servicos/servico_profile/servicos_list.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'servico_profile_controller.dart';

class ServicoProfilePage extends StatefulWidget {
  final String title;
  const ServicoProfilePage({Key key, this.title = "ServicoProfile"})
      : super(key: key);

  @override
  _ServicoProfilePageState createState() => _ServicoProfilePageState();
}

class _ServicoProfilePageState
    extends ModularState<ServicoProfilePage, ServicoProfileController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(size.width, 50),
          child: AppBarWidget(
          title: 'Serviços',
          viewLeading: true,
        )),
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
          var infosGerais = user.usuario[0].servicoGeral;
          var list = user.usuario[0].servicoGeral.servicoLists;
          var imagens = user.usuario[0].servicoGeral.servicoFotos;
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
                 infosGerais.servicoFotoCapa == null 
                  || infosGerais.servicoFotoCapa == ''
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
                    onTap: (){
                      infosGerais.servicoFotoPerfil == null 
                  || infosGerais.servicoFotoPerfil == ''
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
                            image: infosGerais.servicoFotoPerfil == null ||
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
                Divider(
                  color: Colors.transparent,
                ),
                Container(
                    width: size.width * 0.8,
                    child: Align(
                      child: Expanded(
                        child: TextWidget(
                          text: infosGerais.servicoNome,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
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
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.0025,
                  margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                  width: size.width * 0.9,
                  color: Colors.grey[300],
                ),
                TextWidget(
                  text: 'Meus Serviços:',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                infosGerais.servicoLists.isEmpty == true
                    ? SizedBox()
                    : Container(
                        width: size.width * 0.8,
                        margin: EdgeInsets.only(top: size.height * 0.02),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            var servico = list[index];
                            return GestureDetector(
                                onTap: () async {
                                  if (await ConnectionVerify
                                      .connectionStatus()) {
                                    Modular.to.pushNamed(
                                        '/servicos/edit_servico',
                                        arguments: servico);
                                  } else {
                                    InternetFlushBar()
                                        .showFlushBarInternet(context);
                                  }
                                },
                                child: MeusServicosWidget(
                                  servicoList: servico,
                                ));
                          },
                        ),
                      ),
                list.isEmpty == true
                    ? SizedBox()
                    : TextWidget(
                        text: 'Clique em um serviço para editar',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                Container(
                  height: size.height * 0.0025,
                  margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                  width: size.width * 0.9,
                  color: Colors.grey[300],
                ),
                TextWidget(
                  text: 'Galeria de Fotos',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
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
                  } else if (controller.imageCarrouselLoad == true) {
                    return CupertinoActivityIndicator();
                  } else {
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: size.height * 0.45,
                      ),
                      itemCount: imagens.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                return showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CupertinoActionSheet(
                                            actionScrollController:
                                                controller.scrollController,
                                            title: TextWidget(
                                              text: 'Galeria',
                                            ),
                                            actions: [
                                              CupertinoActionSheetAction(
                                                onPressed: () async {
                                                  List<String> pathImages =
                                                      imagens
                                                          .map((e) => e.link)
                                                          .toList();
                                                  if (await ConnectionVerify
                                                      .connectionStatus()) {
                                                    Modular.to
                                                        .pushNamed(
                                                            '/servicos/view_imagens_galeria',
                                                            arguments:
                                                                pathImages)
                                                        .then((value) {
                                                      return Navigator.pop(
                                                          context);
                                                    });
                                                  } else {
                                                    Navigator.pop(context);
                                                    InternetFlushBar()
                                                        .showFlushBarInternet(
                                                            context);
                                                  }
                                                },
                                                child: Text(
                                                  'Ver Fotos',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              CupertinoActionSheetAction(
                                                onPressed: () async {
                                                  if (await ConnectionVerify
                                                      .connectionStatus()) {
                                                    controller
                                                            .descricaoController
                                                            .text =
                                                        imagens[index]
                                                            .descricao;
                                                    descricaoImagemServicoEdit(
                                                        context,
                                                        controller,
                                                        imagens[index]
                                                            .servicoFotoId);
                                                  } else {
                                                    Navigator.pop(context);
                                                    InternetFlushBar()
                                                        .showFlushBarInternet(
                                                            context);
                                                  }
                                                },
                                                child: Text(
                                                  'Editar Descrição',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              CupertinoActionSheetAction(
                                                onPressed: () async {
                                                  if (await ConnectionVerify
                                                      .connectionStatus()) {
                                                    Navigator.pop(context);
                                                    return deleteServicoListDialog(
                                                        context,
                                                        imagens[index]
                                                            .servicoFotoId,
                                                        controller);
                                                  } else {
                                                    Navigator.pop(context);
                                                    InternetFlushBar()
                                                        .showFlushBarInternet(
                                                            context);
                                                  }
                                                },
                                                child: Text(
                                                  'Deletar',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    });
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
                Divider(
                  color: Colors.transparent,
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.transparent)),
                    child: TextWidget(
                      text: 'Adicionar Imagem',
                      textColor: Colors.white,
                      fontSize: 15,
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      Modular.to.pushNamed('/servicos/add_galeria',
                          arguments: user.servicoGeral.servicoId);
                    }),
                imagens.isEmpty == true
                    ? SizedBox()
                    : TextWidget(
                        text: 'Clique em uma imagem para editar',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                Container(
                  height: size.height * 0.0025,
                  margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                  width: size.width * 0.9,
                  color: Colors.grey[300],
                ),
                TextWidget(
                  text: 'Como Atendemos',
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Column(
                    children: [
                      local == true
                          ? GestureDetector(
                              onTap: () {
                                setAtendimentoTipo(context, 'local');
                              },
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
                          : GestureDetector(
                              onTap: () {
                                setAtivarAtendimentoTipo(context, 'local');
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(bottom: size.height * 0.00),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.map,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    TextWidget(
                                      text: 'Atendimento Local',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      textColor: Colors.red,
                                    )
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      domicilio == true
                          ? GestureDetector(
                              onTap: () {
                                setAtendimentoTipo(context, 'domicilio');
                              },
                              child: Row(
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
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                setAtivarAtendimentoTipo(context, 'domicilio');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.home,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  TextWidget(
                                    text: 'Em Domicílio',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    textColor: Colors.red,
                                  )
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                Divider(color: Colors.transparent),
                Container(
                  width: size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'Clique em um tipo para editar',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.0025,
                  margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                  width: size.width * 0.9,
                  color: Colors.grey[300],
                ),
                TextWidget(
                  text: 'Dias de Atendimento',
                  fontWeight: FontWeight.w500,
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
                              child: GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/servicos/edit_atendimento',
                                  arguments: EditServicoAtendimentoModel(
                                      'Segunda',
                                      dias.segunda,
                                      horarios.segunda,
                                      infosGerais.usuarioId));
                            },
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
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Observer(
                        builder: (_) => Expanded(
                          child: Container(
                              child: GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/servicos/edit_atendimento',
                                  arguments: EditServicoAtendimentoModel(
                                      'Terca',
                                      dias.terca,
                                      horarios.terca,
                                      infosGerais.usuarioId));
                            },
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
                              child: GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/servicos/edit_atendimento',
                                  arguments: EditServicoAtendimentoModel(
                                      'Quarta',
                                      dias.quarta,
                                      horarios.quarta,
                                      infosGerais.usuarioId));
                            },
                            child: DiasSemanaWidget(
                              dia: 'Quarta',
                              horarioDia: horarios.quarta == null ||
                                      horarios.quarta == ''
                                  ? 'Não informado'
                                  : horarios.quarta,
                              atividade: dias.quarta,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Observer(
                        builder: (_) => Expanded(
                          child: Container(
                              child: GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/servicos/edit_atendimento',
                                  arguments: EditServicoAtendimentoModel(
                                      'Quinta',
                                      dias.quinta,
                                      horarios.quinta,
                                      infosGerais.usuarioId));
                            },
                            child: DiasSemanaWidget(
                              dia: 'Quinta',
                              horarioDia: horarios.quinta == null ||
                                      horarios.quinta == ''
                                  ? 'Não informado'
                                  : horarios.quinta,
                              atividade: dias.quinta,
                            ),
                          )),
                        ),
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
                              child: GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/servicos/edit_atendimento',
                                  arguments: EditServicoAtendimentoModel(
                                      'Sexta',
                                      dias.sexta,
                                      horarios.sexta,
                                      infosGerais.usuarioId));
                            },
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
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Observer(
                        builder: (_) => Expanded(
                          child: Container(
                              child: GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/servicos/edit_atendimento',
                                  arguments: EditServicoAtendimentoModel(
                                      'Sábado',
                                      dias.sabado,
                                      horarios.sabado,
                                      infosGerais.usuarioId));
                            },
                            child: DiasSemanaWidget(
                              dia: 'Sábado',
                              horarioDia: horarios.sabado == null ||
                                      horarios.sabado == ''
                                  ? 'Não informado'
                                  : horarios.sabado,
                              atividade: dias.sabado,
                            ),
                          )),
                        ),
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
                      child: GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed('/servicos/edit_atendimento',
                              arguments: EditServicoAtendimentoModel(
                                  'Domingo',
                                  dias.domingo,
                                  horarios.domingo,
                                  infosGerais.usuarioId));
                        },
                        child: DiasSemanaWidget(
                          dia: 'Domingo',
                          horarioDia:
                              horarios.domingo == null || horarios.domingo == ''
                                  ? 'Não informado'
                                  : horarios.domingo,
                          atividade: dias.domingo,
                        ),
                      )),
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Container(
                  width: size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'Clique em um dia para editar',
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.0025,
                  margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                  width: size.width * 0.9,
                  color: Colors.grey[300],
                ),
                TextWidget(
                  text: 'Localização',
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                localizacao.endereco == '' || localizacao.endereco == null
                    ? SizedBox()
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
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.transparent)),
                  child: TextWidget(
                    text: localizacao.endereco == '' ||
                            localizacao.endereco == null
                        ? 'Inserir Localizacao'
                        : 'Editar Localização',
                    textColor: Colors.white,
                    fontSize: 15,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    LocalizacaoModel localizacaoModel = new LocalizacaoModel(
                      complemento: localizacao.complemento,
                      endereco: localizacao.endereco,
                      mapaLink: localizacao.mapaLink,
                      localizacaoId: localizacao.localizacaoId,
                    );
                    Modular.to.pushNamed('/maps', arguments: localizacaoModel);
                  },
                ),
                localizacao.endereco == '' || localizacao.endereco == null
                    ? SizedBox(
                        height: size.height * 0.02,
                      )
                    : SizedBox(),
                Container(
                  width: size.width * 0.8,
                  child: TextWidget(
                    text:
                        'Seu endereço aparecerá para o cliente em forma de texto e localização no mapa. Só insira o endereço caso queira que seu cliente saiba chegar até você.',
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Container(
                  height: size.height * 0.0025,
                  margin: EdgeInsets.symmetric(vertical: size.width * 0.08),
                  width: size.width * 0.9,
                  color: Colors.grey[300],
                ),
                TextWidget(
                  text: 'Contatos',
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
                                          context, 'WhatsApp', () {
                                        Modular.to.pushNamed('/edit_contatos',
                                            arguments: links);
                                      });
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
                                          context, 'Instagram', () {
                                        Modular.to.pushNamed('/edit_contatos',
                                            arguments: links);
                                      });
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
                                      avisoVazioContatoDialog(context, 'E-mail',
                                          () {
                                        Modular.to.pushNamed('/edit_contatos',
                                            arguments: links);
                                      });
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
                                          context, 'Telefone', () {
                                        Modular.to.pushNamed('/edit_contatos',
                                            arguments: links);
                                      });
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
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.transparent)),
                  child: TextWidget(
                    text:
                        links == null ? 'Inserir Contatos' : 'Editar Contatos',
                    textColor: Colors.white,
                    fontSize: 15,
                  ),
                  color: Colors.blue,
                  onPressed: links == null
                      ? () {
                          Modular.to.pushNamed('/add_contatos',
                              arguments: infosGerais.usuarioId);
                        }
                      : () {
                          var servico = controller.servicoUser.value;
                          SocialLink socialLink = new SocialLink(
                              whatsapp: servico.socialLinks.whatsapp,
                              instagram: servico.socialLinks.instagram,
                              email: servico.socialLinks.email,
                              telefone: servico.socialLinks.telefone,
                              socialId: servico.socialLinks.socialId);
                          Modular.to.pushNamed('/edit_contatos',
                              arguments: socialLink);
                        },
                ),
                Container(
                  width: size.width * 0.8,
                  child: TextWidget(
                    text:
                        'Os cliente so vêem seus contatos que foram preenchidos',
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

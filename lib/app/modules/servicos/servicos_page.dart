import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/servicos/base_service_profile.dart';
import 'package:net_cliente/app/shared/utils/lists/list_bairros.dart';
import 'package:net_cliente/app/shared/utils/lists/list_servicos.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_search_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'servicos_controller.dart';

class ServicosPage extends StatefulWidget {
  final String title;
  const ServicosPage({Key key, this.title = "Servicos"}) : super(key: key);

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

          if (controller.servicosSearchModel.usuario.isEmpty) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            left: 40,
                            right: 20,
                          ),
                          child: TextWidget(
                            text: 'Pesquise por nome',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 0,
                        left: 4,
                        right: 4,
                      ),
                      margin: EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Cores.verdeClaro),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: size.width * 0.8,
                      child: TextFieldWidget(
                        textEditingController: controller.pesquisaController,
                        hintText: 'Pintor, Nutricionista, Cantor, Eletricista',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            left: 40,
                            right: 20,
                          ),
                          child: TextWidget(
                            text: 'Pesquise por categoria',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Observer(
                        builder: (_) => DropdownButtonHideUnderline(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Cores.verdeClaro,
                            ),
                            child: DropdownButton<int>(
                              value: controller.categoria,
                              isExpanded: true,
                              icon: Icon(
                                CupertinoIcons.list_bullet,
                                color: Colors.white,
                              ),
                              dropdownColor: Cores.verdeClaro,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              hint: TextWidget(
                                text: 'Pesquise por categoria',
                              ),
                              items: listServicos,
                              onChanged: controller.selectCategoria,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            left: 40,
                            right: 20,
                          ),
                          child: TextWidget(
                            text: 'Pesquise por bairro',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Observer(
                        builder: (_) => DropdownButtonHideUnderline(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Cores.verdeClaro,
                            ),
                            child: DropdownButton<int>(
                              value: controller.bairro,
                              isExpanded: true,
                              icon: Icon(
                                CupertinoIcons.list_bullet,
                                color: Colors.white,
                              ),
                              dropdownColor: Cores.verdeClaro,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              hint: TextWidget(
                                text: 'Pesquise por bairro',
                              ),
                              items: listBairros,
                              onChanged: controller.selectBairro,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Observer(
                      builder: (_) => FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.white)
                            ),
                        child: TextWidget(
                          text: 'Pesquisar',
                          textColor: Colors.white,
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          controller.getServicosParams();
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    TextWidget(
                      text: 'Nenhum resultado encontrado para:',
                      fontSize: 16,
                      textColor: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Row(
                        children: [
                          TextWidget(
                            text: 'Categoria: ${controller.categoriaText}',
                            fontSize: 16,
                            textColor: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Row(
                        children: [
                          TextWidget(
                            text: 'Bairro: ${controller.bairroText}',
                            fontSize: 16,
                            textColor: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    controller.pesquisaController.text == null ||
                            controller.pesquisaController.text == ''
                        ? SizedBox()
                        : Container(
                            width: size.width * 0.8,
                            child: Row(
                              children: [
                                TextWidget(
                                  text:
                                      'Nome: ${controller.pesquisaController.text}',
                                  fontSize: 16,
                                  textColor: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            );
          }

          ServicosSearchModel servicos = controller.servicosSearchModel;

          return SingleChildScrollView(
            child: Align(
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: TextWidget(
                        text: 'Pesquise por nome',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.grey,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 0,
                        left: 4,
                        right: 4,
                      ),
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Cores.verdeClaro),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: size.width * 0.6,
                      child: TextFieldWidget(
                        textEditingController: controller.pesquisaController,
                        hintText: 'Pintor, Nutricionista, Cantor, Eletricista',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: TextWidget(
                        text: 'Pesquise por categoria',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Observer(
                        builder: (_) => DropdownButtonHideUnderline(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Cores.verdeClaro,
                            ),
                            child: DropdownButton<int>(
                              value: controller.categoria,
                              isExpanded: true,
                              icon: Icon(
                                CupertinoIcons.list_bullet,
                                color: Colors.white,
                              ),
                              dropdownColor: Cores.verdeClaro,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              hint: TextWidget(
                                text: 'Pesquise por categoria',
                              ),
                              items: listServicos,
                              onChanged: controller.selectCategoria,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      child: TextWidget(
                        text: 'Pesquise por bairro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Observer(
                        builder: (_) => DropdownButtonHideUnderline(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Cores.verdeClaro,
                            ),
                            child: DropdownButton<int>(
                              value: controller.bairro,
                              isExpanded: true,
                              icon: Icon(
                                CupertinoIcons.list_bullet,
                                color: Colors.white,
                              ),
                              dropdownColor: Cores.verdeClaro,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              hint: TextWidget(
                                text: 'Pesquise por bairro',
                              ),
                              items: listBairros,
                              onChanged: controller.selectBairro,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: size.width * 0.25,
                        right: size.width * 0.25,
                      ),
                      child: Observer(
                        builder:(_) => FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.white)
                          ),
                          child: TextWidget(
                            text: 'Pesquisar',
                            textColor: Colors.white,
                          ),
                          onPressed: () {
                            controller.getServicosParams();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.9,
                          child: ListView.separated(
                            physics: ScrollPhysics(),
                            itemCount: servicos.usuario.length,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: size.height * 0.04,
                              );
                            },
                            itemBuilder: (context, index) {
                              var servico = servicos.usuario[index];
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
                              return GestureDetector(
                                onTap: () {
                                  BaseServiceProfile base =
                                      new BaseServiceProfile(
                                    servico.servicoGeral.usuarioId,
                                    servico.servicoGeral.servicoNome,
                                  );
                                  Modular.to.pushNamed(
                                    '/servicos/servico_profile',
                                    arguments: base,
                                  );
                                },
                                child: Card(
                                  elevation: 3,
                                  child: Container(
                                    height: size.height * 0.11,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Cores.verdeClaro,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.transparent,
                                                    width: 0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    bottomLeft:
                                                        Radius.circular(4),
                                                  ),
                                                  image: DecorationImage(
                                                    image: servico.servicoGeral
                                                                    .servicoFotoPerfil ==
                                                                null ||
                                                            servico.servicoGeral
                                                                    .servicoFotoPerfil ==
                                                                ''
                                                        ? AssetImage(
                                                            'assets/images/imagens-perfil/profile.png',
                                                          )
                                                        : CachedNetworkImageProvider(
                                                            servico.servicoGeral
                                                                .servicoFotoPerfil,
                                                          ),
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: TextWidget(
                                                      text: servico.servicoGeral
                                                          .servicoNome,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textColor: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: TextWidget(
                                                      text: categoria == null
                                                          ? ''
                                                          : categoria,
                                                      fontSize: 18,
                                                      textColor: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ), 
                                  ),
                                ),
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

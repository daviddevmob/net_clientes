import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/utils/lists/list_bairros.dart';
import 'package:net_cliente/app/shared/utils/lists/list_servicos.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_search_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
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
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width * 0.8,
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextWidget(
                      text: 'Ops! Nenhum prestador de serviço encontrado neste filtro.',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
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
                            color: Cores.verde,
                          ),
                          child: DropdownButton<int>(
                            value: controller.categoria,
                            isExpanded: true,
                            icon: Icon(
                              CupertinoIcons.list_bullet,
                              color: Colors.white,
                            ),
                            dropdownColor: Cores.verde,
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
                      height: size.height * 0.02,
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
                              color: Cores.verde,
                            ),
                            child: DropdownButton<int>(
                              value: controller.bairro,
                              isExpanded: true,
                              icon: Icon(
                                CupertinoIcons.list_bullet,
                                color: Colors.white,
                              ),
                              dropdownColor: Cores.verde,
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
                ],
              ),
            );
          }

          ServicosSearchModel servicos = controller.servicosSearchModel;

          return SingleChildScrollView(
            child: Align(
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                height: size.height,
                child: ListView(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
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
                              color: Cores.verde,
                            ),
                            child: DropdownButton<int>(
                              value: controller.categoria,
                              isExpanded: true,
                              icon: Icon(
                                CupertinoIcons.list_bullet,
                                color: Colors.white,
                              ),
                              dropdownColor: Cores.verde,
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
                              color: Cores.verde,
                            ),
                            child: DropdownButton<int>(
                              value: controller.bairro,
                              isExpanded: true,
                              icon: Icon(
                                CupertinoIcons.list_bullet,
                                color: Colors.white,
                              ),
                              dropdownColor: Cores.verde,
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
                              var bairro; 
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
                              return Container(
                                height: size.height * 0.11,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Cores.verdeClaro,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: ListTile(
                                  tileColor: Cores.verdeClaro,
                                  leading: Container(
                                    height: 200,
                                    width: 70,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey[200],
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                          image: 
                                          servico.servicoGeral.servicoFotoPerfil ==
                                            null ||
                                          servico.servicoGeral
                                            .servicoFotoPerfil == ''
                                            ? AssetImage(
                                                'assets/images/imagens-perfil/profile.png',
                                              )
                                            : CachedNetworkImageProvider(
                                                servico.servicoGeral
                                                    .servicoFotoPerfil,
                                              ),
                                          fit: BoxFit.cover,
                                        )
                                      ),
                                    ),
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                      children: [
                                      TextWidget(
                                        text:servico.servicoGeral.servicoNome,
                                        fontWeight: FontWeight.w400,
                                        textColor: Colors.white,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text: categoria,
                                            fontSize: 18,
                                            textColor: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {

                                  },
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

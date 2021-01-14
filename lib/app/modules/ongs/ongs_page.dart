import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_search_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/lists/list_bairros.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'ongs_controller.dart';

class OngsPage extends StatefulWidget {
  final String title;
  const OngsPage({Key key, this.title = "Ongs"}) : super(key: key);

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
                    text:
                        'Ops! Nenhum projeto social ou ong encontrado neste bairro.',
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
                          onChanged: controller.setBairro,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        OngSearchModel ong = controller.ong;

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
                            onChanged: controller.setBairro,
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
                            return GestureDetector(
                              onTap: () {
                                    Modular.to.pushNamed(
                                      '/ongs/ong_profile',
                                      arguments: ong.usuario[index]
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
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    bottomLeft: Radius.circular(4),
                                                  ),
                                                image: DecorationImage(
                                                  image: 
                                                  user.ongGeral.ongImagemPerfil == null ||
                                                    user.ongGeral.ongImagemPerfil == ''
                                                ? AssetImage(
                                                    'assets/images/imagens-perfil/profile.png',
                                                  )
                                                : CachedNetworkImageProvider(
                                                    user.ongGeral.ongImagemPerfil,
                                                  ),
                                                  fit: BoxFit.cover,
                                                )
                                              ),
                                            ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.03,
                                      ),
                                      Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextWidget(
                                                  text: user.ongGeral.ongNome,
                                                  fontWeight: FontWeight.w400,
                                                  textColor: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextWidget(
                                                  text: bairro == null ? '' : bairro,
                                                  fontSize: 18,
                                                  textColor: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                    ),
                                      )
                                    ],
                                  ),/* ListTile(
                                    tileColor: Cores.verdeClaro,
                                        leading: Container(
                                          height: 200,
                                          width: 70,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey[200],
                                              ),
                                              borderRadius: BorderRadius.circular(2),
                                              image: DecorationImage(
                                                image: 
                                                user.ongGeral.ongImagemPerfil == null ||
                                                  user.ongGeral.ongImagemPerfil == ''
                                              ? AssetImage(
                                                  'assets/images/imagens-perfil/profile.png',
                                                )
                                              : CachedNetworkImageProvider(
                                                  user.ongGeral.ongImagemPerfil,
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
                                            Expanded(
                                              child: TextWidget(
                                                text: user.ongGeral.ongNome,
                                                fontWeight: FontWeight.w400,
                                                textColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextWidget(
                                                text: bairro == null ? 'teste' : bairro,
                                                fontSize: 18,
                                                textColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Modular.to.pushNamed(
                                        '/ongs/ong_profile',
                                        arguments: ong.usuario[index]
                                        );
                                    },
                                  ) */
                                ),
                              ),
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

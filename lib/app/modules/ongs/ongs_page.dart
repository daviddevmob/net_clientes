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
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: size.height * 0.04,
                            );
                          },
                          itemBuilder: (context, index) {
                            var user = ong.usuario[index];

                            return ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    user.ongGeral.ongImagemPerfil == null ||
                                            user.ongGeral.ongImagemPerfil == ''
                                        ? AssetImage(
                                            'assets/images/imagens-perfil/profile.png',
                                          )
                                        : CachedNetworkImageProvider(
                                            user.ongGeral.ongImagemPerfil,
                                          ),
                              ),
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextWidget(
                                          text: user.ongGeral.ongNome,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextWidget(
                                          text: user.ongGeral.ongDescricao,
                                          fontSize: 18,
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
    );
  }
}

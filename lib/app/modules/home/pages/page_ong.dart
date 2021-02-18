import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/home/dialogs.dart';
import 'package:net_cliente/app/modules/home/home_controller.dart';
import 'package:net_cliente/app/modules/home/widgets/card_profile.dart';
import 'package:net_cliente/app/modules/home/widgets/perfil_card_profile.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class PageOngHomeWidget extends StatelessWidget {
  final HomeController controller;

  const PageOngHomeWidget({Key key,@required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Observer(builder: (_) {
                  if (controller.enderecoCliente.data == null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width * 0.45,
                          child: FlatButton(
                            color: Cores.azul,
                            onPressed: () async {
                                Modular.to.pushNamed(
                                '/home/configuracoes/enderecos/',
                                arguments: controller.cliente.value,
                              ); 
                            },
                            child: TextWidget(
                              text: 'Selecione um endereço',
                              textColor: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      Container(
                        height: 95,
                        child: PerfilCardProfile(
                          title: 'Meu Perfil',
                          icon: CupertinoIcons.person,
                          function: () {
                              Modular.to.pushNamed(
                                '/home/configuracoes',
                                arguments: controller.cliente.value,
                              );
                            },
                        ),
                      ),
                      ],
                    );
                  }

                  // ignore: unrelated_type_equality_checks
                  if (controller.enderecoCliente.isEmpty == true) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width * 0.45,
                          child: FlatButton(
                            color: Cores.azul,
                            onPressed: () async {
                                Modular.to.pushNamed(
                                '/home/configuracoes/enderecos/',
                                arguments: controller.cliente.value,
                              ); 
                            },
                            child: TextWidget(
                              text: 'Selecione um endereço',
                              textColor: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      Container(
                        height: 95,
                        child: PerfilCardProfile(
                          title: 'Meu Perfil',
                          icon: CupertinoIcons.person,
                          function: () {
                              Modular.to.pushNamed(
                                '/home/configuracoes',
                                arguments: controller.cliente.value,
                              );
                            },
                        ),
                      ),
                      ],
                    );
                  }
                  if (controller.enderecoCliente.hasError == true) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width * 0.45,
                          child: FlatButton(
                            color: Cores.azul,
                            onPressed: () async {
                                Modular.to.pushNamed(
                                '/home/configuracoes/enderecos/',
                                arguments: controller.cliente.value,
                              ); 
                            },
                            child: TextWidget(
                              text: 'Selecione um endereço',
                              textColor: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      Container(
                        height: 95,
                        child: PerfilCardProfile(
                          title: 'Meu Perfil',
                          icon: CupertinoIcons.person,
                          function: () {
                              Modular.to.pushNamed(
                                '/home/configuracoes',
                                arguments: controller.cliente.value,
                              );
                            },
                        ),
                      ),
                      ],
                    );
                  }
                  EnderecoClienteHome eClienteHome =
                      controller.enderecoCliente.value;
                  String bairro = SwitchsUtils().getBairro(eClienteHome.bairro);
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed(
                            '/home/configuracoes/enderecos/',
                            arguments: controller.cliente.value,
                          );
                        },
                        child: Card(
                          elevation: 1,
                          child: Container(
                            width: size.width * 0.55,
                            height: 88,
                            margin: EdgeInsets.only(
                              right: 0,
                            ),
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 0,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: size.width * 0.4,
                                      child: TextWidget(
                                        text: 'Endereço selecionado',
                                        fontSize: 12,
                                        textColor: Cores.verdeClaro,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: size.width * 0.5,
                                      child: TextWidget(
                                          text: eClienteHome.endereco,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    ),
                             
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextWidget(
                                        text: bairro,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 95,
                        child: PerfilCardProfile(
                          title: 'Meu Perfil',
                          icon: CupertinoIcons.person,
                          function: () {
                              Modular.to.pushNamed(
                                '/home/configuracoes',
                                arguments: controller.cliente.value,
                              );
                            },
                        ),
                      ),
                    ],
                  );
                }),

               

                //RESTAURANTES
               /*  Row(
                  children: [
                    TextWidget(
                      text: 'Projetos Sociais',
                      fontSize: 16,
                    ),
                    SizedBox(
                      width: size.width * 0.025,
                    ),
                    GestureDetector(
                      onTap: () {
                        return infoGeralDialog(context, 'Projetos Sociais',
                            'Tem mais do que precisa? Colabore com movimentos sociais eusebienses, ajude pessoas e animais.');
                      },
                      child: Icon(
                        CupertinoIcons.info_circle,
                        size: 16,
                      ),
                    ),
                  ],
                ), */
                Container(
                  width: size.width,
                  margin: EdgeInsets.only(
                   right: 10, 
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CardsWidget(
                        title: 'Conhecer',
                        path: 'assets/images/home/social/procurar.svg',
                        function: () {
                          Modular.to.pushNamed(
                            '/ongs',
                            arguments: controller.cliente.value.clienteId,
                            );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CardsWidget(
                        title: 'Favoritos',
                        path: 'assets/images/home/social/favoritos.svg',
                        function: () {
                          Modular.to.pushNamed(
                            '/home/ongs_favoritas/',
                            arguments: controller.cliente.value.clienteId,
                            );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
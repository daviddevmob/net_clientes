import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/home/dialogs.dart';
import 'package:net_cliente/app/modules/home/widgets/att_dados_cliente.dart';
import 'package:net_cliente/app/modules/home/widgets/card_profile.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';
import 'package:net_cliente/app/shared/models/loja/lojas_search.dart';
import 'package:net_cliente/app/shared/repositories/push_cliente/push_cliente_repository.dart';
import 'package:net_cliente/app/shared/repositories/push_negocio/push_negocio_repository.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({Key key, @required this.email}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getCliente(widget.email);
      Future.delayed(Duration(seconds: 2)).then((value) async {
        PushClienteRepository()
            .initStatePushCliente(controller.cliente.value.firebaseId);
        PushNegocioRepository()
            .initStatePushNegocio(controller.cliente.value.firebaseId);
      });
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
          title: 'No Eusébio Tem!',
          viewLeading: false,
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.person_fill),
              onPressed: () {
                Modular.to.pushNamed(
                  '/home/configuracoes',
                  arguments: controller.cliente.value,
                );
              },
            )
          ],
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.cliente.hasError == true) {
          return Center(
            child: TextWidget(
              text: controller.cliente.error.toString(),
            ),
          );
        }

        // ignore: unrelated_type_equality_checks
        if (controller.cliente.isEmpty == true) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (controller.cliente.data == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (controller.cliente.value.status == false) {
          return Center(
            child: TextWidget(
              text: 'Usuário Bloqueado',
            ),
          );
        }

        if (controller.cliente.value.cpf == null &&
            controller.cliente.value.whatsapp == null) {
          return AttDadosClienteHome(
              controller: controller,
          );
        }

        controller.getEnderecoCliente();

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
                    return FlatButton(
                      color: Cores.azul,
                      onPressed: () {
                        Modular.to.pushNamed(
                          '/home/configuracoes/enderecos/',
                          arguments: controller.cliente.value,
                        );
                      },
                      child: TextWidget(
                        text: 'Selecione um endereço',
                        textColor: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }

                  // ignore: unrelated_type_equality_checks
                  if (controller.enderecoCliente.isEmpty == true) {
                    return FlatButton(
                      color: Cores.azul,
                      onPressed: () {
                        Modular.to.pushNamed(
                          '/home/configuracoes/enderecos/',
                          arguments: controller.cliente.value,
                        );
                      },
                      child: TextWidget(
                        text: 'Selecione um endereço',
                        textColor: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }
                  if (controller.enderecoCliente.hasError == true) {
                    return FlatButton(
                      color: Cores.azul,
                      onPressed: () {
                        Modular.to.pushNamed(
                          '/home/configuracoes/enderecos/',
                          arguments: controller.cliente.value,
                        );
                      },
                      child: TextWidget(
                        text: 'Selecione um endereço',
                        textColor: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }
                  EnderecoClienteHome eClienteHome =
                      controller.enderecoCliente.value;
                  String bairro = SwitchsUtils().getBairro(eClienteHome.bairro);
                  return GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed(
                        '/home/configuracoes/enderecos/',
                        arguments: controller.cliente.value,
                      );
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 10,
                        ),
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextWidget(
                                  text: 'Endereço selecionado',
                                  fontSize: 16,
                                  textColor: Cores.verdeClaro,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextWidget(
                                    text: eClienteHome.endereco,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextWidget(
                                    text: bairro,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
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

                SizedBox(
                  height: size.height * 0.04,
                ),

                //RESTAURANTES
                Row(
                  children: [
                    TextWidget(
                      text: 'Restaurantes',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      width: size.width * 0.025,
                    ),
                    GestureDetector(
                      onTap: () {
                        return infoGeralDialog(context, 'Restaurantes',
                            'Encontre os melhores restaurantes de Eusébio, faça o pedido pelo app e acompanhe a entrega em tempo real.');
                      },
                      child: Icon(
                        CupertinoIcons.info_circle,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.15,
                  padding: EdgeInsets.zero,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardsWidget(
                        title: 'Pedir Comida',
                        icon: CupertinoIcons.home,
                        function: () {},
                      ),
                      CardsWidget(
                        title: 'Meus Pedidos',
                        icon: CupertinoIcons.bag,
                        function: () {},
                      ),
                      CardsWidget(
                        title: 'Favoritos',
                        icon: CupertinoIcons.star,
                        function: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //LOJAS
                Row(
                  children: [
                    TextWidget(
                      text: 'Lojas',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      width: size.width * 0.025,
                    ),
                    GestureDetector(
                      onTap: () {
                        return infoGeralDialog(context, 'Lojas',
                            'Precisando comprar algo? Encontre as melhores lojas físicas e virtuais que estão em Eusébio.');
                      },
                      child: Icon(
                        CupertinoIcons.info_circle,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.15,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardsWidget(
                        title: 'Comprar',
                        icon: CupertinoIcons.cart,
                        function: () async {
                          if (await ConnectionVerify.connectionStatus()) {
                            if (controller.cliente.value.enderecoId == null) {
                              return selecionarEndereco(
                                context,
                                controller,
                              );
                            } else {
                              LojasSearch lojasSearch = new LojasSearch(
                                controller.cliente.value,
                                controller.enderecoCliente.value,
                              );
                              Modular.to.pushNamed(
                                '/lojas',
                                arguments: lojasSearch,
                              );
                            }
                          } else {
                            return InternetFlushBar()
                                .showFlushBarInternet(context);
                          }
                        },
                      ),
                      CardsWidget(
                        title: 'Meus Pedidos',
                        icon: CupertinoIcons.cube_box,
                        function: () async {
                          Modular.to.pushNamed(
                            '/home/pedidos_loja/',
                            arguments: controller.cliente.value.clienteId,
                          );
                        },
                      ),
                      CardsWidget(
                          title: 'Favoritas',
                          icon: CupertinoIcons.star,
                          function: () async {
                            if (await ConnectionVerify.connectionStatus()) {
                              if (controller.cliente.value.enderecoId == null) {
                              return selecionarEndereco(
                                context,
                                controller,
                              );
                            } else{
                                LojasSearch lojasSearch = new LojasSearch(
                                controller.cliente.value,
                                controller.enderecoCliente.value,
                              );
                              Modular.to.pushNamed(
                                '/home/lojas_favoritas/',
                                arguments: lojasSearch,
                              );
                              }
                            } else {
                              return InternetFlushBar()
                                  .showFlushBarInternet(context);
                            }
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //PRESTADORES DE SERVIÇO
                Row(
                  children: [
                    TextWidget(
                      text: 'Prestadores de Serviço',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
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
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.15,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardsWidget(
                        title: 'Procurar',
                        icon: CupertinoIcons.search,
                        function: () {
                          Modular.to.pushNamed('/servicos');
                        },
                      ),
                      CardsWidget(
                        title: 'Favoritos',
                        icon: CupertinoIcons.star,
                        function: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //PROJETOS SOCIAIS
                Row(
                  children: [
                    TextWidget(
                      text: 'Projetos Sociais',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
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
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.15,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardsWidget(
                        title: 'Conhecer',
                        icon: CupertinoIcons.heart,
                        function: () {
                          Modular.to.pushNamed('/ongs');
                        },
                      ),
                      CardsWidget(
                        title: 'Favoritos',
                        icon: CupertinoIcons.star,
                        function: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: TotemCeWidget(),
    );
  }
}

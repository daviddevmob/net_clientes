import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/home/configuracoes/widgets/button_configs.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'configuracoes_controller.dart';

class ConfiguracoesPage extends StatefulWidget {
  final ClienteModel clienteModel;
  const ConfiguracoesPage({Key key, @required this.clienteModel})
      : super(key: key);

  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState
    extends ModularState<ConfiguracoesPage, ConfiguracoesController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getCliente(widget.clienteModel.email);
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
          title: 'Configurações do Perfil',
          viewLeading: true,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.cliente.hasError) {
            return Center(
              child: TextWidget(
                text: 'Erro',
              ),
            );
          }

          // ignore: unrelated_type_equality_checks
          if (controller.cliente.isEmpty == true) {
            return Center(
              child: TextWidget(
                text: 'Nenhum cliente encontrado',
              ),
            );
          }

          if (controller.cliente.data == null) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          ClienteModel cliente = controller.cliente.value;

          return SingleChildScrollView(
            child: Container(
                height: size.height,
                width: size.width,
                child: Align(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Observer(
                        builder: (_) => Container(
                          child: controller.testeImagem == true
                              ? CupertinoActivityIndicator()
                              : Positioned(
                                  top: size.height * 0.0552,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (cliente.fotoPerfil == null ||
                                          cliente.fotoPerfil == '') {
                                        print('sem foto');
                                      } else {
                                        Modular.to.pushNamed(
                                          '/home/view_photo_profile',
                                          arguments: cliente.fotoPerfil,
                                        );
                                      }
                                    },
                                    child: Card(
                                        elevation: 5,
                                        child: Container(
                                        height: size.height * 0.2,
                                        width: size.width * 0.4,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey[200],
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                          image: DecorationImage(
                                            image: cliente.fotoPerfil ==
                                                    null ||
                                                cliente.fotoPerfil == ''
                                            ? AssetImage(
                                                'assets/images/imagens-perfil/profile.png')
                                            : CachedNetworkImageProvider(
                                                cliente.fotoPerfil,
                                                ),
                                            fit: BoxFit.cover
                                          )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.2301,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: IconButton(
                            icon: Icon(
                              CupertinoIcons.camera_fill,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              controller.updateImageProfile();
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220,
                        child: Column(
                          children: [
                            TextWidget(
                              text: cliente.nome,
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            ButtonConfigsWidget(
                              function: () {
                                Modular.to.pushNamed(
                                  '/home/configuracoes/enderecos',
                                  arguments: cliente,
                                );
                              },
                              text: 'Meus Endereços',
                              icon: CupertinoIcons.map,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            ButtonConfigsWidget(
                              function: () {
                                Modular.to.pushNamed(
                                  '/home/configuracoes/edit_cadastro',
                                  arguments: cliente,
                                );
                              },
                              text: 'Editar Cadastro',
                              icon: CupertinoIcons.person,
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            ButtonConfigsWidget(
                              function: () {},
                              text: 'Suporte',
                              icon: CupertinoIcons.hand_raised,
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            ButtonConfigsWidget(
                              function: () {},
                              text: 'Termos de Uso',
                              icon: CupertinoIcons.hand_raised,
                            ),
                            SizedBox(
                              height: size.height * 0.15,
                            ),
                            ButtonConfigsWidget(
                              function: () {
                                controller.sairConta();
                              },
                              text: 'Sair da Conta',
                              icon: Icons.exit_to_app,
                              colorTile: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}

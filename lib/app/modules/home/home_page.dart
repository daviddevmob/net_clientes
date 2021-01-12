import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/home/widgets/opcoes_widget.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
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
              icon: Icon(CupertinoIcons.gear_solid),
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
              text: 'Erro',
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

        ClienteModel cliente = controller.cliente.value;
        var nome = cliente.nome.split(' ').first;

        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OpcoesHomeWidget(
                      imagePath: 'assets/images/home/servicos.png',
                      title: 'Prestadores de Serviços',
                      descricao:
                          'Encontre pessoas e empresas eusebienses que prestam serviço em reforma, transporte, saúde, beleza, informática, turismo, eventos, festas, comidas por encomenda e etc.',
                      function: () {
                        Modular.to.pushNamed('/servicos');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OpcoesHomeWidget(
                      imagePath: 'assets/images/home/ongs.png',
                      title: 'Ongs e Projetos Sociais',
                      descricao:
                          'Tem mais do que precisa? Colabore com movimentos sociais eusebienses, ajude pessoas e animais.',
                      function: () {
                        Modular.to.pushNamed('/ongs');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OpcoesHomeWidget(
                      imagePath: 'assets/images/home/restaurantes-cinza.png',
                      title: 'Restaurantes',
                      descricao:
                          'Encontre os melhores restaurantes de Eusébio, faça o pedido pelo app e acompanhe a entrega em tempo real.',
                      function: () {
                        /* Modular.to.pushNamed('/restaurantes'); */
                        print('aviso restaurante');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OpcoesHomeWidget(
                      imagePath: 'assets/images/home/lojas-cinza.png',
                      title: 'Lojas',
                      descricao:
                          'Precisando comprar algo? Encontre as melhores lojas físicas e virtuais que estão em Eusébio.',
                      function: () {
                        /*  Modular.to.pushNamed('/lojas'); */
                        print('aviso loja');
                      },
                    ),
                  ],
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

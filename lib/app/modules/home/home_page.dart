import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/home/dialogs.dart';
import 'package:net_cliente/app/modules/home/pages/page_loja.dart';
import 'package:net_cliente/app/modules/home/pages/page_ong.dart';
import 'package:net_cliente/app/modules/home/pages/page_rest.dart';
import 'package:net_cliente/app/modules/home/pages/page_servico.dart';
import 'package:net_cliente/app/modules/home/widgets/att_dados_cliente.dart';
import 'package:net_cliente/app/modules/home/widgets/card_profile.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_home.dart';
import 'package:net_cliente/app/shared/models/loja/lojas_search.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/totem_bottom_bar.dart';
import 'home_controller.dart';
import 'package:net_cliente/app/shared/models/rest/rest_search_list_page_model.dart';

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
      /* appBar: PreferredSize(
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
      ), */
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


        return Container(
          child: Observer(
            builder: (_){
              //REST
              if(controller.index == 0){
                return PageRestHomeWidget(
                  controller: controller,
                );
              }

              //LOJA
              if(controller.index == 1){
                return PageLojaHomeWidget(
                  controller: controller,
                );
              }

              //SERVIÇOS
              if(controller.index == 2){
                return PageServicoHomeWidget(
                  controller: controller,
                );
              }

              //SOCIAL
              if(controller.index == 3){
                return PageOngHomeWidget(controller: controller,);
              }
            },
          ),
        );
      }),
      bottomNavigationBar: Observer(
        builder:(_) => BottomNavigationBar(
            backgroundColor: Cores.verdeClaro,
            selectedIconTheme: IconThemeData(
              color: Cores.verdeClaro,
              size: 26,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.black,
              size: 18,
            ),
            type: BottomNavigationBarType.shifting,
            unselectedLabelStyle:  null,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 8,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.house_alt,
                  ),
                label: 'Restaurantes',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.cart,
                  ),
                label: 'Lojas',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.hammer,
                  ),
                label: 'Serviços',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.heart,
                  ),
                label: 'Social',
              ),
            ],
            currentIndex: controller.index,
            selectedItemColor: Cores.verdeClaro,
            unselectedItemColor: Colors.black,
            onTap: controller.setIndexNavigator,
          ),
        ),
    );
  }
}

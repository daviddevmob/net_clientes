import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/ongs/ong_search_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'ong_profile_controller.dart';

class OngProfilePage extends StatefulWidget {
  final Usuario ongSearch;
  const OngProfilePage({Key key, @required this.ongSearch}) : super(key: key);

  @override
  _OngProfilePageState createState() => _OngProfilePageState();
}

class _OngProfilePageState
    extends ModularState<OngProfilePage, OngProfileController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getOng(widget.ongSearch.ongGeral.usuarioId.toInt());
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
          title: widget.ongSearch.ongGeral.ongNome,
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

        var ong = controller.ong.usuario[0];

        return SingleChildScrollView(
          child: Column(
            children: [
              TextWidget(text: ong.ongGeral.ongNome,)
            ],
          ),
        );
      }),
    );
  }
}

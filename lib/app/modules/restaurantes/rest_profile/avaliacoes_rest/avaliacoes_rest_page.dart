import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/rest/rest_avaliacao/rest_avaliacao_profile.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'avaliacoes_rest_controller.dart';

class AvaliacoesRestPage extends StatefulWidget {
  final int restId;
  const AvaliacoesRestPage({Key key,@required this.restId})
      : super(key: key);

  @override
  _AvaliacoesRestPageState createState() => _AvaliacoesRestPageState();
}

class _AvaliacoesRestPageState
    extends ModularState<AvaliacoesRestPage, AvaliacoesRestController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getAvaliacoesRest(widget.restId);
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
          viewLeading: true,
          title: 'Avaliações',
        ),
      ),
      body: Observer(builder: (_){
        if(controller.restAvaliacao.data == null){
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

        // ignore: unrelated_type_equality_checks
        if(controller.restAvaliacao.isEmpty == true){
          return Center(
            child: TextWidget(
              text: 'Sem avaliações',
              fontSize: 18,
              textColor: Colors.grey[500],
            ),
          );
        }

        RestAvaliacaoProfile avaliacao = controller.restAvaliacao.value;

        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                ListView.separated(
                  itemCount: avaliacao.restAvaliacao.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  separatorBuilder: (context, index){
                    return Divider(
                      color: Colors.transparent,
                    );
                  },
                  itemBuilder: (context, index){
                    var a = avaliacao.restAvaliacao[index];
                    return Card(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: a.cliente.nome,
                                  fontSize: 14,
                                ),
                                SizedBox(
                                  child: Wrap(
                                    children: [
                                      Icon(
                                        CupertinoIcons.star_fill,
                                        size: 14,
                                        color: Colors.orange,
                                        ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      TextWidget(
                                        text: a.nota.toStringAsFixed(2).replaceAll('.', ','),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        textColor: Colors.orange,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  text: formatDate(a.criadoEm.toLocal(), [dd, '/', mm, '/', yyyy]),
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: a.texto == "" || a.texto == null
                              ? SizedBox()
                              : Row(
                                children: [
                                  Container(
                                    width: size.width * 0.8,
                                    child: TextWidget(
                                      text: a.texto,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: a.restComentarioAvaliacao == null || a.restComentarioAvaliacao.text == ""
                              ? SizedBox()
                              : Row(
                                children: [
                                  Container(
                                    width: size.width * 0.8,
                                    child: TextWidget(
                                      text: 'Restaurante: ' + a.restComentarioAvaliacao.text,
                                      fontSize: 14,
                                      textColor: Colors.grey[500],
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );

      }),
    );
  }
}

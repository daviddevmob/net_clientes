import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/models/loja/loja_perfil_page_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class AvaliacaoPageLoja extends StatelessWidget {
  final List<LojaAvaliacao> avaliacaoes;

  const AvaliacaoPageLoja({Key key,@required this.avaliacaoes}) : super(key: key);
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
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                ListView.separated(
                  itemCount: avaliacaoes.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  separatorBuilder: (context, index){
                    return Divider(
                      color: Colors.transparent,
                    );
                  },
                  itemBuilder: (context, index){
                    var a = avaliacaoes[index];
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
                              child: a.lojaComentarioAvaliacao == null || a.lojaComentarioAvaliacao.texto == ""
                              ? SizedBox()
                              : Row(
                                children: [
                                  Container(
                                    width: size.width * 0.8,
                                    child: TextWidget(
                                      text: 'Restaurante: ' + a.lojaComentarioAvaliacao.texto,
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
      ),
    );
  }
}
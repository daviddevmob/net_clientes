import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:net_cliente/app/modules/servicos/servico_profile/servico_profile_controller.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';

class DialogsAvaliacaoServico {

  void editarAvaliacao(
    BuildContext context, 
    ServicoProfileController controller,
    int avaliacaoId,
    ) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
            child: Container(
              height: 350,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  RatingBar.builder(
                    initialRating: controller.editAvaliacao,
                    minRating: 0.5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                    CupertinoIcons.star_fill,
                    color: Colors.amber,
                      size: 14,
                    ),
                    onRatingUpdate: controller.setEditValue,
                    ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFieldWidget(
                    textEditingController: controller.editarTextAvaliacao,
                    labelText: 'Comentário',
                    hintText: 'Comentário',
                    maxLines: 2,
                  ),
              SizedBox(
                height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
              FlatButton(
                child: TextWidget(
                  text: 'Cancelar',
                  textColor: Colors.red,
                  fontSize: 16,
                ),
                onPressed: () async {
                  controller.editarTextAvaliacao.clear();
                  controller.editAvaliacao = null;
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                color: Cores.verdeClaro,
                child: TextWidget(
                  text: 'Salvar Avaliação',
                  fontSize: 16,
                  textColor: Colors.white,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  await controller.setEditAvaliacao(
                    avaliacaoId,
                    );
                },
              ),
                  ],
                ),
                ],
              )
            ),
          ));
  }

  void salvarAvaliacao(
    BuildContext context, 
    ServicoProfileController controller,
    int clienteId, 
    int servicoId,
    ) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
            child: Container(
              height: 350,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  RatingBar.builder(
                    initialRating: controller.novaAvaliacao,
                    minRating: 0.5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                    CupertinoIcons.star_fill,
                    color: Colors.amber,
                      size: 14,
                    ),
                    onRatingUpdate: controller.setNotaNova,
                    ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFieldWidget(
                    textEditingController: controller.novaTextAvaliacao,
                    labelText: 'Comentário',
                    hintText: 'Comentário',
                    maxLines: 2,
                  ),
              SizedBox(
                height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
              FlatButton(
                child: TextWidget(
                  text: 'Cancelar',
                  textColor: Colors.red,
                  fontSize: 16,
                ),
                onPressed: () async {
                  controller.novaAvaliacao = 5.0;
                  controller.novaTextAvaliacao.clear();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                color: Cores.verdeClaro,
                child: TextWidget(
                  text: 'Salvar Avaliação',
                  fontSize: 16,
                  textColor: Colors.white,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  await controller.addAvaliacao(
                    clienteId, 
                    servicoId,
                    );
                },
              ),
                  ],
                ),
                ],
              )
            ),
          ));
  }

}
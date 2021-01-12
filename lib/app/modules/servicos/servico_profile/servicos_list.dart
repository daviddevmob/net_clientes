import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/models/servicos/servico_model.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class MeusServicosWidget extends StatelessWidget {
  final ServicoList servicoList;

  const MeusServicosWidget({Key key, this.servicoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              CupertinoIcons.checkmark_square_fill,
              color: Colors.blue,
              ),
            SizedBox(width: size.width * 0.02,),
            Expanded(
                child: TextWidget(
                text: servicoList.servicoNome,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                textColor: Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.007,
        ),
        servicoList.servicoTempo == null || servicoList.servicoTempo == ''
            ? SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    CupertinoIcons.time,
                    ),
                  SizedBox(width: size.width * 0.02,),
                  Expanded(
                      child: TextWidget(
                      text: /* 'Tempo: ' +  */servicoList.servicoTempo,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
        SizedBox(
          height: size.height * 0.007,
        ),
        servicoList.servicoPreco == null || servicoList.servicoPreco == ''
            ? SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(CupertinoIcons.money_dollar),
                  SizedBox(width: size.width * 0.02,),
                  Expanded(
                      child: TextWidget(
                      text: /* 'Valor: ' +  */servicoList.servicoPreco,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
        Divider(
          color: Colors.transparent,
          height: size.height * 0.045,
        ),
      ],
    );
  }
}

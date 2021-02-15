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
              CupertinoIcons.circle_fill,
              color: Colors.blue,
              size: 16,
              ),
            SizedBox(width: size.width * 0.02,),
            Expanded(
                child: TextWidget(
                text: servicoList.servicoNome,
                fontSize: 16,
                fontWeight: FontWeight.w400,
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
                    size: 16,
                    ),
                  SizedBox(width: size.width * 0.02,),
                  Expanded(
                      child: TextWidget(
                      text: /* 'Tempo: ' +  */servicoList.servicoTempo,
                      fontSize: 16,
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
                  Icon(
                    CupertinoIcons.money_dollar,
                    size: 16,
                    ),
                  SizedBox(width: size.width * 0.02,),
                  Expanded(
                      child: TextWidget(
                      text: /* 'Valor: ' +  */servicoList.servicoPreco,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
        Divider(
          color: Colors.transparent,
          height: 25,
        ),
      ],
    );
  }
}

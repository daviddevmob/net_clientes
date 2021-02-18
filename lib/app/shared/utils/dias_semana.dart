import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class DiasSemanaWidget extends StatelessWidget {
  final String dia;
  final String horarioDia;
  final bool atividade;

  const DiasSemanaWidget({
    Key key, 
    this.dia, 
    this.horarioDia,
    this.atividade,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400]
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      width: size.width * 0.8,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                CupertinoIcons.calendar,
                color: atividade == true
                ? Colors.green
                : Colors.red,
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              TextWidget(
                text: dia,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                textColor: atividade == true
                ? Colors.green
                : Colors.red,
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                CupertinoIcons.clock,
                color: atividade == true
                ? Colors.green
                : Colors.red,
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              TextWidget(
                text: atividade == true 
                ? horarioDia
                : 'Não funciona',
                fontSize:atividade == true  
                ? 12
                : 12,
                fontWeight: FontWeight.w600,
                textColor: atividade == true
                ? Colors.green
                : Colors.red,
              )
            ],
          ),
        ],
      ),
    );
  }
}

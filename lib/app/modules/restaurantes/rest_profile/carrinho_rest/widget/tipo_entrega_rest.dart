import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/carrinho_rest/carrinho_rest_controller.dart';
import 'package:net_cliente/app/shared/models/rest/carrinho_rest_page_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class TipoEntregaRest extends StatelessWidget {
  final CarrinhoRestPageModel carrinho;
  final CarrinhoRestController controller;

  const TipoEntregaRest({Key key, this.carrinho, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
               Observer(
                 builder: (_){
                   if(carrinho.tipoEntrega == 1){
                     return Column(
                       children: [
                         Container(
                           margin: EdgeInsets.only(
                             left: 10,
                           ),
                           child: Row(
                             children: [
                               TextWidget(
                                 text: 'Tipo de Entrega',
                                 fontSize: 16,
                               ),
                             ],
                           ),
                         ),
                         Row(
                           children: [
                             Radio(
                               groupValue: controller.tipoEntrega,
                               value: true,
                               onChanged: controller.setTipoEntrega,
                               activeColor: Cores.verdeClaro,
                             ),
                             TextWidget(
                               text: 'Entrega em Domicílio (R\$ ${carrinho.taxaEntrega.toStringAsFixed(2)})',
                               fontSize: 16,
                             ),
                           ],
                         ),
                         Row(
                           children: [
                             Radio(
                               groupValue: controller.tipoEntrega,
                               value: false,
                               onChanged: controller.setTipoEntrega,
                               activeColor: Cores.verdeClaro,
                             ),
                             TextWidget(
                               text: 'Retirada em Restaurante',
                               fontSize: 16,
                             ),
                           ],
                         ),
                       ],
                     );
                   } else if(carrinho.tipoEntrega == 2){
                     return TextWidget(
                       text: 'Somente entrega em domicílio (R\$ ${carrinho.taxaEntrega.toStringAsFixed(2)})',
                       fontSize: 16,
                     );
                   } else if(carrinho.taxaEntrega == 3){
                     return TextWidget(
                       text: 'Somente retirada em loja',
                       fontSize: 16,
                     );
                   } else{
                     return TextWidget(
                       text: 'Restaurante não está em funcionamento',
                       fontSize: 16,
                     );
                   }
                 },
               );
  }
}
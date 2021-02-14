import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/localizacao_model.dart';
import 'package:net_cliente/app/shared/models/loja/carrinho_loja_page_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class TipoEntregaLojaWidget extends StatelessWidget {
  final CarrinhoLojaPageModel carrinho;

  const TipoEntregaLojaWidget({Key key, this.carrinho}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String bairro = SwitchsUtils().getBairro(
        carrinho.lojaProfileModule.lojaGeral.usuario.localizacao.bairro);
    return Observer(builder: (_) {
      if (carrinho.tipoEntrega == 1) {
        return Row(
          children: [
            Wrap(
              direction: Axis.vertical,
              children: [
                TextWidget(
                  text: 'Tipo de Entrega: ',
                  fontSize: 18,
                  textColor: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                
                         Row(
                           children: [
                             Radio(
                               groupValue: carrinho.controller.entregaDomicilio,
                               value: true,
                               onChanged: carrinho.controller.setEntregaDomicilio,
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
                               groupValue: carrinho.controller.entregaDomicilio,
                               value: false,
                               onChanged: carrinho.controller.setEntregaDomicilio,
                               activeColor: Cores.verdeClaro,
                             ),
                             TextWidget(
                               text: 'Retirada em Loja',
                               fontSize: 16,
                             ),
                           ],
                         ),
                /* Observer(
                  builder: (_) => DropdownButtonHideUnderline(
                    child: Container(
                      height: 35,
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Cores.verdeClaro,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<bool>(
                        value: carrinho.controller.entregaDomicilio,
                        iconEnabledColor: Colors.white,
                        items: [
                          DropdownMenuItem(
                            value: true,
                            child: TextWidget(
                              text: 'Entrega em Domicílio (' + 'R\$' + '${carrinho.taxaEntrega}'.replaceAll('.',',') + ')',
                              fontSize: 14,
                              textColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          DropdownMenuItem(
                            value: false,
                            child: TextWidget(
                              text: 'Retirar na Loja',
                              fontSize: 16,
                              textColor: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        dropdownColor: Cores.verdeClaro,
                        onChanged: carrinho.controller.setEntregaDomicilio,
                      ),
                    ),
                  ),
                ), */
              ],
            ),
          ],
        );
      } else if (carrinho.tipoEntrega == 2) {
        return Wrap(
          direction: Axis.vertical,
          children: [
            TextWidget(
              text: 'Tipo de Entrega: ',
              fontSize: 16,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: TextWidget(
                text: 'Disponível somente entrega em domicílio',
                fontSize: 16,
              ),
            )
          ],
        );
      } else if (carrinho.tipoEntrega == 3) {
        return Column(
          children: [
            Row(
              children: [
                TextWidget(
                  text: 'Tipo de Entrega: ',
                  fontSize: 16,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                TextWidget(
                  text: 'Disponível somente retirada em loja',
                  fontSize: 16,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
            children: [
            FlatButton(
              color: Cores.azul,
              onPressed: () {
              var loc = carrinho
                .lojaProfileModule.lojaGeral.usuario.localizacao;
              LocalizacaoModel localizacao = new LocalizacaoModel(
                complemento: '',
                endereco:'Localização da ${carrinho.lojaProfileModule.lojaGeral.lojaNome}',
                mapaLink: loc.mapaLink,
                    );
                    Modular.to.pushNamed('/maps_view', arguments: localizacao);
                  },
                  child: TextWidget(
                    text: 'Ver no Mapa',
                    fontSize: 14,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                TextWidget(
                  text: 'Bairro: $bairro',
                  fontSize: 14,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextWidget(
                    text: 'Você terá acesso a localização também na aba de Meus Pedidos de Loja',
                    fontSize: 14,
                    textColor: Colors.grey,
                  ),
                )
              ],
            ),
          ],
        );
      }

      return TextWidget(
        text: 'Loja não aceitando pedidos no momento :/',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        textColor: Colors.grey[400],
      );
    });
  }
}

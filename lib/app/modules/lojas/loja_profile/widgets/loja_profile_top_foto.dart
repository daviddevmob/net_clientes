import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/shared/models/loja/loja_perfil_page_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class LojaProfileInfosWidget extends StatelessWidget {
  final LojaPerfilPageModel loja;
  final double distancia;
  final String funcionamento;
  final bool aberto;

  const LojaProfileInfosWidget(
      {
        Key key, 
        this.loja, 
        this.distancia, 
        this.funcionamento, 
        this.aberto,
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        loja.fotoPerfilLink == null || loja.fotoPerfilLink == ''
            ? Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[400],
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Cores.verdeClaro),
              )
            : Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      loja.fotoPerfilLink,
                    ),
                  ),
                ),
              ),
        SizedBox(
          width: 10,
        ),
        Wrap(
          direction: Axis.vertical,
          children: [
            TextWidget(
              text: loja.lojaNome,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                TextWidget(
                  text: aberto == true ? 'Aberto ' : 'Fechado',
                  fontSize: 14,
                  textColor: aberto == true ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w400,
                ),
                TextWidget(
                  text: aberto == true ? ' - ' + funcionamento : '',
                  fontSize: 14,
                  textColor: aberto == true ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Observer(
              builder: (_) {
                if (loja.entregaDomicilio == true && loja.lojaFisica == true) {
                  return Expanded(
                    child: TextWidget(
                      text: 'Entrega e Retirada em Loja',
                      fontSize: 14,
                    ),
                  );
                } else if (loja.entregaDomicilio == true &&
                    loja.lojaFisica == false) {
                  return TextWidget(
                    text: 'Somente entrega em domicílio',
                    fontSize: 14,
                  );
                } else if (loja.entregaDomicilio == false &&
                    loja.lojaFisica == true) {
                  return TextWidget(
                    text: 'Somente retirada em loja',
                    fontSize: 14,
                  );
                }
              },
            ),
            loja.entregaDomicilio == true
                ? Wrap(
                    children: [
                      TextWidget(
                        text:
                            '${distancia.toStringAsPrecision(2).replaceAll('.', ',')} km',
                        fontSize: 14,
                      ),
                      TextWidget(
                        text: ' ● ',
                        fontSize: 14,
                        textColor: Colors.grey,
                      ),
                      TextWidget(
                        text:
                            'R\$ ${(distancia * loja.usuario.taxaEntrega.taxaEntrega).toStringAsPrecision(3).replaceAll('.', ',')}',
                        fontSize: 14,
                      )
                    ],
                  )
                : TextWidget(
                    text: '',
                  )
          ],
        ),
      ],
    );
  }
}

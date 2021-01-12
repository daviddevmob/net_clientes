import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class CardProfileWidget extends StatelessWidget {

  final ClienteModel cliente;

  const CardProfileWidget({Key key, this.cliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
                  margin:
                      EdgeInsets.only(left: 03, right: 03, top: 05, bottom: 20),
                  child: Card(
                    color: Cores.verdeClaro,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.gear_solid,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Modular.to.pushNamed(
                                '/home/configuracoes',
                                arguments: cliente,
                                );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 13,
                  left: 8,
                  child: GestureDetector(
                    onTap: () {
                      if (cliente.fotoPerfil == null ||
                          cliente.fotoPerfil == '') {
                        print('sem foto');
                      } else {
                        Modular.to.pushNamed(
                          '/home/view_photo_profile',
                          arguments: cliente.fotoPerfil,
                        );
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Cores.verdeClaro,
                          width: 3
                        ),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image:  cliente.fotoPerfil == null || cliente.fotoPerfil == ''
                                ? AssetImage(
                                    'assets/images/imagens-perfil/profile.png')
                                : CachedNetworkImageProvider(cliente.fotoPerfil)
                        )
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 100,
                  child: TextWidget(
                  text: cliente.nome.split(' ').first + ' ' + cliente.nome.split(' ')[1],
                  textColor: Colors.white,
                  fontWeight: FontWeight.w300,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 100,
                  child: TextWidget(
                  text: cliente.email,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  ),
                ),
      ],
    );
  }
}

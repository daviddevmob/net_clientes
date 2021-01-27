import 'package:connection_verify/connection_verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/home/configuracoes/enderecos/dialogs_endereco.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/models/endereco_cliente_model.dart';
import 'package:net_cliente/app/shared/models/localizacao_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';
import 'package:net_cliente/app/shared/utils/flushbar/internet_flushbar.dart';
import 'package:net_cliente/app/shared/utils/switchs_utils.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'enderecos_controller.dart';

class EnderecosPage extends StatefulWidget {
  final ClienteModel cliente;
  const EnderecosPage({Key key, @required this.cliente}) : super(key: key);

  @override
  _EnderecosPageState createState() => _EnderecosPageState();
}

class _EnderecosPageState
    extends ModularState<EnderecosPage, EnderecosController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
      await controller.getClienteEnderecos(widget.cliente.clienteId);
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
          title: 'Meus Endereços',
          viewLeading: true,
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.clienteEnderecos.data == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

        // ignore: unrelated_type_equality_checks
        if (controller.clienteEnderecos.isEmpty == true) {
          return Center(
            child: TextWidget(
              text: 'Você ainda não tem endereços cadastrados',
            ),
          );
        }

        List<EnderecoClienteModel> endereco = controller.clienteEnderecos.value;

        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              endereco.isEmpty == true 
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Insira seu primeiro endereço',
                    fontSize: 16,
                  ),
                ],
              )
              : Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: endereco.length,
                  itemBuilder: (context, index) {
                    var e = endereco[index];
                    String bairro = SwitchsUtils().getBairro(e.bairro);
                    bool selecionado = false;
                    if (e.enderecoId == widget.cliente.enderecoId) {
                      selecionado = true;
                    }
                    return Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: ListTile(
                        tileColor: selecionado == true
                            ? Cores.verdeClaro
                            : Colors.white,
                        onTap: () async {
                          if (selecionado == true) {
                            Modular.to.pop();
                          } else {
                            if (await ConnectionVerify.connectionStatus()) {
                              await controller.updateEnderecoPrincipal(
                                widget.cliente.clienteId,
                                e.enderecoId,
                              );
                              Modular.to.pop();
                            } else {
                              InternetFlushBar().showFlushBarInternet(context);
                            }
                          }
                        },
                        title: TextWidget(
                          text: e.endereco,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor:
                              selecionado == true ? Colors.white : Colors.black,
                        ),
                        subtitle: Wrap(
                          children: [
                            TextWidget(
                              text: bairro,
                              fontSize: 14,
                              textColor: selecionado == true
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            selecionado == true
                                ? Row(
                                    children: [
                                      TextWidget(
                                        text: 'Endereço Selecionado',
                                        fontSize: 14,
                                        textColor: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 10,
                                        ),
                                        child: TextWidget(
                                          text: 'Clique para selecionar',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          textColor: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        trailing: IconButton(
                            icon: Icon(
                              CupertinoIcons.ellipsis,
                              color: selecionado == true
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            onPressed: () {
                              return showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoActionSheet(
                                        title: TextWidget(
                                          text: 'Endereço',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          textColor: Colors.blue,
                                        ),
                                        actions: [
                                          CupertinoActionSheetAction(
                                            child: TextWidget(
                                              text: 'Ver no Mapa',
                                            ),
                                            onPressed: () {
                                              LocalizacaoModel localizacao =
                                                  new LocalizacaoModel(
                                                complemento: e.complemento,
                                                endereco: e.endereco,
                                                mapaLink: e.latlgn,
                                                localizacaoId: e.enderecoId,
                                              );
                                              Modular.to.pushNamed(
                                                '/maps_view/',
                                                arguments: localizacao,
                                              );
                                            },
                                          ),
                                          CupertinoActionSheetAction(
                                            child: TextWidget(
                                              text: 'Apagar Endereço',
                                              textColor: Colors.red,
                                            ),
                                            onPressed: () async {
                                              if (selecionado == true) {
                                                Navigator.pop(context);
                                                return AvisoFlushBar()
                                                    .showFlushBarAviso(
                                                  context,
                                                  'Endereço em Uso',
                                                  'Você não pode apagar um endereço em uso',
                                                );
                                              } else {
                                                if (await ConnectionVerify
                                                    .connectionStatus()) {
                                                  controller.deleteLocalizacao(
                                                      e.enderecoId);
                                                } else {
                                                  InternetFlushBar()
                                                      .showFlushBarInternet(
                                                          context);
                                                }
                                                Navigator.pop(context);
                                                return DialogsEndereco()
                                                    .deleteCategoria(
                                                  context,
                                                  controller,
                                                  e.enderecoId,
                                                );
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            }),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              FlatButton(
                color: Cores.verdeClaro,
                onPressed: () {
                  if (endereco.length >= 3) {
                    return AvisoFlushBar().showFlushBarAviso(
                      context,
                      'Limite de 3 Endereços',
                      "Você já chegou no limite de endereços. Apague um existente.",
                    );
                  } else {
                    EnderecoClienteModel endereco = new EnderecoClienteModel(
                        clienteId: widget.cliente.clienteId);
                    Modular.to.pushNamed(
                      '/maps',
                      arguments: endereco,
                    );
                  }
                },
                child: TextWidget(
                  text: 'Adicionar Endereço',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/produto_rest/model/opcao_escolhida.dart';
import 'package:net_cliente/app/shared/models/rest/produto_view/produto_view_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';
import 'package:net_cliente/app/shared/utils/text_field.dart';
import 'produto_rest_controller.dart';

class ProdutoRestPage extends StatefulWidget {
  final ProdutoRestViewModel produto;
  const ProdutoRestPage({Key key, @required this.produto})
      : super(key: key);

  @override
  _ProdutoRestPageState createState() => _ProdutoRestPageState();
}

class _ProdutoRestPageState
    extends ModularState<ProdutoRestPage, ProdutoRestController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  void initState() {
    disposer = autorun((_) async {
     await controller.getProdutoView(widget.produto.produtoId, widget.produto.categoriaId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: Observer(builder: (_) {

          if(controller.produto == null 
          || controller.produto.restProdutos == null){
            return SizedBox();
          }

          if (controller.produto != null) {
            return AppBarWidget(
              title: controller.produto.restProdutos[0].nome,
              viewLeading: true,
                  );
             }
            return SizedBox();
          }),
      ),
      body:  Observer(
        builder: (_){
          if(controller.produto.restProdutos == null
          || controller.produto == null ){
            return Center(child: CupertinoActivityIndicator(),);
          }
          if(controller.produto.restProdutos.isEmpty == true){
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if(controller.salvando == true){
            return Center(child: CupertinoActivityIndicator(),);
          }
          
          if(controller.produto.restProdutos.isNotEmpty){
          String aPartir;
          controller.existeOpcoes == true
          ? aPartir = 'a partir de'
          : aPartir = '';
           return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 300,
                    child: Observer(builder: (_) {
                      if (controller.produto.restProdutos[0].foto != null) {
                        return  GestureDetector(
                          onTap: (){
                            Modular.to.pushNamed(
                              '/rest_profile/view_produto/view_foto',
                              arguments: controller.produto.restProdutos[0].foto
                              );
                          },
                          child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                      controller.produto.restProdutos[0].foto,
                                    )))),
                        );
                      }
                  double preco = 
                  controller.produto.restProdutos[0].precoPromo != 0 
                  && controller.produto.restProdutos[0].precoPromo < controller.produto.restProdutos[0].preco
                    ? controller.produto.restProdutos[0].precoPromo
                    : controller.produto.restProdutos[0].preco;
                  return Container(
                    color: Cores.verdeClaro,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'Produto Sem Foto',
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextWidget(
                        text: controller.produto.restProdutos[0].nome,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextWidget(
                        text: controller.produto.restProdutos[0].descricao,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: controller.produto.restProdutos[0].precoPromo != 0 &&
                      controller.produto.restProdutos[0].precoPromo < controller.produto.restProdutos[0].preco
                  ? Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text:
                                    'De: R\$ ${controller.produto.restProdutos[0].preco.toStringAsFixed(2)}',
                                fontSize: 13,
                                textColor: Colors.grey[500],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text:
                                    'Por $aPartir  R\$ ${controller.produto.restProdutos[0].precoPromo.toStringAsFixed(2)}',
                                fontSize: 18,
                                textColor: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          TextWidget(
                            text:'$aPartir R\$ ${controller.produto.restProdutos[0].preco.toStringAsFixed(2)}',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
              ),
              SizedBox(
                height: 25,
              ),
              Observer(
                builder:(_) => Container(
                  child: controller.produto.restProdutos[0].restOpcaos.isEmpty == true
                ? SizedBox()
                : ListView.builder(
                  itemCount: controller.produto.restProdutos[0].restOpcaos.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index){
                    var op = controller.produto.restProdutos[0].restOpcaos[index];
                    return  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Stack(
                          children: [
                           Observer(
                              builder:(_) => TextWidget(
                                  text: '${op.opcaoNome}',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  textColor: Cores.verdeClaro,
                              ),
                           ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 20,
                                bottom: 20,
                              ),
                              child: ListView.builder(
                                itemCount: op.restOpcaoItems.length,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: (context, x){
                                  var i = op.restOpcaoItems[x];
                                  return Observer(
                                    builder:(_) {
                                      
                                      OpcaoEscolhida opAtual = OpcaoEscolhida(
                                        op.opcaoNome, 
                                        op.restOpcaoId, 
                                        i.itemNome, 
                                        i.itemPreco,
                                        i.restOpcaoItemId,
                                        );
                                        
                                      return Observer(
                                        builder:(_) {
                                         return Container(
                                           margin: EdgeInsets.symmetric(
                                             vertical: 5,
                                           ),
                                           child: Card(
                                              elevation: 0,
                                               child: ListTile(
                                                  tileColor: Colors.white,
                                                  title:Observer(
                                                    builder: (_){
                                                      if(controller.opcoesEscolhidas.where((element) => element.opItemId == i.restOpcaoItemId).isNotEmpty){
                                                        return TextWidget(
                                                          text: i.itemNome,
                                                          fontSize: 16,
                                                          textColor: Cores.verdeClaro,
                                                          fontWeight: FontWeight.w500,
                                                          );
                                                      } else{
                                                       return TextWidget(
                                                          text: i.itemNome,
                                                          fontSize: 16,
                                                          textColor: Colors.black,
                                                          fontWeight: FontWeight.w300,
                                                          );
                                                      }
                                                    },
                                                  ),
                                                  subtitle: Observer(
                                                    builder: (_){
                                                      if(controller.opcoesEscolhidas.where((element) => element.opItemId == i.restOpcaoItemId).isNotEmpty){
                                                        return TextWidget(
                                                          text: 'R\$ ${i.itemPreco.toStringAsFixed(2)}',
                                                          textColor: Cores.verdeClaro,
                                                          fontSize: 16,
                                                          fontWeight:FontWeight.w500,
                                                        );
                                                      } else{
                                                        return TextWidget(
                                                          text: 'R\$ ${i.itemPreco.toStringAsFixed(2)}',
                                                          textColor: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:FontWeight.w300,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                 trailing: Observer(
                                                   builder: (_){
                                                    if(controller.opcoesEscolhidas.isEmpty){
                                                      return Icon(CupertinoIcons.circle);
                                                      }  else if(controller.opcoesEscolhidas.where((element) => element.opItemId == i.restOpcaoItemId).isNotEmpty){
                                                        return Icon(
                                                          CupertinoIcons.circle_fill,
                                                          color: Cores.verdeClaro,
                                                          );

                                                      } else {
                                                       return Icon(CupertinoIcons.circle);
                                                           }
                                                           },
                                                         ), 
                                                        onTap: (){
                                                          controller.opcoesEscolhidas.removeWhere(
                                                          (element) => element.opId == op.restOpcaoId);
                                                        OpcaoEscolhida opcaoEscolhida= new OpcaoEscolhida(
                                                          op.opcaoNome,
                                                          op.restOpcaoId,
                                                          i.itemNome,
                                                          i.itemPreco,
                                                          i.restOpcaoItemId,
                                                        );
                                                        print(opAtual.nomeItem.toString());
                                                        print(opAtual.opItemId.toString());
                                                        print(opAtual.opId.toString());
                                                        print('TAMANHO DA LISTA: ' + controller.produto.restProdutos[0].restOpcaos.length.toString() + ' INDEX: $index');
                                                        controller.opcoesEscolhidas.add(opcaoEscolhida);
                                                        },
                                                ),
                                             ),
                                         );
                                        }, 
                                      );
                                    }
                                  );
                                    }
                                  ), 
                            ),
                      ],
                      ),
                    );
                  },
                  ), 
                ),
              ),
              SizedBox(
                height: 0,
              ),
             controller.produto.restAdicionals.isEmpty
              ? SizedBox()
              : Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 10
                        ),
                        child: TextWidget(
                          text: 'Adicionais: ',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: Cores.verdeClaro,
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: controller.produto.restAdicionals.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index){
                      var add = controller.produto.restAdicionals[index];
                      return ListTile(
                        title: TextWidget(
                          text: add.nome,
                          fontSize: 16,
                        ),
                        subtitle: TextWidget(
                          text: 'R\$ ${add.preco.toStringAsFixed(2)}',
                          fontSize: 16,
                        ),
                        trailing: Container(
                          width: 120,
                          child: Stack(
                            children: [
                              Positioned(
                                right: 1,
                                child: Observer(
                                  builder:(_) => IconButton(
                                    icon: Icon(
                                      CupertinoIcons.add_circled,
                                    color: Cores.verdeClaro,
                                      size: 20,
                                      ),
                                    onPressed: (){
                                     controller.add.add(add);
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                top: 12,
                                child: Observer(
                                  builder:(_) {
                                    var quantidade = controller.add.map((e){
                                      if(add.nome == e.nome){
                                        return 1;
                                      }
                                      return 0;
                                    }).toList();
                                    var q = quantidade.fold(0, (init, element) => init + element);
                                    return TextWidget(
                                        text: q.toString(),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                    );
                                  } 
                                ),
                              ),
                              Observer(
                                builder:(_) => IconButton(
                                  icon: Icon(
                                    CupertinoIcons.minus_circle,
                                    color: Cores.verdeClaro,
                                    size: 20,
                                    ),
                                  onPressed:(){
                                    controller.add.removeWhere(
                                      (element) => add.nome == element.nome);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
               Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: controller.existeOpcoes == false
                ? SizedBox()
                : Column(
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          text: 'Opções selecionadas do produto:',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: Cores.verdeClaro,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text:controller.textOpcoesEscolhidas == "XX"
                          ? 'Selecione as opções'
                          : '${controller.textOpcoesEscolhidas}'
                          .replaceAll('(', '').replaceAll(')', '').replaceAll(',', '\n').replaceAll('', ''),
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Observer(
                builder:(_) => Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: controller.existeAdicionais == false && controller.textAdicionaisEscolhidos == "XX"
                  ? SizedBox()
                  : Column(
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            text: 'Adicionais Selecionados:',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textColor: Cores.verdeClaro,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          TextWidget(
                            text: controller.textAdicionaisEscolhidos == 'XX'
                            ? 'Selecione suas opções'
                            : ' ${controller.textAdicionaisEscolhidos}'
                            .replaceAll('(', '').replaceAll(')', '').replaceAll(',', '\n').replaceAll('', ''),
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  children: [
                    TextWidget(
                      text: 'Observação:',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textColor: Cores.verdeClaro,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                width: size.width,
                child: Container(
                      height: 200,
                      child: TextFieldWidget(
                        textEditingController: controller.obsController,
                        labelText: 'Alguma observação?',
                        hintText: 'Ex: Tirar a cebola, maionese à parte, ponto da carne etc',
                        maxLines: 2,
                      ),
                    )
              ),
            ],
          ),
        ),  
      );
    }

          return Center(child: CupertinoActivityIndicator(),);
      }),
      bottomNavigationBar: Observer(
        builder: (_){
          if(controller.produto == null 
          || controller.produto.restProdutos == null){
            return SizedBox();
          }

          if(controller.produto.restProdutos.isEmpty == true){
            return SizedBox();
          }
          if(controller.salvando == true){
            return SizedBox();
          }
          return Container(
            width: size.width,
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'R\$ ${controller.totalItem.toStringAsFixed(2).replaceAll('.', ',')}',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  width: 250,
                  child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.transparent)), 
                    color: Cores.verdeClaro,
                    disabledColor: Colors.grey,
                    onPressed: controller.addLiberado == false
                    ? null
                    : () async {
                     await controller.salvarProduto(widget.produto.produtoId);
                     Modular.to.pop();
                    },
                    child: TextWidget(
                      text: 'Adicionar ao Carrinho',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      
    );
  }
}

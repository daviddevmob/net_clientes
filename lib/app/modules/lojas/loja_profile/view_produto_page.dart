import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:net_cliente/app/shared/models/loja/loja_perfil_page_model.dart';
import 'package:net_cliente/app/shared/utils/app_bar.dart';

class ViewProdutoPage extends StatelessWidget {
  final LojaProduto produto;

  const ViewProdutoPage({Key key, this.produto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 50),
        child: Observer(
          builder: (_) => AppBarWidget(
            title: produto.produtoNome,
            viewLeading: true,
          ),
        ),
      ),
      body: Column(
        children: [
         
         ListView(
           shrinkWrap: true,
           physics: ScrollPhysics(),
           children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               margin: EdgeInsets.only(
                 top: 30,
               ),
               child: produto.foto1Link == null
               || produto.foto1Link == ''
               ? SizedBox()
               : Container(
                 height: 200,
                 width: 200,
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.transparent,
                   ),
                   borderRadius: BorderRadius.circular(4),
                   image: DecorationImage(
                     image: CachedNetworkImageProvider(
                       produto.foto1Link,
                     ),
                    )
                 ),
               ), 
             ),
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               margin: EdgeInsets.only(
                 top: 10,
               ),
               child: produto.foto2Link == null
               || produto.foto2Link == ''
               ? SizedBox()
               : Container(
                 height: 200,
                 width: 200,
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.transparent,
                   ),
                   borderRadius: BorderRadius.circular(4),
                   image: DecorationImage(
                     image: CachedNetworkImageProvider(
                       produto.foto2Link,
                     ),
                    )
                 ),
               ), 
             ),
           ],
         ),
           ],
         ),
          
          
        ],
      ),
    );
  }
}

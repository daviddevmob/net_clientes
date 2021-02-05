import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/produto_rest/model/opcao_escolhida.dart';
import 'package:net_cliente/app/shared/models/rest/item_carrinho/item_carrinho_rest_model.dart';
import 'package:net_cliente/app/shared/models/rest/produto_view/rest_produto_profile.dart';
import 'package:net_cliente/app/shared/repositories/local_storage/carrinho_rest/carrinho_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository_interface.dart';


part 'produto_rest_controller.g.dart';

@Injectable()
class ProdutoRestController = _ProdutoRestControllerBase
    with _$ProdutoRestController;

abstract class _ProdutoRestControllerBase with Store {
  final IRestProfile iRestProfile;
  final ICarrinhoRestLocal iLocal;

  _ProdutoRestControllerBase(this.iRestProfile, this.iLocal);

  @observable
  RestProdutoProfile produto;

  @observable
  bool salvando = false;

  @computed
  double get totalItem {
    if(produto.restProdutos[0].precoPromo != 0 
    && produto.restProdutos[0].precoPromo < produto.restProdutos[0].preco ){
      double preco = produto.restProdutos[0].precoPromo;
      double adicionais = adicionaisTotal;
      double total = preco + adicionais + opcoesTotal;
      return total;
    } else{
      double preco = produto.restProdutos[0].preco;
      double adicionais = adicionaisTotal;
      double total = preco + adicionais + opcoesTotal;
      return total;
    }
    
  }

  @observable
  List<RestOpcao> item = List<RestOpcao>();

  @observable
  ObservableList<RestAdicional> add = ObservableList<RestAdicional>();

  @computed
  double get adicionaisTotal {
    if(add.length >0){
      var compilado = add.map((e) => e.preco);
    var total = compilado.fold(0, (init, element) => init + element);
    return total;
    }

    return 0;
    
  }

  @action
  getProdutoView(int produtoId, int categoriaId) async {
    produto = await iRestProfile.getProdutoView(
      produtoId, 
      categoriaId,
      );
  }

  @observable
  ObservableList<OpcaoEscolhida> opcoesEscolhidas = ObservableList<OpcaoEscolhida>();

  @computed
  double get opcoesTotal{
    if(opcoesEscolhidas.length > 0){
     var compilado = opcoesEscolhidas.map((element) => element.valorItem);
     double total = compilado.fold(0, (init, element) => element + init);
     return total;
    }

    return 0;
  }
  
  @computed
  bool get addLiberado {

    if(opcoesEscolhidas.length == produto.restProdutos[0].restOpcaos.length){
      return true;
    }

    return false;
  }

  @computed
  bool get existeOpcoes {
    if(produto.restProdutos[0].restOpcaos.isEmpty){
      return false;
    }
    return true;
  }

  @computed
  bool get existeAdicionais {
    if(produto.restAdicionals.isEmpty){
      return false;
    }

    return true;
  }

  @computed
  String get textOpcoesEscolhidas {
   
    if(produto.restProdutos[0].restOpcaos.length > 0){
      if(opcoesEscolhidas.isNotEmpty){

        var text = opcoesEscolhidas.map((element) => element.nomeOpcao + ' : ' + element.nomeItem).toString();
        return text;
      }

    
      return 'XX';
    
    }

    return '';
  }

  @computed
  String get textAdicionaisEscolhidos {
    if(produto.restAdicionals.isNotEmpty){
    var adicionais = add.map((element){
      return (element.nome +'  -:'+ element.preco.toString()).toString().replaceAll('-', 'R\$').replaceAll(':', ' ');
    }).toList();


    return adicionais.toString().replaceAll('[', '').replaceAll(']', '');
    }
    return '';
  }

  @action
  addItemCarrinho(int produtoId) async {
    var add = await iRestProfile.veridicaQuantidadeProduto(
      produtoId, 1);
    if(add == true){

    } else{
      return false;
    }
    
  }

  @action
  salvarCarrinho(int clienteId, int restId, int produtoId, String clienteFirebaseId) async {
    double preco;
    if(produto.restProdutos[0].precoPromo != 0 
    && produto.restProdutos[0].precoPromo < produto.restProdutos[0].preco ){
      preco = produto.restProdutos[0].precoPromo;
    } else{
      preco = produto.restProdutos[0].preco;
    }
    salvando = true;
    var salvar = await iRestProfile.addProdutoCarrinho(
      clienteId, 
      restId, 
      produtoId, 
      preco, 
      totalItem, 
      1, 
      textAdicionaisEscolhidos, 
      textOpcoesEscolhidas, 
      clienteFirebaseId,
      );
    salvando = false;
    return 'ok';
  }

  @action
  salvarProduto(int produtoId) async {
    salvando = true;
    double preco;
    if(produto.restProdutos[0].precoPromo != 0 
    && produto.restProdutos[0].precoPromo < produto.restProdutos[0].preco ){
      preco = produto.restProdutos[0].precoPromo;
    } else{
      preco = produto.restProdutos[0].preco;
    }


    ItemCarrinhoRestModel item 
    = new ItemCarrinhoRestModel(
      produtoId,
      preco,
      1,
      textAdicionaisEscolhidos,
      textOpcoesEscolhidas,
      totalItem,
      produto.restProdutos[0].foto,
      produto.restProdutos[0].nome,
    );
    await iLocal.addItemCarrinho(item);
    salvando = false;
    return 'ok';
  }
}

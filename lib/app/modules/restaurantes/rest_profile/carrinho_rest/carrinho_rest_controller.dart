import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/rest/item_carrinho/item_carrinho_rest_model.dart';
import 'package:net_cliente/app/shared/models/rest/pedido_rest_model/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/repositories/local_storage/carrinho_rest/carrinho_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository_interface.dart';

part 'carrinho_rest_controller.g.dart';

@Injectable()
class CarrinhoRestController = _CarrinhoRestControllerBase
    with _$CarrinhoRestController;

abstract class _CarrinhoRestControllerBase with Store {
  final ICarrinhoRestLocal iLocal;
  final IRestProfile iRestProfile;

  _CarrinhoRestControllerBase(this.iLocal, this.iRestProfile){
    getProdutos();
  }
  
  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  bool salvo = false;

  @observable
  bool salvando = false;

  @observable 
  int metodoPagamentoCartaoId;

  @observable
  bool tipoEntrega = true;

  @observable
  double taxaEntrega;

  @observable
  int clienteId;

  @observable
  bool pagamentoDinheiro = false;

  @observable
  var produtos = ObservableList<ItemCarrinhoRestModel>();

  @observable
  TextEditingController trocoParaController = TextEditingController();

  @computed
  double get totalPedido{
    if(produtos.isNotEmpty){
      var valorProdutos = produtos.map((element) => element.total);
      double totalProdutos = valorProdutos.fold(0, (previousValue, element) => previousValue + element);
      if(taxaEntrega != null && tipoEntrega == true){
         double total = totalProdutos + taxaEntrega;
         return total;
      } else {
        return totalProdutos;
      }
    }

  return 0;

  }

  @computed
  bool get liberarPedir {
    if(pagamentoDinheiro != null && tipoEntrega != null){
      if(pagamentoDinheiro == false){
        if(metodoPagamentoCartaoId != null){
          return true;
        }
      }else{
        return true;
      } 
    }
    return false;
  }

  @action
  setMetodoPagamentoCartaoId(int value) => metodoPagamentoCartaoId = value;

  @action
  getProdutos() async {
    produtos = await iLocal.getItensCarrinho();
  }

  @action
  setDinheiroOuCartao(bool value) => pagamentoDinheiro = value;

  @action
  setTipoEntrega(bool value) => tipoEntrega = value;

  @action
  deleteProduto(ItemCarrinhoRestModel item) async {
    produtos.removeWhere(
      (element) => element.total == item.total && element.produtoId == item.produtoId);
    await iLocal.deleteItemCarrinho(item);
  }

  @computed
  List<ItemPedidoRestModel> get itens {
    List<ItemPedidoRestModel> item = new List<ItemPedidoRestModel>();
    for(int i = 0; i >= produtos.length; i++) {
      item.add(new ItemPedidoRestModel(
        clienteId,
        produtos[i].produtoId,
        produtos[i].quantidade,
        produtos[i].opcoes,
        produtos[i].complementos,
        produtos[i].precoUnidade,
        produtos[i].total
        ));
    }
    return item;
  }

  @computed
  List<ItemPedidoRestModel> get todosItens {
    List<ItemPedidoRestModel> i = new List<ItemPedidoRestModel>();
    for(int item = 0; item >= produtos.length; item++) {
      i.add(new ItemPedidoRestModel(
        clienteId,
        produtos[item].produtoId,
        produtos[item].quantidade,
        produtos[item].opcoes,
        produtos[item].complementos,
        produtos[item].precoUnidade,
        produtos[item].total
        ));
    }
    return i;
  }


  @computed
  List<ItemPedidoRestModel> get item {
    List<ItemPedidoRestModel> item = List<ItemPedidoRestModel>();
    int total = produtos.length;
    for(int i = 0; i >= total; i++) {
      item.add(new ItemPedidoRestModel(
        clienteId,
        produtos[i].produtoId,
        produtos[i].quantidade,
        produtos[i].opcoes,
        produtos[i].complementos,
        produtos[i].precoUnidade,
        produtos[i].total
        ));
    } 

    return item;
  }
  @action
  printItens() async {
    print('PRODUTOS TAMANHO: ' + produtos.length.toString());
    print('PRODUTOS: ' + produtos.map((e) => e).toList().toString());
    print('ITENS: ' + itens.map((e) => e).toList().toString());
    print('ITENS: ' + todosItens.map((e) => e).toList().toString());
  }

  @action
  fazerPedido(
    int clienteId, 
    int restId, 
    int bairro, 
    String clienteFirebaseId, 
    String endereco,
    String localizacao,
    ) async {
    salvando = true; 

    PedidoRestModel pedido = new PedidoRestModel(
      clienteId, 
      restId, 
      1, 
      bairro, 
      pagamentoDinheiro == true ? 0 : metodoPagamentoCartaoId, 
      tipoEntrega, 
      clienteFirebaseId, 
      endereco, 
      localizacao, 
      trocoParaController.text, 
      taxaEntrega, 
      totalPedido, 
      produtos,
      );
      var fazerPedido = await iRestProfile.fazerPedido(pedido);
      salvando = false;
      salvo = true;
      await iLocal.deleteCarrinho();
      return fazerPedido;
  }

}


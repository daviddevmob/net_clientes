import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/produto_rest/model/opcao_escolhida.dart';
import 'package:net_cliente/app/shared/models/rest/produto_view/rest_produto_profile.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository_interface.dart';


part 'produto_rest_controller.g.dart';

@Injectable()
class ProdutoRestController = _ProdutoRestControllerBase
    with _$ProdutoRestController;

abstract class _ProdutoRestControllerBase with Store {
  final IRestProfile iRestProfile;

  _ProdutoRestControllerBase(this.iRestProfile);

  @observable
  RestProdutoProfile produto;

  @computed
  double get totalItem {
    if(produto.restProdutos[0].precoPromo != 0 
    && produto.restProdutos[0].precoPromo < produto.restProdutos[0].preco ){
      double preco = produto.restProdutos[0].precoPromo;
      double adicionais = adicionaisTotal;
      double total = preco + adicionais;
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
  
  @action
  addItemCarrinho(int produtoId) async {
    var add = await iRestProfile.veridicaQuantidadeProduto(
      produtoId, 1);
    if(add == true){

    } else{
      return false;
    }
    
  }
}

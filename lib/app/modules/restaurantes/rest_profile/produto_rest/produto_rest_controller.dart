import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  @action
  getProdutoView(int produtoId, int categoriaId) async {
    produto = await iRestProfile.getProdutoView(
      produtoId, 
      categoriaId,
      );
  }
  
  @observable
  List<double> value = List<double>();

  @action
  criarRadios() async {
    for(var x = 0; x >= produto.restProdutos[0].restOpcaos.length; x++){
      value.add(0);
      print('add $x');
    }
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

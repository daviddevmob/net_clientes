import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/loja/loja_perfil_page_model.dart';
import 'package:net_cliente/app/shared/repositories/loja/loja_perfil/loja_profile_repository_interface.dart';

part 'item_carrinho_model.g.dart';

class ItemCarrinhoModel = _ItemCarrinhoModelBase with _$ItemCarrinhoModel;

abstract class _ItemCarrinhoModelBase with Store {
  final LojaProduto produto;
  final ILojaPerfil iLoja;

  _ItemCarrinhoModelBase(this.produto, this.iLoja);

  @observable
  int _quantidade = 1;

  @computed
  int get quantidade => _quantidade;

  @action
  add(int produtoId) async {
    bool estoque = await iLoja.veridicaQuantidadeProduto(produtoId, (quantidade+1));
    if (estoque == true) {
      _quantidade++;
      return true;
    } else {
      return false;
    }
  }

  @action
  remove() {
    _quantidade--;
  }

 

}

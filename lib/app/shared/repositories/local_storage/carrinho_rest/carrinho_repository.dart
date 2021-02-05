import 'package:get_storage/get_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:net_cliente/app/shared/models/rest/item_carrinho/item_carrinho_rest_model.dart';
import 'package:net_cliente/app/shared/repositories/local_storage/carrinho_rest/carrinho_repository_interface.dart';

class CarrinhoRestLocalRepository implements ICarrinhoRestLocal{

  final box = GetStorage();

  @override
  Future addItemCarrinho(ItemCarrinhoRestModel item) async {
    ObservableList<ItemCarrinhoRestModel> itensAtuais = await getItensCarrinho();
    if(itensAtuais == null){
      ObservableList<ItemCarrinhoRestModel> atualizacao = ObservableList<ItemCarrinhoRestModel>();
      atualizacao.add(item);
      await box.write('itensCarrinho', atualizacao);
    } else{
    itensAtuais.add(item);
    await box.write('itensCarrinho', itensAtuais);
    }
  }

  @override
  Future deleteCarrinho() async {
    await box.remove('itensCarrinho');
  }

  @override
  Future deleteItemCarrinho(ItemCarrinhoRestModel item)  async {
    ObservableList<ItemCarrinhoRestModel> itens= await getItensCarrinho();
    itens.removeWhere((element) => element.total == item.total && element.produtoId == item.produtoId);

  }

  @override
  Future getItensCarrinho() async {
    ObservableList<ItemCarrinhoRestModel> itensCarrinho = await box.read('itensCarrinho');
    if(itensCarrinho == null){
      return null;
    } else {
      return itensCarrinho;
    }

  }
}
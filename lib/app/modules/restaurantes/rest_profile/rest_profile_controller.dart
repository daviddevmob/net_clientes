import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/rest/carrinho_rest_page_model.dart';
import 'package:net_cliente/app/shared/models/rest/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/models/rest/rest_favorito_profile.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile_page.dart';
import 'package:net_cliente/app/shared/repositories/local_storage/carrinho_rest/carrinho_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_favoritos/rest_favoritos_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/rest_repository/rest_profile/rest_profile_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';

part 'rest_profile_controller.g.dart';

@Injectable()
class RestProfileController = _RestProfileControllerBase
    with _$RestProfileController;

abstract class _RestProfileControllerBase with Store {
  final IRestProfile iRestProfile;
  final IRestFavoritos iRestFavoritos;
  final ISend iSend;
  final ICarrinhoRestLocal iLocal;

  _RestProfileControllerBase(this.iRestProfile, this.iRestFavoritos, this.iSend, this.iLocal){
    iLocal.deleteCarrinho();
  }

  @observable
  RestProfile rest;

  @action
  getRestaurante(int restId) async{
    rest = await iRestProfile.getRest(restId);
    await filtroProduto();
  }


  @observable
  int clienteId;

  @observable
  bool favoritado;

  @observable
  ObservableStream<RestFavoritoModelProfile> restFavorito;

  @observable
  GlobalKey<FormState> formCarrinhoKey = GlobalKey<FormState>();

  @observable
  double taxaEntrega;

  @observable
  double distanciaEntrega;

  @observable
  bool somenteDisponiveis = true;

  @observable
  bool pedidoSalvo = false;

  @observable
  int categoria;

  @observable
  bool salvandoDados = false;

  @observable
  List<RestProduto> produtoList;

  @observable
  bool pagamentoDinheiro = true;

  @observable
  int metodoPagamentoCartaoId;

  @observable
  bool entregaDomicilio = true;

  @observable
  TextEditingController trocoParaController = TextEditingController();

  @computed
  int get filtroString {
    if (categoria == null) {
      return 0;
    }
      return 1;
  }



  @action
  sendLigacao() {
    iSend.sendLigacao(rest.usuario.socialLinks.telefone);
  }

  @action
  setEntregaDomicilio(bool newValue) => entregaDomicilio = newValue;

  @action
  setDinheiroOuCartao(bool newValue) => pagamentoDinheiro = newValue;

  @action
  setMetodoPagamentoCartaoId(int newValue) =>
      metodoPagamentoCartaoId = newValue;


  @action
  setCategoria(int newValue) async {
    if (newValue == 0) {
      categoria = null;
      await filtroProduto();
    } else {
      categoria = newValue;
      await filtroProduto();
    }
  }

  @action
  filtroProduto() {
    if (filtroString == 0) {

      produtoList =  
      rest.restProdCategoria.map((e) 
      => e.restProdutos.where((element) 
      => element.disponivel == true).reduce((value, element) => element)).toList();

    } else if (filtroString == 1) {

      produtoList =  rest.restProdCategoria.map((e) => e.restProdutos.toList()).reduce((value, element) => element);
    } 
  }


  @action
  salvarFavorito(int lojaId) async {
    var salvar = await iRestFavoritos.salvarFavorito(lojaId, clienteId);
    return salvar;
  }

  @action
  deletarFavorito(int lojaId) async {
    var deletar = await iRestFavoritos.setStatusFavorito(
      clienteId,
      lojaId,
      !restFavorito.value.clienteFavoritoRest[0].ativo,
    );
    return deletar;
  }
}

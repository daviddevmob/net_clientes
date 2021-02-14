import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/rest/rest_favorito_profile.dart';
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
  final ScrollController listController = ScrollController();

  _RestProfileControllerBase(this.iRestProfile, this.iRestFavoritos, this.iSend, this.iLocal){
    iLocal.deleteCarrinho();
  }

  @observable
  ObservableStream<RestProfile> rest;

  @action
  getRestaurante(int restId) {
    rest = iRestProfile.getRest(restId).asObservable();
  }

  @action
  getRestFavorito(int restId) {
    restFavorito = iRestFavoritos.setFavoritos(restId, clienteId).asObservable();
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

  @observable
  int horario = DateTime.now().toLocal().hour;

  @computed
  bool get abertoRest {
    var dia = DateTime.now().weekday;
    var horario = DateTime.now().toLocal().hour;
    if (dia == 1 && rest.value.usuario.diasSemana.segunda == true) {

      if( horario < int.parse(rest.value.usuario.horarioAtendimento.segunda.substring(0,12).substring(0,4).substring(0,2)) || 
          horario > int.parse(rest.value.usuario.horarioAtendimento.segunda.substring(4).substring(5).substring(0,2))){
            return false;
      } else{
            return true;
      }

    } else if (dia == 2 && rest.value.usuario.diasSemana.terca == true) {

      if( horario < int.parse(rest.value.usuario.horarioAtendimento.terca.substring(0,12).substring(0,4).substring(0,2)) ||
          horario > int.parse(rest.value.usuario.horarioAtendimento.terca.substring(4).substring(5).substring(0,2))){
            return false;
      } else{
            return true;
      }

    } else if (dia == 3 && rest.value.usuario.diasSemana.quarta == true) {

      if(horario < int.parse(rest.value.usuario.horarioAtendimento.quarta.substring(0,12).substring(0,4).substring(0,2)) ||
         horario > int.parse(rest.value.usuario.horarioAtendimento.quarta.substring(4).substring(5).substring(0,2))){
            return false;
      } else{
             return true;
      }

    } else if (dia == 4 && rest.value.usuario.diasSemana.quinta == true) {

      if( horario < int.parse(rest.value.usuario.horarioAtendimento.quinta.replaceAll('ás', '').replaceAll(' ', '').replaceAll(':', '').substring(0,4)) ||
          horario > int.parse(rest.value.usuario.horarioAtendimento.quinta.substring(4).replaceAll('ás', '').replaceAll(':', '').replaceAll(' ', '').substring(1,3))){
            return false;
      } else{
            return true;
      }

    } else if (dia == 5 && rest.value.usuario.diasSemana.sexta == true) {

      if( horario < int.parse(rest.value.usuario.horarioAtendimento.sexta.replaceAll('ás', '').replaceAll(' ', '').replaceAll(':', '').substring(0,4)) || 
          horario > int.parse(rest.value.usuario.horarioAtendimento.sexta.substring(4).replaceAll('ás', '').replaceAll(':', '').replaceAll(' ', '').substring(1,3))){
            return false;
      } else{
            return true;
      }

    } else if (dia == 6 && rest.value.usuario.diasSemana.sabado == true) {

      if( horario < int.parse(rest.value.usuario.horarioAtendimento.sabado.replaceAll('ás', '').replaceAll(' ', '').replaceAll(':', '').substring(0,4)) ||
          horario > int.parse(rest.value.usuario.horarioAtendimento.sabado.substring(4).replaceAll('ás', '').replaceAll(':', '').replaceAll(' ', '').substring(1,3))){
            return false;
      } else{
            return true;
      }

    } else if (dia == 7 && rest.value.usuario.diasSemana.domingo == true) {

      if( horario < int.parse(rest.value.usuario.horarioAtendimento.domingo.replaceAll('ás', '').replaceAll(' ', '').replaceAll(':', '').substring(0,4)) || 
          horario > int.parse(rest.value.usuario.horarioAtendimento.domingo.substring(4).replaceAll('ás', '').replaceAll(':', '').replaceAll(' ', '').substring(1,3))){
            return false;
      } else{
            return true;
      }

    }
    return false;
  }


  @action
  sendLigacao() {
    iSend.sendLigacao(rest.value.usuario.socialLinks.telefone);
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
      rest.value.restProdCategoria.map((e) 
      => e.restProdutos.where((element) 
      => element.disponivel == true).reduce((value, element) => element)).toList();

    } else if (filtroString == 1) {

      produtoList =  rest.value.restProdCategoria.map((e) => e.restProdutos.toList()).reduce((value, element) => element);
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

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/modules/lojas/loja_profile/item_carrinho_model.dart';
import 'package:net_cliente/app/shared/models/loja/carrinho_loja_page_model.dart';
import 'package:net_cliente/app/shared/models/loja/loja_favorito_profile.dart';
import 'package:net_cliente/app/shared/models/loja/loja_pedido_model.dart';
import 'package:net_cliente/app/shared/models/loja/loja_perfil_page_model.dart';
import 'package:net_cliente/app/shared/models/loja/loja_profile.dart';
import 'package:net_cliente/app/shared/repositories/loja/loja_perfil/loja_profile_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/loja/lojas_favotiras/loja_favoritas_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';

part 'loja_profile_controller.g.dart';

@Injectable()
class LojaProfileController = _LojaProfileControllerBase
    with _$LojaProfileController;

abstract class _LojaProfileControllerBase with Store {
  final ILojaPerfil iLojaPerfil;
  final ILojasFavoritas iLojasFavoritas;
  final ISend iSend;

  _LojaProfileControllerBase(
      this.iLojaPerfil, this.iLojasFavoritas, this.iSend);

  @observable
  var produtosCarrinho = ObservableList<ItemCarrinhoModel>();

  @observable
  LojaPerfilPageModel loja;

  @observable
  int clienteId;

  @observable
  bool favoritado;

  @observable
  ObservableStream<LojaFavoritaModelProfile> lojaFavorita;

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
  List<LojaProduto> produtoList;

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
    if (somenteDisponiveis == true && categoria == null) {
      return 0;
    } else if (somenteDisponiveis == true && categoria != null) {
      return 1;
    } else if (somenteDisponiveis == false && categoria != null) {
      return 2;
    } else if (somenteDisponiveis == false && categoria == null) {
      return 4;
    }
    return 5;
  }

  @computed
  double get totalPedido {
    return produtosCarrinho.map((element) {
      if (element.produto.precoPromo != 0 &&
          element.produto.precoPromo < element.produto.preco) {
        double value = ((element.produto.precoPromo) * element.quantidade);
        return value;
      } else {
        double value = ((element.produto.preco) * element.quantidade);
        return value;
      }
    }).reduce((value, element) => value + element);
  }

  @action
  getLojaFavorita(int clineteId) {
    lojaFavorita =
        iLojasFavoritas.setFavoritos(loja.lojaId, clineteId).asObservable();
  }

  @action
  sendLigacao() {
    iSend.sendLigacao(loja.usuario.socialLinks.telefone);
  }

  @action
  setEntregaDomicilio(bool newValue) => entregaDomicilio = newValue;

  @action
  setDinheiroOuCartao(bool newValue) => pagamentoDinheiro = newValue;

  @action
  setMetodoPagamentoCartaoId(int newValue) =>
      metodoPagamentoCartaoId = newValue;

  @action
  getLoja(int lojaId) async {
    loja = await iLojaPerfil.getLoja(lojaId).asObservable();
    filtroProduto();
  }

  @action
  setCategoria(int newValue) {
    if (newValue == 0) {
      categoria = null;
      filtroProduto();
    } else {
      categoria = newValue;
      filtroProduto();
    }
  }

  @action
  deleteItemCarrinho(LojaProduto produto) {
    produtosCarrinho.removeWhere(
        (element) => produto.lojaProdutoId == element.produto.lojaProdutoId);
  }

  @action
  filtroProduto() {
    if (filtroString == 0) {
      produtoList = loja.lojaProdutos
          .where((element) => element.disponivel == true)
          .toList();
    } else if (filtroString == 1) {
      produtoList = loja.lojaProdutos
          .where((element) =>
              element.disponivel == true &&
              element.lojaCategoriaProdId == categoria)
          .toList();
    } else if (filtroString == 2) {
      produtoList = loja.lojaProdutos
          .where((element) => element.lojaCategoriaProdId == categoria)
          .toList();
    } else if (filtroString == 3) {
      produtoList = loja.lojaProdutos;
    }
  }

  @action
  addItemCarrinho(LojaProduto lojaProduto) async {
    var index = produtosCarrinho.indexWhere((element) =>
        element.produto.lojaProdutoId == lojaProduto.lojaProdutoId);
    if (index >= 0) {
      bool add = await produtosCarrinho
          .elementAt(index)
          .add(lojaProduto.lojaProdutoId);
      return add;
    } else {
      bool verificar = await iLojaPerfil.veridicaQuantidadeProduto(
        lojaProduto.lojaProdutoId,
        1,
      );
      if (verificar == true) {
        produtosCarrinho.add(ItemCarrinhoModel(lojaProduto, iLojaPerfil));
        return true;
      } else {
        return false;
      }
    }
  }

  @action
  removeItemCarrinho(LojaProduto lojaProduto) async {
    var index = produtosCarrinho.indexWhere((element) =>
        element.produto.lojaProdutoId == lojaProduto.lojaProdutoId);
    produtosCarrinho.elementAt(index).remove();
  }

  @computed
  List<LojaPedidoItem> get pedidosItens {
    List<LojaPedidoItem> p = new List<LojaPedidoItem>();
    for (int pedido = 0; pedido >= produtosCarrinho.length; pedido = pedido + 1) {

      double precoUnidade = produtosCarrinho[pedido].produto.precoPromo != 0 &&
              produtosCarrinho[pedido].produto.precoPromo <
                  produtosCarrinho[pedido].produto.preco
          ? produtosCarrinho[pedido].produto.precoPromo
          : produtosCarrinho[pedido].produto.preco;

      p.add(new LojaPedidoItem(
        clienteId: clienteId,
        produtoLojaId: produtosCarrinho[pedido].produto.lojaProdutoId,
        quantidade: produtosCarrinho[pedido].produto.quantidade,
        precoUnidade: precoUnidade,
        total: (precoUnidade * produtosCarrinho[pedido].produto.quantidade),
      ));

    }

    return p;
  }

  @action
  savePedido(LojaProfileModel lojaView, CarrinhoLojaPageModel carrinho,
      bool entrega, double taxaEntrega, double totalPedido) async {
    LojaPedidoModel lojaPedidoModel = new LojaPedidoModel(
      bairro: lojaView.endereco.bairro,
      clienteId: lojaView.cliente.clienteId,
      clienteFirebaseId: lojaView.cliente.firebaseId,
      lojaFirebaseId: loja.lojaFirebaseId,
      lojaId: loja.lojaId,
      endereco: lojaView.endereco.endereco,
      entrega: entrega,
      localizacao: lojaView.endereco.latlgn,
      statusPedido: 1,
      metodoPagamento: pagamentoDinheiro == false ? metodoPagamentoCartaoId : 0,
      taxaEntrega: taxaEntrega,
      totalPedido: totalPedido,
      troco: pagamentoDinheiro == true ? trocoParaController.text : '',
      lojaPedidoItems: pedidosItens,
    );
    pedidoSalvo = true;
    var salvar =
        await iLojaPerfil.fazerPedido(lojaPedidoModel, produtosCarrinho);
    print('RETURN DO SALVAR: ' + salvar.toString());
    return salvar;
  }

  @action
  salvarFavorito(int lojaId) async {
    var salvar = await iLojasFavoritas.salvarFavorito(lojaId, clienteId);
    return salvar;
  }

  @action
  deletarFavorito(int lojaId) async {
    var deletar = await iLojasFavoritas.setStatusFavorito(
      clienteId,
      lojaId,
      !lojaFavorita.value.clienteFavoritoLoja[0].ativo,
    );
    return deletar;
  }
}

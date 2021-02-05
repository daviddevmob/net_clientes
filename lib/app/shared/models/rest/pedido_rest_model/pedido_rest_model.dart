import 'package:net_cliente/app/shared/models/rest/item_carrinho/item_carrinho_rest_model.dart';

class PedidoRestModel {
  final int clienteId;
  final int restId;
  final int status;
  final int bairro;
  final int metodoPagamento;
  final bool entrega;
  final String clienteFirebaseId;
  final String endereco;
  final String localizacao;
  final String troco;
  final double taxaEntrega;
  final double totalPedido;
  final List<ItemCarrinhoRestModel> produtos;

  PedidoRestModel(this.clienteId, this.restId, this.status, this.bairro, this.metodoPagamento, this.entrega, this.clienteFirebaseId, this.endereco, this.localizacao, this.troco, this.taxaEntrega, this.totalPedido, this.produtos);
}

class ItemPedidoRestModel {
  final int clienteId;
  final int produtoRestId;
  final int quantidade;
  final String opcoesProduto;
  final String complementosProduto;
  final double precoUnidade;
  final double total;

  ItemPedidoRestModel(this.clienteId, this.produtoRestId, this.quantidade, this.opcoesProduto, this.complementosProduto, this.precoUnidade, this.total);
}
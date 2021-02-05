class ItemCarrinhoRestModel {
  final int produtoId;
  final double precoUnidade;
  final int quantidade;
  final String complementos;
  final String opcoes;
  final double total;
  final String foto;
  final String nome;

  ItemCarrinhoRestModel(this.produtoId, this.precoUnidade, this.quantidade, this.complementos, this.opcoes, this.total, this.foto, this.nome);
}
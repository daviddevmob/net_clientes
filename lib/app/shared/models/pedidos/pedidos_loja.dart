// To parse this JSON data, do
//
//     final pedidosLojaModel = pedidosLojaModelFromJson(jsonString);

import 'dart:convert';

PedidosLojaModel pedidosLojaModelFromJson(String str) => PedidosLojaModel.fromJson(json.decode(str));

String pedidosLojaModelToJson(PedidosLojaModel data) => json.encode(data.toJson());

class PedidosLojaModel {
    PedidosLojaModel({
        this.lojaPedidos,
    });

    List<LojaPedido> lojaPedidos;

    factory PedidosLojaModel.fromJson(Map<String, dynamic> json) => PedidosLojaModel(
        lojaPedidos: json["loja_pedidos"] == null ? null : List<LojaPedido>.from(json["loja_pedidos"].map((x) => LojaPedido.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "loja_pedidos": lojaPedidos == null ? null : List<dynamic>.from(lojaPedidos.map((x) => x.toJson())),
    };
}

class LojaPedido {
    LojaPedido({
        this.atualizadoEm,
        this.aviso,
        this.bairro,
        this.criadoEm,
        this.endereco,
        this.entrega,
        this.localizacao,
        this.metodoPagamento,
        this.statusPedido,
        this.taxaEntrega,
        this.totalPedido,
        this.troco,
        this.lojaId,
        this.lojaPedidoId,
        this.lojaPedidoItems,
        this.lojaGeral,
    });

    DateTime atualizadoEm;
    String aviso;
    int bairro;
    DateTime criadoEm;
    String endereco;
    bool entrega;
    String localizacao;
    int metodoPagamento;
    int statusPedido;
    double taxaEntrega;
    double totalPedido;
    String troco;
    int lojaId;
    int lojaPedidoId;
    List<LojaPedidoItem> lojaPedidoItems;
    LojaGeral lojaGeral;

    factory LojaPedido.fromJson(Map<String, dynamic> json) => LojaPedido(
        atualizadoEm: json["atualizado_em"] == null ? null : DateTime.parse(json["atualizado_em"]),
        aviso: json["aviso"] == null ? null : json["aviso"],
        bairro: json["bairro"] == null ? null : json["bairro"],
        criadoEm: json["criado_em"] == null ? null : DateTime.parse(json["criado_em"]),
        endereco: json["endereco"] == null ? null : json["endereco"],
        entrega: json["entrega"] == null ? null : json["entrega"],
        localizacao: json["localizacao"] == null ? null : json["localizacao"],
        metodoPagamento: json["metodo_pagamento"] == null ? null : json["metodo_pagamento"],
        statusPedido: json["status_pedido"] == null ? null : json["status_pedido"],
        taxaEntrega: json["taxa_entrega"] == null ? null : json["taxa_entrega"].toDouble(),
        totalPedido: json["total_pedido"] == null ? null : json["total_pedido"].toDouble(),
        troco: json["troco"] == null ? null : json["troco"],
        lojaId: json["loja_id"] == null ? null : json["loja_id"],
        lojaPedidoId: json["loja_pedido_id"] == null ? null : json["loja_pedido_id"],
        lojaPedidoItems: json["loja_pedido_items"] == null ? null : List<LojaPedidoItem>.from(json["loja_pedido_items"].map((x) => LojaPedidoItem.fromJson(x))),
        lojaGeral: json["loja_geral"] == null ? null : LojaGeral.fromJson(json["loja_geral"]),
    );

    Map<String, dynamic> toJson() => {
        "atualizado_em": atualizadoEm == null ? null : "${atualizadoEm.year.toString().padLeft(4, '0')}-${atualizadoEm.month.toString().padLeft(2, '0')}-${atualizadoEm.day.toString().padLeft(2, '0')}",
        "aviso": aviso == null ? null : aviso,
        "bairro": bairro == null ? null : bairro,
        "criado_em": criadoEm == null ? null : "${criadoEm.year.toString().padLeft(4, '0')}-${criadoEm.month.toString().padLeft(2, '0')}-${criadoEm.day.toString().padLeft(2, '0')}",
        "endereco": endereco == null ? null : endereco,
        "entrega": entrega == null ? null : entrega,
        "localizacao": localizacao == null ? null : localizacao,
        "metodo_pagamento": metodoPagamento == null ? null : metodoPagamento,
        "status_pedido": statusPedido == null ? null : statusPedido,
        "taxa_entrega": taxaEntrega == null ? null : taxaEntrega,
        "total_pedido": totalPedido == null ? null : totalPedido,
        "troco": troco == null ? null : troco,
        "loja_id": lojaId == null ? null : lojaId,
        "loja_pedido_id": lojaPedidoId == null ? null : lojaPedidoId,
        "loja_pedido_items": lojaPedidoItems == null ? null : List<dynamic>.from(lojaPedidoItems.map((x) => x.toJson())),
        "loja_geral": lojaGeral == null ? null : lojaGeral.toJson(),
    };
}

class LojaGeral {
    LojaGeral({
        this.lojaNome,
    });

    String lojaNome;

    factory LojaGeral.fromJson(Map<String, dynamic> json) => LojaGeral(
        lojaNome: json["loja_nome"] == null ? null : json["loja_nome"],
    );

    Map<String, dynamic> toJson() => {
        "loja_nome": lojaNome == null ? null : lojaNome,
    };
}

class LojaPedidoItem {
    LojaPedidoItem({
        this.precoUnidade,
        this.quantidade,
        this.total,
        this.lojaProduto,
    });

    double precoUnidade;
    int quantidade;
    double total;
    LojaProduto lojaProduto;

    factory LojaPedidoItem.fromJson(Map<String, dynamic> json) => LojaPedidoItem(
        precoUnidade: json["preco_unidade"] == null ? null : json["preco_unidade"].toDouble(),
        quantidade: json["quantidade"] == null ? null : json["quantidade"],
        total: json["total"] == null ? null : json["total"].toDouble(),
        lojaProduto: json["loja_produto"] == null ? null : LojaProduto.fromJson(json["loja_produto"]),
    );

    Map<String, dynamic> toJson() => {
        "preco_unidade": precoUnidade == null ? null : precoUnidade,
        "quantidade": quantidade == null ? null : quantidade,
        "total": total == null ? null : total,
        "loja_produto": lojaProduto == null ? null : lojaProduto.toJson(),
    };
}

class LojaProduto {
    LojaProduto({
        this.foto1Link,
        this.produtoNome,
        this.descricao,
    });

    String foto1Link;
    String produtoNome;
    String descricao;

    factory LojaProduto.fromJson(Map<String, dynamic> json) => LojaProduto(
        foto1Link: json["foto1_link"] == null ? null : json["foto1_link"],
        produtoNome: json["produto_nome"] == null ? null : json["produto_nome"],
        descricao: json["descricao"] == null ? null : json["descricao"],
    );

    Map<String, dynamic> toJson() => {
        "foto1_link": foto1Link == null ? null : foto1Link,
        "produto_nome": produtoNome == null ? null : produtoNome,
        "descricao": descricao == null ? null : descricao,
    };
}

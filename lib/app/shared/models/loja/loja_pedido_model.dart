// To parse this JSON data, do
//
//     final lojaPedidoModel = lojaPedidoModelFromJson(jsonString);

import 'dart:convert';

LojaPedidoModel lojaPedidoModelFromJson(String str) => LojaPedidoModel.fromJson(json.decode(str));

String lojaPedidoModelToJson(LojaPedidoModel data) => json.encode(data.toJson());

class LojaPedidoModel {
    LojaPedidoModel({
        this.atualizadoEm,
        this.aviso,
        this.bairro,
        this.clienteFirebaseId,
        this.clienteId,
        this.criadoEm,
        this.endereco,
        this.entrega,
        this.entregadorId,
        this.latEntregador,
        this.lngEntregador,
        this.localizacao,
        this.lojaFirebaseId,
        this.lojaId,
        this.lojaPedidoId,
        this.metodoPagamento,
        this.numeroPedido,
        this.statusPedido,
        this.taxaEntrega,
        this.totalPedido,
        this.troco,
        this.lojaPedidoItems,
    });

    DateTime atualizadoEm;
    String aviso;
    int bairro;
    String clienteFirebaseId;
    int clienteId;
    DateTime criadoEm;
    String endereco;
    bool entrega;
    int entregadorId;
    double latEntregador;
    double lngEntregador;
    String localizacao;
    String lojaFirebaseId;
    int lojaId;
    int lojaPedidoId;
    int metodoPagamento;
    int numeroPedido;
    int statusPedido;
    double taxaEntrega;
    double totalPedido;
    String troco;
    List<LojaPedidoItem> lojaPedidoItems;

    factory LojaPedidoModel.fromJson(Map<String, dynamic> json) => LojaPedidoModel(
        atualizadoEm: json["atualizado_em"] == null ? null : DateTime.parse(json["atualizado_em"]),
        aviso: json["aviso"] == null ? null : json["aviso"],
        bairro: json["bairro"] == null ? null : json["bairro"],
        clienteFirebaseId: json["cliente_firebase_id"] == null ? null : json["cliente_firebase_id"],
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        criadoEm: json["criado_em"] == null ? null : DateTime.parse(json["criado_em"]),
        endereco: json["endereco"] == null ? null : json["endereco"],
        entrega: json["entrega"] == null ? null : json["entrega"],
        entregadorId: json["entregador_id"] == null ? null : json["entregador_id"],
        latEntregador: json["lat_entregador"] == null ? null : json["lat_entregador"].toDouble(),
        lngEntregador: json["lng_entregador"] == null ? null : json["lng_entregador"].toDouble(),
        localizacao: json["localizacao"] == null ? null : json["localizacao"],
        lojaFirebaseId: json["loja_firebase_id"] == null ? null : json["loja_firebase_id"],
        lojaId: json["loja_id"] == null ? null : json["loja_id"],
        lojaPedidoId: json["loja_pedido_id"] == null ? null : json["loja_pedido_id"],
        metodoPagamento: json["metodo_pagamento"] == null ? null : json["metodo_pagamento"],
        numeroPedido: json["numero_pedido"] == null ? null : json["numero_pedido"],
        statusPedido: json["status_pedido"] == null ? null : json["status_pedido"],
        taxaEntrega: json["taxa_entrega"] == null ? null : json["taxa_entrega"].toDouble(),
        totalPedido: json["total_pedido"] == null ? null : json["total_pedido"].toDouble(),
        troco: json["troco"] == null ? null : json["troco"],
        lojaPedidoItems: json["loja_pedido_items"] == null ? null : List<LojaPedidoItem>.from(json["loja_pedido_items"].map((x) => LojaPedidoItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "atualizado_em": atualizadoEm == null ? null : "${atualizadoEm.year.toString().padLeft(4, '0')}-${atualizadoEm.month.toString().padLeft(2, '0')}-${atualizadoEm.day.toString().padLeft(2, '0')}",
        "aviso": aviso == null ? null : aviso,
        "bairro": bairro == null ? null : bairro,
        "cliente_firebase_id": clienteFirebaseId == null ? null : clienteFirebaseId,
        "cliente_id": clienteId == null ? null : clienteId,
        "criado_em": criadoEm == null ? null : "${criadoEm.year.toString().padLeft(4, '0')}-${criadoEm.month.toString().padLeft(2, '0')}-${criadoEm.day.toString().padLeft(2, '0')}",
        "endereco": endereco == null ? null : endereco,
        "entrega": entrega == null ? null : entrega,
        "entregador_id": entregadorId == null ? null : entregadorId,
        "lat_entregador": latEntregador == null ? null : latEntregador,
        "lng_entregador": lngEntregador == null ? null : lngEntregador,
        "localizacao": localizacao == null ? null : localizacao,
        "loja_firebase_id": lojaFirebaseId == null ? null : lojaFirebaseId,
        "loja_id": lojaId == null ? null : lojaId,
        "loja_pedido_id": lojaPedidoId == null ? null : lojaPedidoId,
        "metodo_pagamento": metodoPagamento == null ? null : metodoPagamento,
        "numero_pedido": numeroPedido == null ? null : numeroPedido,
        "status_pedido": statusPedido == null ? null : statusPedido,
        "taxa_entrega": taxaEntrega == null ? null : taxaEntrega,
        "total_pedido": totalPedido == null ? null : totalPedido,
        "troco": troco == null ? null : troco,
        "loja_pedido_items": lojaPedidoItems == null ? null : List<dynamic>.from(lojaPedidoItems.map((x) => x.toJson())),
    };
}

class LojaPedidoItem {
    LojaPedidoItem({
        this.clienteId,
        this.lojaPedidoId,
        this.lojaPedidoItemId,
        this.precoUnidade,
        this.produtoLojaId,
        this.quantidade,
        this.total,
    });

    int clienteId;
    int lojaPedidoId;
    int lojaPedidoItemId;
    double precoUnidade;
    int produtoLojaId;
    int quantidade;
    double total;

    factory LojaPedidoItem.fromJson(Map<String, dynamic> json) => LojaPedidoItem(
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        lojaPedidoId: json["loja_pedido_id"] == null ? null : json["loja_pedido_id"],
        lojaPedidoItemId: json["loja_pedido_item_id"] == null ? null : json["loja_pedido_item_id"],
        precoUnidade: json["preco_unidade"] == null ? null : json["preco_unidade"].toDouble(),
        produtoLojaId: json["produto_loja_id"] == null ? null : json["produto_loja_id"],
        quantidade: json["quantidade"] == null ? null : json["quantidade"],
        total: json["total"] == null ? null : json["total"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "cliente_id": clienteId == null ? null : clienteId,
        "loja_pedido_id": lojaPedidoId == null ? null : lojaPedidoId,
        "loja_pedido_item_id": lojaPedidoItemId == null ? null : lojaPedidoItemId,
        "preco_unidade": precoUnidade == null ? null : precoUnidade,
        "produto_loja_id": produtoLojaId == null ? null : produtoLojaId,
        "quantidade": quantidade == null ? null : quantidade,
        "total": total == null ? null : total,
    };
}

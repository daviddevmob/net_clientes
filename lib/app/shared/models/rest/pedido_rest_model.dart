// To parse this JSON data, do
//
//     final pedidosRestModel = pedidosRestModelFromJson(jsonString);

import 'dart:convert';

PedidosRestModel pedidosRestModelFromJson(String str) => PedidosRestModel.fromJson(json.decode(str));

String pedidosRestModelToJson(PedidosRestModel data) => json.encode(data.toJson());

class PedidosRestModel {
    PedidosRestModel({
        this.restPedidos,
    });

    List<RestPedido> restPedidos;

    factory PedidosRestModel.fromJson(Map<String, dynamic> json) => PedidosRestModel(
        restPedidos: json["rest_pedidos"] == null ? null : List<RestPedido>.from(json["rest_pedidos"].map((x) => RestPedido.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rest_pedidos": restPedidos == null ? null : List<dynamic>.from(restPedidos.map((x) => x.toJson())),
    };
}

class RestPedido {
    RestPedido({
        this.aviso,
        this.bairro,
        this.clienteFirebaseId,
        this.criadoEm,
        this.endereco,
        this.entrega,
        this.clienteId,
        this.entregadorId,
        this.latEntregador,
        this.lngEntregador,
        this.localizacao,
        this.lojaFirebaseId,
        this.metodoPagamento,
        this.numeroPedido,
        this.restId,
        this.restPedidoId,
        this.statusPedido,
        this.taxaEntrega,
        this.totalPedido,
        this.troco,
        this.entregador,
        this.restItemPedidos,
    });

    String aviso;
    int bairro;
    String clienteFirebaseId;
    DateTime criadoEm;
    String endereco;
    bool entrega;
    int clienteId;
    int entregadorId;
    double latEntregador;
    double lngEntregador;
    String localizacao;
    String lojaFirebaseId;
    int metodoPagamento;
    int numeroPedido;
    int restId;
    int restPedidoId;
    int statusPedido;
    double taxaEntrega;
    double totalPedido;
    String troco;
    Entregador entregador;
    List<RestItemPedido> restItemPedidos;

    factory RestPedido.fromJson(Map<String, dynamic> json) => RestPedido(
        aviso: json["aviso"] == null ? null : json["aviso"],
        bairro: json["bairro"] == null ? null : json["bairro"],
        clienteFirebaseId: json["cliente_firebase_id"] == null ? null : json["cliente_firebase_id"],
        criadoEm: json["criado_em"] == null ? null : DateTime.parse(json["criado_em"]),
        endereco: json["endereco"] == null ? null : json["endereco"],
        entrega: json["entrega"] == null ? null : json["entrega"],
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        entregadorId: json["entregador_id"] == null ? null : json["entregador_id"],
        latEntregador: json["lat_entregador"] == null ? null : json["lat_entregador"].toDouble(),
        lngEntregador: json["lng_entregador"] == null ? null : json["lng_entregador"].toDouble(),
        localizacao: json["localizacao"] == null ? null : json["localizacao"],
        lojaFirebaseId: json["loja_firebase_id"] == null ? null : json["loja_firebase_id"],
        metodoPagamento: json["metodo_pagamento"] == null ? null : json["metodo_pagamento"],
        numeroPedido: json["numero_pedido"] == null ? null : json["numero_pedido"],
        restId: json["rest_id"] == null ? null : json["rest_id"],
        restPedidoId: json["rest_pedido_id"] == null ? null : json["rest_pedido_id"],
        statusPedido: json["status_pedido"] == null ? null : json["status_pedido"],
        taxaEntrega: json["taxa_entrega"] == null ? null : json["taxa_entrega"].toDouble(),
        totalPedido: json["total_pedido"] == null ? null : json["total_pedido"].toDouble(),
        troco: json["troco"] == null ? null : json["troco"],
        entregador: json["entregador"] == null ? null : Entregador.fromJson(json["entregador"]),
        restItemPedidos: json["rest_item_pedidos"] == null ? null : List<RestItemPedido>.from(json["rest_item_pedidos"].map((x) => RestItemPedido.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "aviso": aviso == null ? null : aviso,
        "bairro": bairro == null ? null : bairro,
        "cliente_firebase_id": clienteFirebaseId == null ? null : clienteFirebaseId,
        "criado_em": criadoEm == null ? null : "${criadoEm.year.toString().padLeft(4, '0')}-${criadoEm.month.toString().padLeft(2, '0')}-${criadoEm.day.toString().padLeft(2, '0')}",
        "endereco": endereco == null ? null : endereco,
        "entrega": entrega == null ? null : entrega,
        "cliente_id": clienteId == null ? null : clienteId,
        "entregador_id": entregadorId == null ? null : entregadorId,
        "lat_entregador": latEntregador == null ? null : latEntregador,
        "lng_entregador": lngEntregador == null ? null : lngEntregador,
        "localizacao": localizacao == null ? null : localizacao,
        "loja_firebase_id": lojaFirebaseId == null ? null : lojaFirebaseId,
        "metodo_pagamento": metodoPagamento == null ? null : metodoPagamento,
        "numero_pedido": numeroPedido == null ? null : numeroPedido,
        "rest_id": restId == null ? null : restId,
        "rest_pedido_id": restPedidoId == null ? null : restPedidoId,
        "status_pedido": statusPedido == null ? null : statusPedido,
        "taxa_entrega": taxaEntrega == null ? null : taxaEntrega,
        "total_pedido": totalPedido == null ? null : totalPedido,
        "troco": troco == null ? null : troco,
        "entregador": entregador == null ? null : entregador.toJson(),
        "rest_item_pedidos": restItemPedidos == null ? null : List<dynamic>.from(restItemPedidos.map((x) => x.toJson())),
    };
}

class Entregador {
    Entregador({
        this.nome,
        this.fotoLink,
    });

    String nome;
    String fotoLink;

    factory Entregador.fromJson(Map<String, dynamic> json) => Entregador(
        nome: json["nome"] == null ? null : json["nome"],
        fotoLink: json["foto_link"] == null ? null : json["foto_link"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome == null ? null : nome,
        "foto_link": fotoLink == null ? null : fotoLink,
    };
}

class RestItemPedido {
    RestItemPedido({
        this.complementos,
        this.opcoesProduto,
        this.precoUnidade,
        this.quantidade,
        this.restItemPedidoId,
        this.total,
    });

    String complementos;
    String opcoesProduto;
    double precoUnidade;
    int quantidade;
    int restItemPedidoId;
    double total;

    factory RestItemPedido.fromJson(Map<String, dynamic> json) => RestItemPedido(
        complementos: json["complementos"] == null ? null : json["complementos"],
        opcoesProduto: json["opcoes_produto"] == null ? null : json["opcoes_produto"],
        precoUnidade: json["preco_unidade"] == null ? null : json["preco_unidade"].toDouble(),
        quantidade: json["quantidade"] == null ? null : json["quantidade"],
        restItemPedidoId: json["rest_item_pedido_id"] == null ? null : json["rest_item_pedido_id"],
        total: json["total"] == null ? null : json["total"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "complementos": complementos == null ? null : complementos,
        "opcoes_produto": opcoesProduto == null ? null : opcoesProduto,
        "preco_unidade": precoUnidade == null ? null : precoUnidade,
        "quantidade": quantidade == null ? null : quantidade,
        "rest_item_pedido_id": restItemPedidoId == null ? null : restItemPedidoId,
        "total": total == null ? null : total,
    };
}

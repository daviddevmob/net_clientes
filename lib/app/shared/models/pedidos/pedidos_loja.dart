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
        this.numeroPedido,
        this.lojaId,
        this.lojaPedidoId,
        this.lojaPedidoItems,
        this.lojaGeral,
        this.entregadorId,
        this.entregador,
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
    int numeroPedido;
    int lojaId;
    int lojaPedidoId;
    List<LojaPedidoItem> lojaPedidoItems;
    LojaGeral lojaGeral;
    int entregadorId;
    Entregador entregador;

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
        numeroPedido: json["numero_pedido"] == null ? null : json["numero_pedido"],
        lojaId: json["loja_id"] == null ? null : json["loja_id"],
        lojaPedidoId: json["loja_pedido_id"] == null ? null : json["loja_pedido_id"],
        lojaPedidoItems: json["loja_pedido_items"] == null ? null : List<LojaPedidoItem>.from(json["loja_pedido_items"].map((x) => LojaPedidoItem.fromJson(x))),
        lojaGeral: json["loja_geral"] == null ? null : LojaGeral.fromJson(json["loja_geral"]),
        entregadorId: json["entregador_id"] == null ? null : json["entregador_id"],
        entregador: json["entregador"] == null ? null : Entregador.fromJson(json["entregador"]),
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
        "numero_pedido": numeroPedido == null ? null : numeroPedido,
        "loja_id": lojaId == null ? null : lojaId,
        "loja_pedido_id": lojaPedidoId == null ? null : lojaPedidoId,
        "loja_pedido_items": lojaPedidoItems == null ? null : List<dynamic>.from(lojaPedidoItems.map((x) => x.toJson())),
        "loja_geral": lojaGeral == null ? null : lojaGeral.toJson(),
        "entregador_id": entregadorId == null ? null : entregadorId,
        "entregador": entregador == null ? null : entregador.toJson(),
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

class LojaGeral {
    LojaGeral({
        this.lojaNome,
        this.usuario,
    });

    String lojaNome;
    Usuario usuario;

    factory LojaGeral.fromJson(Map<String, dynamic> json) => LojaGeral(
        lojaNome: json["loja_nome"] == null ? null : json["loja_nome"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "loja_nome": lojaNome == null ? null : lojaNome,
        "usuario": usuario == null ? null : usuario.toJson(),
    };
}

class Usuario {
    Usuario({
        this.localizacao,
    });

    Localizacao localizacao;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        localizacao: json["localizacao"] == null ? null : Localizacao.fromJson(json["localizacao"]),
    );

    Map<String, dynamic> toJson() => {
        "localizacao": localizacao == null ? null : localizacao.toJson(),
    };
}

class Localizacao {
    Localizacao({
        this.bairro,
        this.complemento,
        this.endereco,
        this.mapaLink,
    });

    int bairro;
    String complemento;
    String endereco;
    String mapaLink;

    factory Localizacao.fromJson(Map<String, dynamic> json) => Localizacao(
        bairro: json["bairro"] == null ? null : json["bairro"],
        complemento: json["complemento"] == null ? null : json["complemento"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        mapaLink: json["mapa_link"] == null ? null : json["mapa_link"],
    );

    Map<String, dynamic> toJson() => {
        "bairro": bairro == null ? null : bairro,
        "complemento": complemento == null ? null : complemento,
        "endereco": endereco == null ? null : endereco,
        "mapa_link": mapaLink == null ? null : mapaLink,
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

    dynamic foto1Link;
    String produtoNome;
    String descricao;

    factory LojaProduto.fromJson(Map<String, dynamic> json) => LojaProduto(
        foto1Link: json["foto1_link"],
        produtoNome: json["produto_nome"] == null ? null : json["produto_nome"],
        descricao: json["descricao"] == null ? null : json["descricao"],
    );

    Map<String, dynamic> toJson() => {
        "foto1_link": foto1Link,
        "produto_nome": produtoNome == null ? null : produtoNome,
        "descricao": descricao == null ? null : descricao,
    };
}

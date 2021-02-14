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
        this.restId,
        this.restPedidoId,
        this.restItemPedidos,
        this.restGeral,
        this.entregadorId,
        this.entregador,
        this.restAvaliacao,
    });

    String aviso;
    String bairro;
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
    int restId;
    int restPedidoId;
    List<RestItemPedido> restItemPedidos;
    RestGeral restGeral;
    int entregadorId;
    Entregador entregador;
    RestAvaliacao restAvaliacao;

    factory RestPedido.fromJson(Map<String, dynamic> json) => RestPedido(
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
        restId: json["rest_id"] == null ? null : json["rest_id"],
        restPedidoId: json["rest_pedido_id"] == null ? null : json["rest_pedido_id"],
        restItemPedidos: json["rest_item_pedidos"] == null ? null : List<RestItemPedido>.from(json["rest_item_pedidos"].map((x) => RestItemPedido.fromJson(x))),
        restGeral: json["rest_geral"] == null ? null : RestGeral.fromJson(json["rest_geral"]),
        entregadorId: json["entregador_id"] == null ? null : json["entregador_id"],
        entregador: json["entregador"] == null ? null : Entregador.fromJson(json["entregador"]),
        restAvaliacao: json["rest_avaliacao"] == null ? null : RestAvaliacao.fromJson(json["rest_avaliacao"]),
    );

    Map<String, dynamic> toJson() => {
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
        "rest_id": restId == null ? null : restId,
        "rest_pedido_id": restPedidoId == null ? null : restPedidoId,
        "rest_item_pedidos": restItemPedidos == null ? null : List<dynamic>.from(restItemPedidos.map((x) => x.toJson())),
        "rest_geral": restGeral == null ? null : restGeral.toJson(),
        "entregador_id": entregadorId == null ? null : entregadorId,
        "entregador": entregador == null ? null : entregador.toJson(),
        "rest_avaliacao": restAvaliacao == null ? null : restAvaliacao.toJson(),
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

class RestAvaliacao {
    RestAvaliacao({
        this.nota,
        this.restComentarioAvaliacao,
        this.texto,
        this.restAvaliacaoId,
    });

    double nota;
    RestComentarioAvaliacao restComentarioAvaliacao;
    String texto;
    int restAvaliacaoId;

    factory RestAvaliacao.fromJson(Map<String, dynamic> json) => RestAvaliacao(
        nota: json["nota"] == null ? null : json["nota"].toDouble(),
        restComentarioAvaliacao: json["rest_comentario_avaliacao"] == null ? null : RestComentarioAvaliacao.fromJson(json["rest_comentario_avaliacao"]),
        texto: json["texto"] == null ? null : json["texto"],
        restAvaliacaoId: json["rest_avaliacao_id"] == null ? null : json["rest_avaliacao_id"],
    );

    Map<String, dynamic> toJson() => {
        "nota": nota == null ? null : nota,
        "rest_comentario_avaliacao": restComentarioAvaliacao == null ? null : restComentarioAvaliacao.toJson(),
        "texto": texto == null ? null : texto,
        "rest_avaliacao_id": restAvaliacaoId == null ? null : restAvaliacaoId,
    };
}

class RestComentarioAvaliacao {
    RestComentarioAvaliacao({
        this.text,
        this.restComentarioAvaliacaoId,
    });

    String text;
    int restComentarioAvaliacaoId;

    factory RestComentarioAvaliacao.fromJson(Map<String, dynamic> json) => RestComentarioAvaliacao(
        text: json["text"] == null ? null : json["text"],
        restComentarioAvaliacaoId: json["rest_comentario_avaliacao_id"] == null ? null : json["rest_comentario_avaliacao_id"],
    );

    Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "rest_comentario_avaliacao_id": restComentarioAvaliacaoId == null ? null : restComentarioAvaliacaoId,
    };
}

class RestGeral {
    RestGeral({
        this.restNome,
        this.usuario,
    });

    String restNome;
    Usuario usuario;

    factory RestGeral.fromJson(Map<String, dynamic> json) => RestGeral(
        restNome: json["rest_nome"] == null ? null : json["rest_nome"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "rest_nome": restNome == null ? null : restNome,
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

class RestItemPedido {
    RestItemPedido({
        this.precoUnidade,
        this.quantidade,
        this.total,
        this.restProduto,
        this.complementos,
        this.opcoesProduto,
    });

    double precoUnidade;
    int quantidade;
    double total;
    RestProduto restProduto;
    String complementos;
    String opcoesProduto;

    factory RestItemPedido.fromJson(Map<String, dynamic> json) => RestItemPedido(
        precoUnidade: json["preco_unidade"] == null ? null : json["preco_unidade"].toDouble(),
        quantidade: json["quantidade"] == null ? null : json["quantidade"],
        total: json["total"] == null ? null : json["total"].toDouble(),
        restProduto: json["rest_produto"] == null ? null : RestProduto.fromJson(json["rest_produto"]),
        complementos: json["complementos"] == null ? null : json["complementos"],
        opcoesProduto: json["opcoes_produto"] == null ? null : json["opcoes_produto"],
    );

    Map<String, dynamic> toJson() => {
        "preco_unidade": precoUnidade == null ? null : precoUnidade,
        "quantidade": quantidade == null ? null : quantidade,
        "total": total == null ? null : total,
        "rest_produto": restProduto == null ? null : restProduto.toJson(),
        "complementos": complementos == null ? null : complementos,
        "opcoes_produto": opcoesProduto == null ? null : opcoesProduto,
    };
}

class RestProduto {
    RestProduto({
        this.foto,
        this.nome,
        this.descricao,
    });

    String foto;
    String nome;
    String descricao;

    factory RestProduto.fromJson(Map<String, dynamic> json) => RestProduto(
        foto: json["foto"] == null ? null : json["foto"],
        nome: json["nome"] == null ? null : json["nome"],
        descricao: json["descricao"] == null ? null : json["descricao"],
    );

    Map<String, dynamic> toJson() => {
        "foto": foto == null ? null : foto,
        "nome": nome == null ? null : nome,
        "descricao": descricao == null ? null : descricao,
    };
}

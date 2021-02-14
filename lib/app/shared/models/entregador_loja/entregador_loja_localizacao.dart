// To parse this JSON data, do
//
//     final entregadorLojaLocalizacaoModel = entregadorLojaLocalizacaoModelFromJson(jsonString);

import 'dart:convert';

EntregadorLojaLocalizacaoModel entregadorLojaLocalizacaoModelFromJson(String str) => EntregadorLojaLocalizacaoModel.fromJson(json.decode(str));

String entregadorLojaLocalizacaoModelToJson(EntregadorLojaLocalizacaoModel data) => json.encode(data.toJson());

class EntregadorLojaLocalizacaoModel {
    EntregadorLojaLocalizacaoModel({
        this.fotoLink,
        this.nome,
        this.entregadorLocalizacao,
        this.lojaPedidos,
    });

    String fotoLink;
    String nome;
    EntregadorLocalizacao entregadorLocalizacao;
    List<LojaPedido> lojaPedidos;

    factory EntregadorLojaLocalizacaoModel.fromJson(Map<String, dynamic> json) => EntregadorLojaLocalizacaoModel(
        fotoLink: json["foto_link"] == null ? null : json["foto_link"],
        nome: json["nome"] == null ? null : json["nome"],
        entregadorLocalizacao: json["entregador_localizacao"] == null ? null : EntregadorLocalizacao.fromJson(json["entregador_localizacao"]),
        lojaPedidos: json["loja_pedidos"] == null ? null : List<LojaPedido>.from(json["loja_pedidos"].map((x) => LojaPedido.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foto_link": fotoLink == null ? null : fotoLink,
        "nome": nome == null ? null : nome,
        "entregador_localizacao": entregadorLocalizacao == null ? null : entregadorLocalizacao.toJson(),
        "loja_pedidos": lojaPedidos == null ? null : List<dynamic>.from(lojaPedidos.map((x) => x.toJson())),
    };
}

class EntregadorLocalizacao {
    EntregadorLocalizacao({
        this.lat,
        this.lgt,
        this.ativo,
    });

    double lat;
    double lgt;
    bool ativo;

    factory EntregadorLocalizacao.fromJson(Map<String, dynamic> json) => EntregadorLocalizacao(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lgt: json["lgt"] == null ? null : json["lgt"].toDouble(),
        ativo: json["ativo"] == null ? null : json["ativo"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lgt": lgt == null ? null : lgt,
        "ativo": ativo == null ? null : ativo,
    };
}

class LojaPedido {
    LojaPedido({
        this.statusPedido,
    });

    int statusPedido;

    factory LojaPedido.fromJson(Map<String, dynamic> json) => LojaPedido(
        statusPedido: json["status_pedido"] == null ? null : json["status_pedido"],
    );

    Map<String, dynamic> toJson() => {
        "status_pedido": statusPedido == null ? null : statusPedido,
    };
}

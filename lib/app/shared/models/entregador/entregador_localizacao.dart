// To parse this JSON data, do
//
//     final entregadorLocalizacaoModel = entregadorLocalizacaoModelFromJson(jsonString);

import 'dart:convert';

EntregadorLocalizacaoModel entregadorLocalizacaoModelFromJson(String str) => EntregadorLocalizacaoModel.fromJson(json.decode(str));

String entregadorLocalizacaoModelToJson(EntregadorLocalizacaoModel data) => json.encode(data.toJson());

class EntregadorLocalizacaoModel {
    EntregadorLocalizacaoModel({
        this.fotoLink,
        this.nome,
        this.entregadorLocalizacao,
        this.restPedidos,
    });

    String fotoLink;
    String nome;
    EntregadorLocalizacao entregadorLocalizacao;
    List<RestPedido> restPedidos;

    factory EntregadorLocalizacaoModel.fromJson(Map<String, dynamic> json) => EntregadorLocalizacaoModel(
        fotoLink: json["foto_link"] == null ? null : json["foto_link"],
        nome: json["nome"] == null ? null : json["nome"],
        entregadorLocalizacao: json["entregador_localizacao"] == null ? null : EntregadorLocalizacao.fromJson(json["entregador_localizacao"]),
        restPedidos: json["rest_pedidos"] == null ? null : List<RestPedido>.from(json["rest_pedidos"].map((x) => RestPedido.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foto_link": fotoLink == null ? null : fotoLink,
        "nome": nome == null ? null : nome,
        "entregador_localizacao": entregadorLocalizacao == null ? null : entregadorLocalizacao.toJson(),
        "rest_pedidos": restPedidos == null ? null : List<dynamic>.from(restPedidos.map((x) => x.toJson())),
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

class RestPedido {
    RestPedido({
        this.statusPedido,
    });

    int statusPedido;

    factory RestPedido.fromJson(Map<String, dynamic> json) => RestPedido(
        statusPedido: json["status_pedido"] == null ? null : json["status_pedido"],
    );

    Map<String, dynamic> toJson() => {
        "status_pedido": statusPedido == null ? null : statusPedido,
    };
}

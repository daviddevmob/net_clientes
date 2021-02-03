// To parse this JSON data, do
//
//     final restListModel = restListModelFromJson(jsonString);

import 'dart:convert';

RestListModel restListModelFromJson(String str) => RestListModel.fromJson(json.decode(str));

String restListModelToJson(RestListModel data) => json.encode(data.toJson());

class RestListModel {
    RestListModel({
        this.restGeral,
    });

    List<RestGeral> restGeral;

    factory RestListModel.fromJson(Map<String, dynamic> json) => RestListModel(
        restGeral: json["rest_geral"] == null ? null : List<RestGeral>.from(json["rest_geral"].map((x) => RestGeral.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rest_geral": restGeral == null ? null : List<dynamic>.from(restGeral.map((x) => x.toJson())),
    };
}

class RestGeral {
    RestGeral({
        this.categoria,
        this.restNome,
        this.entregaDomicilio,
        this.retiradaLoja,
        this.fotoLink,
        this.restId,
        this.usuario,
    });

    int categoria;
    String restNome;
    bool entregaDomicilio;
    bool retiradaLoja;
    String fotoLink;
    int restId;
    Usuario usuario;

    factory RestGeral.fromJson(Map<String, dynamic> json) => RestGeral(
        categoria: json["categoria"] == null ? null : json["categoria"],
        restNome: json["rest_nome"] == null ? null : json["rest_nome"],
        entregaDomicilio: json["entrega_domicilio"] == null ? null : json["entrega_domicilio"],
        retiradaLoja: json["retirada_loja"] == null ? null : json["retirada_loja"],
        fotoLink: json["foto_link"] == null ? null : json["foto_link"],
        restId: json["rest_id"] == null ? null : json["rest_id"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria == null ? null : categoria,
        "rest_nome": restNome == null ? null : restNome,
        "entrega_domicilio": entregaDomicilio == null ? null : entregaDomicilio,
        "retirada_loja": retiradaLoja == null ? null : retiradaLoja,
        "foto_link": fotoLink == null ? null : fotoLink,
        "rest_id": restId == null ? null : restId,
        "usuario": usuario == null ? null : usuario.toJson(),
    };
}

class Usuario {
    Usuario({
        this.localizacao,
        this.taxaEntrega,
    });

    Localizacao localizacao;
    TaxaEntrega taxaEntrega;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        localizacao: json["localizacao"] == null ? null : Localizacao.fromJson(json["localizacao"]),
        taxaEntrega: json["taxa_entrega"] == null ? null : TaxaEntrega.fromJson(json["taxa_entrega"]),
    );

    Map<String, dynamic> toJson() => {
        "localizacao": localizacao == null ? null : localizacao.toJson(),
        "taxa_entrega": taxaEntrega == null ? null : taxaEntrega.toJson(),
    };
}

class Localizacao {
    Localizacao({
        this.mapaLink,
        this.bairro,
    });

    String mapaLink;
    int bairro;

    factory Localizacao.fromJson(Map<String, dynamic> json) => Localizacao(
        mapaLink: json["mapa_link"] == null ? null : json["mapa_link"],
        bairro: json["bairro"] == null ? null : json["bairro"],
    );

    Map<String, dynamic> toJson() => {
        "mapa_link": mapaLink == null ? null : mapaLink,
        "bairro": bairro == null ? null : bairro,
    };
}

class TaxaEntrega {
    TaxaEntrega({
        this.taxaEntrega,
    });

    double taxaEntrega;

    factory TaxaEntrega.fromJson(Map<String, dynamic> json) => TaxaEntrega(
        taxaEntrega: json["taxa_entrega"] == null ? null : json["taxa_entrega"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "taxa_entrega": taxaEntrega == null ? null : taxaEntrega,
    };
}

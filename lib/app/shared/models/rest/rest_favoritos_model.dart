// To parse this JSON data, do
//
//     final restFavoritoModelList = restFavoritoModelListFromJson(jsonString);

import 'dart:convert';

RestFavoritoModelList restFavoritoModelListFromJson(String str) => RestFavoritoModelList.fromJson(json.decode(str));

String restFavoritoModelListToJson(RestFavoritoModelList data) => json.encode(data.toJson());

class RestFavoritoModelList {
    RestFavoritoModelList({
        this.clienteFavoritoRest,
    });

    List<ClienteFavoritoRest> clienteFavoritoRest;

    factory RestFavoritoModelList.fromJson(Map<String, dynamic> json) => RestFavoritoModelList(
        clienteFavoritoRest: json["cliente_favorito_rest"] == null ? null : List<ClienteFavoritoRest>.from(json["cliente_favorito_rest"].map((x) => ClienteFavoritoRest.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cliente_favorito_rest": clienteFavoritoRest == null ? null : List<dynamic>.from(clienteFavoritoRest.map((x) => x.toJson())),
    };
}

class ClienteFavoritoRest {
    ClienteFavoritoRest({
        this.restGeral,
    });

    RestGeral restGeral;

    factory ClienteFavoritoRest.fromJson(Map<String, dynamic> json) => ClienteFavoritoRest(
        restGeral: json["rest_geral"] == null ? null : RestGeral.fromJson(json["rest_geral"]),
    );

    Map<String, dynamic> toJson() => {
        "rest_geral": restGeral == null ? null : restGeral.toJson(),
    };
}

class RestGeral {
    RestGeral({
        this.categoria,
        this.restNome,
        this.entregaDomicilio,
        this.retiradaLoja,
        this.fotoLink,
        this.usuario,
        this.restId,
        this.restAvaliacaos,
    });

    int categoria;
    String restNome;
    bool entregaDomicilio;
    bool retiradaLoja;
    String fotoLink;
    Usuario usuario;
    int restId;
    List<RestAvaliacao> restAvaliacaos;

    factory RestGeral.fromJson(Map<String, dynamic> json) => RestGeral(
        categoria: json["categoria"] == null ? null : json["categoria"],
        restNome: json["rest_nome"] == null ? null : json["rest_nome"],
        entregaDomicilio: json["entrega_domicilio"] == null ? null : json["entrega_domicilio"],
        retiradaLoja: json["retirada_loja"] == null ? null : json["retirada_loja"],
        fotoLink: json["foto_link"] == null ? null : json["foto_link"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
        restId: json["rest_id"] == null ? null : json["rest_id"],
        restAvaliacaos: json["rest_avaliacaos"] == null ? null : List<RestAvaliacao>.from(json["rest_avaliacaos"].map((x) => RestAvaliacao.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria == null ? null : categoria,
        "rest_nome": restNome == null ? null : restNome,
        "entrega_domicilio": entregaDomicilio == null ? null : entregaDomicilio,
        "retirada_loja": retiradaLoja == null ? null : retiradaLoja,
        "foto_link": fotoLink == null ? null : fotoLink,
        "usuario": usuario == null ? null : usuario.toJson(),
        "rest_id": restId == null ? null : restId,
        "rest_avaliacaos": restAvaliacaos == null ? null : List<dynamic>.from(restAvaliacaos.map((x) => x.toJson())),
    };
}

class RestAvaliacao {
    RestAvaliacao({
        this.nota,
    });

    double nota;

    factory RestAvaliacao.fromJson(Map<String, dynamic> json) => RestAvaliacao(
        nota: json["nota"] == null ? null : json["nota"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "nota": nota == null ? null : nota,
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

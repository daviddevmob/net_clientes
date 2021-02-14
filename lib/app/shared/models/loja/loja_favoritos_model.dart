// To parse this JSON data, do
//
//     final lojaFavotiraModel = lojaFavotiraModelFromJson(jsonString);

import 'dart:convert';

LojaFavotiraModel lojaFavotiraModelFromJson(String str) => LojaFavotiraModel.fromJson(json.decode(str));

String lojaFavotiraModelToJson(LojaFavotiraModel data) => json.encode(data.toJson());

class LojaFavotiraModel {
    LojaFavotiraModel({
        this.clienteFavoritoLoja,
    });

    List<ClienteFavoritoLoja> clienteFavoritoLoja;

    factory LojaFavotiraModel.fromJson(Map<String, dynamic> json) => LojaFavotiraModel(
        clienteFavoritoLoja: json["cliente_favorito_loja"] == null ? null : List<ClienteFavoritoLoja>.from(json["cliente_favorito_loja"].map((x) => ClienteFavoritoLoja.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cliente_favorito_loja": clienteFavoritoLoja == null ? null : List<dynamic>.from(clienteFavoritoLoja.map((x) => x.toJson())),
    };
}

class ClienteFavoritoLoja {
    ClienteFavoritoLoja({
        this.lojaGeral,
    });

    LojaGeral lojaGeral;

    factory ClienteFavoritoLoja.fromJson(Map<String, dynamic> json) => ClienteFavoritoLoja(
        lojaGeral: json["loja_geral"] == null ? null : LojaGeral.fromJson(json["loja_geral"]),
    );

    Map<String, dynamic> toJson() => {
        "loja_geral": lojaGeral == null ? null : lojaGeral.toJson(),
    };
}

class LojaGeral {
    LojaGeral({
        this.categoria,
        this.lojaNome,
        this.entregaDomicilio,
        this.lojaFisica,
        this.fotoPerfilLink,
        this.usuario,
        this.lojaId,
        this.lojaAvaliacaos,
    });

    int categoria;
    String lojaNome;
    bool entregaDomicilio;
    bool lojaFisica;
    String fotoPerfilLink;
    Usuario usuario;
    int lojaId;
    List<LojaAvaliacao> lojaAvaliacaos;

    factory LojaGeral.fromJson(Map<String, dynamic> json) => LojaGeral(
        categoria: json["categoria"] == null ? null : json["categoria"],
        lojaNome: json["loja_nome"] == null ? null : json["loja_nome"],
        entregaDomicilio: json["entrega_domicilio"] == null ? null : json["entrega_domicilio"],
        lojaFisica: json["loja_fisica"] == null ? null : json["loja_fisica"],
        fotoPerfilLink: json["foto_perfil_link"] == null ? null : json["foto_perfil_link"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
        lojaId: json["loja_id"] == null ? null : json["loja_id"],
        lojaAvaliacaos: json["loja_avaliacaos"] == null ? null : List<LojaAvaliacao>.from(json["loja_avaliacaos"].map((x) => LojaAvaliacao.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria == null ? null : categoria,
        "loja_nome": lojaNome == null ? null : lojaNome,
        "entrega_domicilio": entregaDomicilio == null ? null : entregaDomicilio,
        "loja_fisica": lojaFisica == null ? null : lojaFisica,
        "foto_perfil_link": fotoPerfilLink == null ? null : fotoPerfilLink,
        "usuario": usuario == null ? null : usuario.toJson(),
        "loja_id": lojaId == null ? null : lojaId,
        "loja_avaliacaos": lojaAvaliacaos == null ? null : List<dynamic>.from(lojaAvaliacaos.map((x) => x.toJson())),
    };
}

class LojaAvaliacao {
    LojaAvaliacao({
        this.nota,
    });

    double nota;

    factory LojaAvaliacao.fromJson(Map<String, dynamic> json) => LojaAvaliacao(
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

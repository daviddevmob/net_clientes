// To parse this JSON data, do
//
//     final listLojasModel = listLojasModelFromJson(jsonString);

import 'dart:convert';

ListLojasModel listLojasModelFromJson(String str) => ListLojasModel.fromJson(json.decode(str));

String listLojasModelToJson(ListLojasModel data) => json.encode(data.toJson());

class ListLojasModel {
    ListLojasModel({
        this.lojaGeral,
    });

    List<LojaGeral> lojaGeral;

    factory ListLojasModel.fromJson(Map<String, dynamic> json) => ListLojasModel(
        lojaGeral: json["loja_geral"] == null ? null : List<LojaGeral>.from(json["loja_geral"].map((x) => LojaGeral.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "loja_geral": lojaGeral == null ? null : List<dynamic>.from(lojaGeral.map((x) => x.toJson())),
    };
}

class LojaGeral {
    LojaGeral({
        this.categoria,
        this.lojaNome,
        this.entregaDomicilio,
        this.lojaFisica,
        this.fotoPerfilLink,
        this.lojaId,
        this.usuario,
        this.lojaAvaliacaos,
    });

    int categoria;
    String lojaNome;
    bool entregaDomicilio;
    bool lojaFisica;
    String fotoPerfilLink;
    int lojaId;
    Usuario usuario;
    List<LojaAvaliacao> lojaAvaliacaos;

    factory LojaGeral.fromJson(Map<String, dynamic> json) => LojaGeral(
        categoria: json["categoria"] == null ? null : json["categoria"],
        lojaNome: json["loja_nome"] == null ? null : json["loja_nome"],
        entregaDomicilio: json["entrega_domicilio"] == null ? null : json["entrega_domicilio"],
        lojaFisica: json["loja_fisica"] == null ? null : json["loja_fisica"],
        fotoPerfilLink: json["foto_perfil_link"] == null ? null : json["foto_perfil_link"],
        lojaId: json["loja_id"] == null ? null : json["loja_id"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
        lojaAvaliacaos: json["loja_avaliacaos"] == null ? null : List<LojaAvaliacao>.from(json["loja_avaliacaos"].map((x) => LojaAvaliacao.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria == null ? null : categoria,
        "loja_nome": lojaNome == null ? null : lojaNome,
        "entrega_domicilio": entregaDomicilio == null ? null : entregaDomicilio,
        "loja_fisica": lojaFisica == null ? null : lojaFisica,
        "foto_perfil_link": fotoPerfilLink == null ? null : fotoPerfilLink,
        "loja_id": lojaId == null ? null : lojaId,
        "usuario": usuario == null ? null : usuario.toJson(),
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

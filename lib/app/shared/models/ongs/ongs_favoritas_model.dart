// To parse this JSON data, do
//
//     final ongsFaviritasModel = ongsFaviritasModelFromJson(jsonString);

import 'dart:convert';

OngsFaviritasModel ongsFaviritasModelFromJson(String str) => OngsFaviritasModel.fromJson(json.decode(str));

String ongsFaviritasModelToJson(OngsFaviritasModel data) => json.encode(data.toJson());

class OngsFaviritasModel {
    OngsFaviritasModel({
        this.clienteFavoritaOng,
    });

    List<ClienteFavoritaOng> clienteFavoritaOng;

    factory OngsFaviritasModel.fromJson(Map<String, dynamic> json) => OngsFaviritasModel(
        clienteFavoritaOng: json["cliente_favorita_ong"] == null ? null : List<ClienteFavoritaOng>.from(json["cliente_favorita_ong"].map((x) => ClienteFavoritaOng.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cliente_favorita_ong": clienteFavoritaOng == null ? null : List<dynamic>.from(clienteFavoritaOng.map((x) => x.toJson())),
    };
}

class ClienteFavoritaOng {
    ClienteFavoritaOng({
        this.ongGeral,
    });

    OngGeral ongGeral;

    factory ClienteFavoritaOng.fromJson(Map<String, dynamic> json) => ClienteFavoritaOng(
        ongGeral: json["ong_geral"] == null ? null : OngGeral.fromJson(json["ong_geral"]),
    );

    Map<String, dynamic> toJson() => {
        "ong_geral": ongGeral == null ? null : ongGeral.toJson(),
    };
}

class OngGeral {
    OngGeral({
        this.ongNome,
        this.ongImagemPerfil,
        this.usuarioId,
        this.ongId,
        this.usuario,
    });

    String ongNome;
    String ongImagemPerfil;
    int usuarioId;
    int ongId;
    Usuario usuario;

    factory OngGeral.fromJson(Map<String, dynamic> json) => OngGeral(
        ongNome: json["ong_nome"] == null ? null : json["ong_nome"],
        ongImagemPerfil: json["ong_imagem_perfil"] == null ? null : json["ong_imagem_perfil"],
        usuarioId: json["usuario_id"] == null ? null : json["usuario_id"],
        ongId: json["ong_id"] == null ? null : json["ong_id"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "ong_nome": ongNome == null ? null : ongNome,
        "ong_imagem_perfil": ongImagemPerfil == null ? null : ongImagemPerfil,
        "usuario_id": usuarioId == null ? null : usuarioId,
        "ong_id": ongId == null ? null : ongId,
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
    });

    int bairro;

    factory Localizacao.fromJson(Map<String, dynamic> json) => Localizacao(
        bairro: json["bairro"] == null ? null : json["bairro"],
    );

    Map<String, dynamic> toJson() => {
        "bairro": bairro == null ? null : bairro,
    };
}

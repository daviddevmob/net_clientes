// To parse this JSON data, do
//
//     final ongSearchModel = ongSearchModelFromJson(jsonString);

import 'dart:convert';

OngSearchModel ongSearchModelFromJson(String str) => OngSearchModel.fromJson(json.decode(str));

String ongSearchModelToJson(OngSearchModel data) => json.encode(data.toJson());

class OngSearchModel {
    OngSearchModel({
        this.usuario,
    });

    List<Usuario> usuario;

    factory OngSearchModel.fromJson(Map<String, dynamic> json) => OngSearchModel(
        usuario: json["usuario"] == null ? null : List<Usuario>.from(json["usuario"].map((x) => Usuario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario == null ? null : List<dynamic>.from(usuario.map((x) => x.toJson())),
    };
}

class Usuario {
    Usuario({
        this.localizacao,
        this.ongGeral,
    });

    Localizacao localizacao;
    OngGeral ongGeral;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        localizacao: json["localizacao"] == null ? null : Localizacao.fromJson(json["localizacao"]),
        ongGeral: json["ong_geral"] == null ? null : OngGeral.fromJson(json["ong_geral"]),
    );

    Map<String, dynamic> toJson() => {
        "localizacao": localizacao == null ? null : localizacao.toJson(),
        "ong_geral": ongGeral == null ? null : ongGeral.toJson(),
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

class OngGeral {
    OngGeral({
        this.ongNome,
        this.ongDescricao,
        this.ongImagemPerfil,
        this.usuarioId,
    });

    String ongNome;
    String ongDescricao;
    String ongImagemPerfil;
    int usuarioId;

    factory OngGeral.fromJson(Map<String, dynamic> json) => OngGeral(
        ongNome: json["ong_nome"] == null ? null : json["ong_nome"],
        ongDescricao: json["ong_descricao"] == null ? null : json["ong_descricao"],
        ongImagemPerfil: json["ong_imagem_perfil"] == null ? null : json["ong_imagem_perfil"],
        usuarioId: json["usuario_id"] == null ? null : json["usuario_id"],
    );

    Map<String, dynamic> toJson() => {
        "ong_nome": ongNome == null ? null : ongNome,
        "ong_descricao": ongDescricao == null ? null : ongDescricao,
        "ong_imagem_perfil": ongImagemPerfil == null ? null : ongImagemPerfil,
        "usuario_id": usuarioId == null ? null : usuarioId,
    };
}

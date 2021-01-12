// To parse this JSON data, do
//
//     final servicosSearchModel = servicosSearchModelFromJson(jsonString);

import 'dart:convert';

ServicosSearchModel servicosSearchModelFromJson(String str) => ServicosSearchModel.fromJson(json.decode(str));

String servicosSearchModelToJson(ServicosSearchModel data) => json.encode(data.toJson());

class ServicosSearchModel {
    ServicosSearchModel({
        this.usuario,
    });

    List<Usuario> usuario;

    factory ServicosSearchModel.fromJson(Map<String, dynamic> json) => ServicosSearchModel(
        usuario: json["usuario"] == null ? null : List<Usuario>.from(json["usuario"].map((x) => Usuario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario == null ? null : List<dynamic>.from(usuario.map((x) => x.toJson())),
    };
}

class Usuario {
    Usuario({
        this.localizacao,
        this.servicoGeral,
    });

    Localizacao localizacao;
    ServicoGeral servicoGeral;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        localizacao: json["localizacao"] == null ? null : Localizacao.fromJson(json["localizacao"]),
        servicoGeral: json["servico_geral"] == null ? null : ServicoGeral.fromJson(json["servico_geral"]),
    );

    Map<String, dynamic> toJson() => {
        "localizacao": localizacao == null ? null : localizacao.toJson(),
        "servico_geral": servicoGeral == null ? null : servicoGeral.toJson(),
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

class ServicoGeral {
    ServicoGeral({
        this.servicoNome,
        this.categoria,
        this.servicoFotoPerfil,
        this.usuarioId,
    });

    String servicoNome;
    int categoria;
    String servicoFotoPerfil;
    int usuarioId;

    factory ServicoGeral.fromJson(Map<String, dynamic> json) => ServicoGeral(
        servicoNome: json["servico_nome"] == null ? null : json["servico_nome"],
        categoria: json["categoria"] == null ? null : json["categoria"],
        servicoFotoPerfil: json["servico_foto_perfil"] == null ? null : json["servico_foto_perfil"],
        usuarioId: json["usuario_id"] == null ? null : json["usuario_id"],
    );

    Map<String, dynamic> toJson() => {
        "servico_nome": servicoNome == null ? null : servicoNome,
        "categoria": categoria == null ? null : categoria,
        "servico_foto_perfil": servicoFotoPerfil == null ? null : servicoFotoPerfil,
        "usuario_id": usuarioId == null ? null : usuarioId,
    };
}

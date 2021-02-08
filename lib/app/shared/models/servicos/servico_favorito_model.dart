// To parse this JSON data, do
//
//     final servicoFavoritoModel = servicoFavoritoModelFromJson(jsonString);

import 'dart:convert';

ServicoFavoritoModel servicoFavoritoModelFromJson(String str) => ServicoFavoritoModel.fromJson(json.decode(str));

String servicoFavoritoModelToJson(ServicoFavoritoModel data) => json.encode(data.toJson());

class ServicoFavoritoModel {
    ServicoFavoritoModel({
        this.clenteFavoritoServico,
    });

    List<ClenteFavoritoServico> clenteFavoritoServico;

    factory ServicoFavoritoModel.fromJson(Map<String, dynamic> json) => ServicoFavoritoModel(
        clenteFavoritoServico: json["clente_favorito_servico"] == null ? null : List<ClenteFavoritoServico>.from(json["clente_favorito_servico"].map((x) => ClenteFavoritoServico.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "clente_favorito_servico": clenteFavoritoServico == null ? null : List<dynamic>.from(clenteFavoritoServico.map((x) => x.toJson())),
    };
}

class ClenteFavoritoServico {
    ClenteFavoritoServico({
        this.servicoId,
        this.servicoGeral,
    });

    int servicoId;
    ServicoGeral servicoGeral;

    factory ClenteFavoritoServico.fromJson(Map<String, dynamic> json) => ClenteFavoritoServico(
        servicoId: json["servico_id"] == null ? null : json["servico_id"],
        servicoGeral: json["servico_geral"] == null ? null : ServicoGeral.fromJson(json["servico_geral"]),
    );

    Map<String, dynamic> toJson() => {
        "servico_id": servicoId == null ? null : servicoId,
        "servico_geral": servicoGeral == null ? null : servicoGeral.toJson(),
    };
}

class ServicoGeral {
    ServicoGeral({
        this.categoria,
        this.servicoNome,
        this.usuarioId,
        this.servicoId,
        this.servicoFotoPerfil,
    });

    int categoria;
    String servicoNome;
    int usuarioId;
    int servicoId;
    String servicoFotoPerfil;

    factory ServicoGeral.fromJson(Map<String, dynamic> json) => ServicoGeral(
        categoria: json["categoria"] == null ? null : json["categoria"],
        servicoNome: json["servico_nome"] == null ? null : json["servico_nome"],
        usuarioId: json["usuario_id"] == null ? null : json["usuario_id"],
        servicoId: json["servico_id"] == null ? null : json["servico_id"],
        servicoFotoPerfil: json["servico_foto_perfil"] == null ? null : json["servico_foto_perfil"],
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria == null ? null : categoria,
        "servico_nome": servicoNome == null ? null : servicoNome,
        "usuario_id": usuarioId == null ? null : usuarioId,
        "servico_id": servicoId == null ? null : servicoId,
        "servico_foto_perfil": servicoFotoPerfil == null ? null : servicoFotoPerfil,
    };
}

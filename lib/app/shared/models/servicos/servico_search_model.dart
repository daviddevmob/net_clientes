// To parse this JSON data, do
//
//     final servicosSearchModel = servicosSearchModelFromJson(jsonString);

import 'dart:convert';

ServicosSearchModel servicosSearchModelFromJson(String str) => ServicosSearchModel.fromJson(json.decode(str));

String servicosSearchModelToJson(ServicosSearchModel data) => json.encode(data.toJson());

class ServicosSearchModel {
    ServicosSearchModel({
        this.servicoGeral,
    });

    List<ServicoGeral> servicoGeral;

    factory ServicosSearchModel.fromJson(Map<String, dynamic> json) => ServicosSearchModel(
        servicoGeral: json["servico_geral"] == null ? null : List<ServicoGeral>.from(json["servico_geral"].map((x) => ServicoGeral.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "servico_geral": servicoGeral == null ? null : List<dynamic>.from(servicoGeral.map((x) => x.toJson())),
    };
}

class ServicoGeral {
    ServicoGeral({
        this.categoria,
        this.servicoNome,
        this.servicoFotoPerfil,
        this.usuarioId,
        this.servicoId,
        this.servicoAvaliacaos,
    });

    int categoria;
    String servicoNome;
    String servicoFotoPerfil;
    int usuarioId;
    int servicoId;
    List<ServicoAvaliacao> servicoAvaliacaos;

    factory ServicoGeral.fromJson(Map<String, dynamic> json) => ServicoGeral(
        categoria: json["categoria"] == null ? null : json["categoria"],
        servicoNome: json["servico_nome"] == null ? null : json["servico_nome"],
        servicoFotoPerfil: json["servico_foto_perfil"] == null ? null : json["servico_foto_perfil"],
        usuarioId: json["usuario_id"] == null ? null : json["usuario_id"],
        servicoId: json["servico_id"] == null ? null : json["servico_id"],
        servicoAvaliacaos: json["servico_avaliacaos"] == null ? null : List<ServicoAvaliacao>.from(json["servico_avaliacaos"].map((x) => ServicoAvaliacao.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria == null ? null : categoria,
        "servico_nome": servicoNome == null ? null : servicoNome,
        "servico_foto_perfil": servicoFotoPerfil == null ? null : servicoFotoPerfil,
        "usuario_id": usuarioId == null ? null : usuarioId,
        "servico_id": servicoId == null ? null : servicoId,
        "servico_avaliacaos": servicoAvaliacaos == null ? null : List<dynamic>.from(servicoAvaliacaos.map((x) => x.toJson())),
    };
}

class ServicoAvaliacao {
    ServicoAvaliacao({
        this.nota,
    });

    double nota;

    factory ServicoAvaliacao.fromJson(Map<String, dynamic> json) => ServicoAvaliacao(
        nota: json["nota"] == null ? null : json["nota"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "nota": nota == null ? null : nota,
    };
}

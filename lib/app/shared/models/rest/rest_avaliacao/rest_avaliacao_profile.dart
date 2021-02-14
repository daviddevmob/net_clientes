// To parse this JSON data, do
//
//     final restAvaliacaoProfile = restAvaliacaoProfileFromJson(jsonString);

import 'dart:convert';

RestAvaliacaoProfile restAvaliacaoProfileFromJson(String str) => RestAvaliacaoProfile.fromJson(json.decode(str));

String restAvaliacaoProfileToJson(RestAvaliacaoProfile data) => json.encode(data.toJson());

class RestAvaliacaoProfile {
    RestAvaliacaoProfile({
        this.restAvaliacao,
    });

    List<RestAvaliacao> restAvaliacao;

    factory RestAvaliacaoProfile.fromJson(Map<String, dynamic> json) => RestAvaliacaoProfile(
        restAvaliacao: json["rest_avaliacao"] == null ? null : List<RestAvaliacao>.from(json["rest_avaliacao"].map((x) => RestAvaliacao.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rest_avaliacao": restAvaliacao == null ? null : List<dynamic>.from(restAvaliacao.map((x) => x.toJson())),
    };
}

class RestAvaliacao {
    RestAvaliacao({
        this.nota,
        this.texto,
        this.cliente,
        this.restComentarioAvaliacao,
        this.restGeral,
        this.criadoEm,
    });

    double nota;
    String texto;
    Cliente cliente;
    RestComentarioAvaliacao restComentarioAvaliacao;
    RestGeral restGeral;
    DateTime criadoEm;

    factory RestAvaliacao.fromJson(Map<String, dynamic> json) => RestAvaliacao(
        nota: json["nota"] == null ? null : json["nota"].toDouble(),
        texto: json["texto"] == null ? null : json["texto"],
        cliente: json["cliente"] == null ? null : Cliente.fromJson(json["cliente"]),
        restComentarioAvaliacao: json["rest_comentario_avaliacao"] == null ? null : RestComentarioAvaliacao.fromJson(json["rest_comentario_avaliacao"]),
        restGeral: json["rest_geral"] == null ? null : RestGeral.fromJson(json["rest_geral"]),
        criadoEm: json["criado_em"] == null ? null : DateTime.parse(json["criado_em"]),
    );

    Map<String, dynamic> toJson() => {
        "nota": nota == null ? null : nota,
        "texto": texto == null ? null : texto,
        "cliente": cliente == null ? null : cliente.toJson(),
        "rest_comentario_avaliacao": restComentarioAvaliacao == null ? null : restComentarioAvaliacao.toJson(),
        "rest_geral": restGeral == null ? null : restGeral.toJson(),
        "criado_em": criadoEm == null ? null : "${criadoEm.year.toString().padLeft(4, '0')}-${criadoEm.month.toString().padLeft(2, '0')}-${criadoEm.day.toString().padLeft(2, '0')}",
    };
}

class Cliente {
    Cliente({
        this.nome,
        this.bairro,
    });

    String nome;
    int bairro;

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        nome: json["nome"] == null ? null : json["nome"],
        bairro: json["bairro"] == null ? null : json["bairro"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome == null ? null : nome,
        "bairro": bairro == null ? null : bairro,
    };
}

class RestComentarioAvaliacao {
    RestComentarioAvaliacao({
        this.text,
    });

    String text;

    factory RestComentarioAvaliacao.fromJson(Map<String, dynamic> json) => RestComentarioAvaliacao(
        text: json["text"] == null ? null : json["text"],
    );

    Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
    };
}

class RestGeral {
    RestGeral({
        this.restNome,
    });

    String restNome;

    factory RestGeral.fromJson(Map<String, dynamic> json) => RestGeral(
        restNome: json["rest_nome"] == null ? null : json["rest_nome"],
    );

    Map<String, dynamic> toJson() => {
        "rest_nome": restNome == null ? null : restNome,
    };
}

// To parse this JSON data, do
//
//     final servicoAvaliacaoProfile = servicoAvaliacaoProfileFromJson(jsonString);

import 'dart:convert';

ServicoAvaliacaoProfile servicoAvaliacaoProfileFromJson(String str) => ServicoAvaliacaoProfile.fromJson(json.decode(str));

String servicoAvaliacaoProfileToJson(ServicoAvaliacaoProfile data) => json.encode(data.toJson());

class ServicoAvaliacaoProfile {
    ServicoAvaliacaoProfile({
        this.nota,
        this.texto,
        this.servicoAvaliacaoId,
        this.servicoComentarioAvaliacao,
    });

    double nota;
    String texto;
    int servicoAvaliacaoId;
    ServicoComentarioAvaliacao servicoComentarioAvaliacao;

    factory ServicoAvaliacaoProfile.fromJson(Map<String, dynamic> json) => ServicoAvaliacaoProfile(
        nota: json["nota"] == null ? null : json["nota"].toDouble(),
        texto: json["texto"] == null ? null : json["texto"],
        servicoAvaliacaoId: json["servico_avaliacao_id"] == null ? null : json["servico_avaliacao_id"],
        servicoComentarioAvaliacao: json["servico_comentario_avaliacao"] == null ? null : ServicoComentarioAvaliacao.fromJson(json["servico_comentario_avaliacao"]),
    );

    Map<String, dynamic> toJson() => {
        "nota": nota == null ? null : nota,
        "texto": texto == null ? null : texto,
        "servico_avaliacao_id": servicoAvaliacaoId == null ? null : servicoAvaliacaoId,
        "servico_comentario_avaliacao": servicoComentarioAvaliacao == null ? null : servicoComentarioAvaliacao.toJson(),
    };
}

class ServicoComentarioAvaliacao {
    ServicoComentarioAvaliacao({
        this.texto,
    });

    String texto;

    factory ServicoComentarioAvaliacao.fromJson(Map<String, dynamic> json) => ServicoComentarioAvaliacao(
        texto: json["texto"] == null ? null : json["texto"],
    );

    Map<String, dynamic> toJson() => {
        "texto": texto == null ? null : texto,
    };
}

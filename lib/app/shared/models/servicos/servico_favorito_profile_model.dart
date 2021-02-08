// To parse this JSON data, do
//
//     final servicoFavoritoModelProfile = servicoFavoritoModelProfileFromJson(jsonString);

import 'dart:convert';

ServicoFavoritoModelProfile servicoFavoritoModelProfileFromJson(String str) => ServicoFavoritoModelProfile.fromJson(json.decode(str));

String servicoFavoritoModelProfileToJson(ServicoFavoritoModelProfile data) => json.encode(data.toJson());

class ServicoFavoritoModelProfile {
    ServicoFavoritoModelProfile({
        this.clenteFavoritoServico,
    });

    List<ClenteFavoritoServico> clenteFavoritoServico;

    factory ServicoFavoritoModelProfile.fromJson(Map<String, dynamic> json) => ServicoFavoritoModelProfile(
        clenteFavoritoServico: json["clente_favorito_servico"] == null ? null : List<ClenteFavoritoServico>.from(json["clente_favorito_servico"].map((x) => ClenteFavoritoServico.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "clente_favorito_servico": clenteFavoritoServico == null ? null : List<dynamic>.from(clenteFavoritoServico.map((x) => x.toJson())),
    };
}

class ClenteFavoritoServico {
    ClenteFavoritoServico({
        this.clienteId,
        this.ativo,
    });

    int clienteId;
    bool ativo;

    factory ClenteFavoritoServico.fromJson(Map<String, dynamic> json) => ClenteFavoritoServico(
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        ativo: json["ativo"] == null ? null : json["ativo"],
    );

    Map<String, dynamic> toJson() => {
        "cliente_id": clienteId == null ? null : clienteId,
        "ativo": ativo == null ? null : ativo,
    };
}

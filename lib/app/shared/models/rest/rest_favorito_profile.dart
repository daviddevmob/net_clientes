// To parse this JSON data, do
//
//     final restFavoritoModelProfile = restFavoritoModelProfileFromJson(jsonString);

import 'dart:convert';

RestFavoritoModelProfile restFavoritoModelProfileFromJson(String str) => RestFavoritoModelProfile.fromJson(json.decode(str));

String restFavoritoModelProfileToJson(RestFavoritoModelProfile data) => json.encode(data.toJson());

class RestFavoritoModelProfile {
    RestFavoritoModelProfile({
        this.clienteFavoritoRest,
    });

    List<ClienteFavoritoRest> clienteFavoritoRest;

    factory RestFavoritoModelProfile.fromJson(Map<String, dynamic> json) => RestFavoritoModelProfile(
        clienteFavoritoRest: json["cliente_favorito_rest"] == null ? null : List<ClienteFavoritoRest>.from(json["cliente_favorito_rest"].map((x) => ClienteFavoritoRest.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cliente_favorito_rest": clienteFavoritoRest == null ? null : List<dynamic>.from(clienteFavoritoRest.map((x) => x.toJson())),
    };
}

class ClienteFavoritoRest {
    ClienteFavoritoRest({
        this.ativo,
        this.clienteId,
    });

    bool ativo;
    int clienteId;

    factory ClienteFavoritoRest.fromJson(Map<String, dynamic> json) => ClienteFavoritoRest(
        ativo: json["ativo"] == null ? null : json["ativo"],
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
    );

    Map<String, dynamic> toJson() => {
        "ativo": ativo == null ? null : ativo,
        "cliente_id": clienteId == null ? null : clienteId,
    };
}

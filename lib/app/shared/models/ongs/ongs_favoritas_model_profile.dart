// To parse this JSON data, do
//
//     final ongFavoritasProfile = ongFavoritasProfileFromJson(jsonString);

import 'dart:convert';

OngFavoritasProfile ongFavoritasProfileFromJson(String str) => OngFavoritasProfile.fromJson(json.decode(str));

String ongFavoritasProfileToJson(OngFavoritasProfile data) => json.encode(data.toJson());

class OngFavoritasProfile {
    OngFavoritasProfile({
        this.clienteFavoritaOng,
    });

    List<ClienteFavoritaOng> clienteFavoritaOng;

    factory OngFavoritasProfile.fromJson(Map<String, dynamic> json) => OngFavoritasProfile(
        clienteFavoritaOng: json["cliente_favorita_ong"] == null ? null : List<ClienteFavoritaOng>.from(json["cliente_favorita_ong"].map((x) => ClienteFavoritaOng.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cliente_favorita_ong": clienteFavoritaOng == null ? null : List<dynamic>.from(clienteFavoritaOng.map((x) => x.toJson())),
    };
}

class ClienteFavoritaOng {
    ClienteFavoritaOng({
        this.clienteId,
        this.ativo,
    });

    int clienteId;
    bool ativo;

    factory ClienteFavoritaOng.fromJson(Map<String, dynamic> json) => ClienteFavoritaOng(
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        ativo: json["ativo"] == null ? null : json["ativo"],
    );

    Map<String, dynamic> toJson() => {
        "cliente_id": clienteId == null ? null : clienteId,
        "ativo": ativo == null ? null : ativo,
    };
}

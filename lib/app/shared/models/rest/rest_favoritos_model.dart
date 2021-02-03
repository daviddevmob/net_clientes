// To parse this JSON data, do
//
//     final restFavoritoModel = restFavoritoModelFromJson(jsonString);

import 'dart:convert';

RestFavoritoModel restFavoritoModelFromJson(String str) => RestFavoritoModel.fromJson(json.decode(str));

String restFavoritoModelToJson(RestFavoritoModel data) => json.encode(data.toJson());

class RestFavoritoModel {
    RestFavoritoModel({
        this.clienteFavoritoRest,
    });

    List<ClienteFavoritoRest> clienteFavoritoRest;

    factory RestFavoritoModel.fromJson(Map<String, dynamic> json) => RestFavoritoModel(
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
        this.restId,
    });

    bool ativo;
    int clienteId;
    int restId;

    factory ClienteFavoritoRest.fromJson(Map<String, dynamic> json) => ClienteFavoritoRest(
        ativo: json["ativo"] == null ? null : json["ativo"],
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        restId: json["rest_id"] == null ? null : json["rest_id"],
    );

    Map<String, dynamic> toJson() => {
        "ativo": ativo == null ? null : ativo,
        "cliente_id": clienteId == null ? null : clienteId,
        "rest_id": restId == null ? null : restId,
    };
}

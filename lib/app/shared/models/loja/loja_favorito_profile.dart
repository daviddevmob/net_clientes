// To parse this JSON data, do
//
//     final lojaFavoritaModelProfile = lojaFavoritaModelProfileFromJson(jsonString);

import 'dart:convert';

LojaFavoritaModelProfile lojaFavoritaModelProfileFromJson(String str) => LojaFavoritaModelProfile.fromJson(json.decode(str));

String lojaFavoritaModelProfileToJson(LojaFavoritaModelProfile data) => json.encode(data.toJson());

class LojaFavoritaModelProfile {
    LojaFavoritaModelProfile({
        this.clienteFavoritoLoja,
    });

    List<ClienteFavoritoLoja> clienteFavoritoLoja;

    factory LojaFavoritaModelProfile.fromJson(Map<String, dynamic> json) => LojaFavoritaModelProfile(
        clienteFavoritoLoja: json["cliente_favorito_loja"] == null ? null : List<ClienteFavoritoLoja>.from(json["cliente_favorito_loja"].map((x) => ClienteFavoritoLoja.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cliente_favorito_loja": clienteFavoritoLoja == null ? null : List<dynamic>.from(clienteFavoritoLoja.map((x) => x.toJson())),
    };
}

class ClienteFavoritoLoja {
    ClienteFavoritoLoja({
        this.clienteFavoritoLojaId,
        this.ativo,
    });

    int clienteFavoritoLojaId;
    bool ativo;

    factory ClienteFavoritoLoja.fromJson(Map<String, dynamic> json) => ClienteFavoritoLoja(
        clienteFavoritoLojaId: json["cliente_favorito_loja_id"] == null ? null : json["cliente_favorito_loja_id"],
        ativo: json["ativo"] == null ? null : json["ativo"],
    );

    Map<String, dynamic> toJson() => {
        "cliente_favorito_loja_id": clienteFavoritoLojaId == null ? null : clienteFavoritoLojaId,
        "ativo": ativo == null ? null : ativo,
    };
}

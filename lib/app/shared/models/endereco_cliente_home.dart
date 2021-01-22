// To parse this JSON data, do
//
//     final enderecoClienteHome = enderecoClienteHomeFromJson(jsonString);

import 'dart:convert';

EnderecoClienteHome enderecoClienteHomeFromJson(String str) => EnderecoClienteHome.fromJson(json.decode(str));

String enderecoClienteHomeToJson(EnderecoClienteHome data) => json.encode(data.toJson());

class EnderecoClienteHome {
    EnderecoClienteHome({
        this.bairro,
        this.clienteId,
        this.complemento,
        this.endereco,
        this.enderecoId,
        this.latlgn,
    });

    int bairro;
    int clienteId;
    String complemento;
    String endereco;
    int enderecoId;
    String latlgn;

    factory EnderecoClienteHome.fromJson(Map<String, dynamic> json) => EnderecoClienteHome(
        bairro: json["bairro"] == null ? null : json["bairro"],
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        complemento: json["complemento"] == null ? null : json["complemento"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        enderecoId: json["endereco_id"] == null ? null : json["endereco_id"],
        latlgn: json["latlgn"] == null ? null : json["latlgn"],
    );

    Map<String, dynamic> toJson() => {
        "bairro": bairro == null ? null : bairro,
        "cliente_id": clienteId == null ? null : clienteId,
        "complemento": complemento == null ? null : complemento,
        "endereco": endereco == null ? null : endereco,
        "endereco_id": enderecoId == null ? null : enderecoId,
        "latlgn": latlgn == null ? null : latlgn,
    };
}

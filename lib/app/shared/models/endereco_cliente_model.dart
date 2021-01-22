// To parse this JSON data, do
//
//     final enderecoClienteModel = enderecoClienteModelFromJson(jsonString);

import 'dart:convert';

EnderecoClienteModel enderecoClienteModelFromJson(String str) => EnderecoClienteModel.fromJson(json.decode(str));

String enderecoClienteModelToJson(EnderecoClienteModel data) => json.encode(data.toJson());

class EnderecoClienteModel {
    EnderecoClienteModel({
        this.clienteId,
        this.complemento,
        this.endereco,
        this.enderecoId,
        this.latlgn,
        this.bairro,
    });

    int clienteId;
    String complemento;
    String endereco;
    int enderecoId;
    String latlgn;
    int bairro;

    factory EnderecoClienteModel.fromJson(Map<String, dynamic> json) => EnderecoClienteModel(
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        complemento: json["complemento"] == null ? null : json["complemento"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        enderecoId: json["endereco_id"] == null ? null : json["endereco_id"],
        latlgn: json["latlgn"] == null ? null : json["latlgn"],
        bairro: json["bairro"] == null ? null : json["bairro"],
    );

    Map<String, dynamic> toJson() => {
        "cliente_id": clienteId == null ? null : clienteId,
        "complemento": complemento == null ? null : complemento,
        "endereco": endereco == null ? null : endereco,
        "endereco_id": enderecoId == null ? null : enderecoId,
        "latlgn": latlgn == null ? null : latlgn,
        "bairro": bairro == null ? null : bairro,
    };
}

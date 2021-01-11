// To parse this JSON data, do
//
//     final clienteModel = clienteModelFromJson(jsonString);

import 'dart:convert';

ClienteModel clienteModelFromJson(String str) => ClienteModel.fromJson(json.decode(str));

String clienteModelToJson(ClienteModel data) => json.encode(data.toJson());

class ClienteModel {
    ClienteModel({
        this.bairro,
        this.clienteId,
        this.cpf,
        this.email,
        this.nome,
        this.firebaseId,
        this.status,
        this.whatsapp,
    });

    String bairro;
    int clienteId;
    String cpf;
    String email;
    String nome;
    String firebaseId;
    bool status;
    String whatsapp;

    factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        bairro: json["bairro"] == null ? null : json["bairro"],
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        cpf: json["cpf"] == null ? null : json["cpf"],
        email: json["email"] == null ? null : json["email"],
        nome: json["nome"] == null ? null : json["nome"],
        firebaseId: json["firebase_id"] == null ? null : json["firebase_id"],
        status: json["status"] == null ? null : json["status"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
    );

    Map<String, dynamic> toJson() => {
        "bairro": bairro == null ? null : bairro,
        "cliente_id": clienteId == null ? null : clienteId,
        "cpf": cpf == null ? null : cpf,
        "email": email == null ? null : email,
        "nome": nome == null ? null : nome,
        "firebase_id": firebaseId == null ? null : firebaseId,
        "status": status == null ? null : status,
        "whatsapp": whatsapp == null ? null : whatsapp,
    };
}

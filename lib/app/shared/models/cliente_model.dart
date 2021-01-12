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
        this.status,
        this.nome,
        this.fotoPerfil,
        this.firebaseId,
        this.whatsapp,
    });

    int bairro;
    int clienteId;
    String cpf;
    String email;
    bool status;
    String nome;
    String fotoPerfil;
    String firebaseId;
    String whatsapp;

    factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        bairro: json["bairro"] == null ? null : json["bairro"],
        clienteId: json["cliente_id"] == null ? null : json["cliente_id"],
        cpf: json["cpf"] == null ? null : json["cpf"],
        email: json["email"] == null ? null : json["email"],
        status: json["status"] == null ? null : json["status"],
        nome: json["nome"] == null ? null : json["nome"],
        fotoPerfil: json["foto_perfil"] == null ? null : json["foto_perfil"],
        firebaseId: json["firebase_id"] == null ? null : json["firebase_id"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
    );

    Map<String, dynamic> toJson() => {
        "bairro": bairro == null ? null : bairro,
        "cliente_id": clienteId == null ? null : clienteId,
        "cpf": cpf == null ? null : cpf,
        "email": email == null ? null : email,
        "status": status == null ? null : status,
        "nome": nome == null ? null : nome,
        "foto_perfil": fotoPerfil == null ? null : fotoPerfil,
        "firebase_id": firebaseId == null ? null : firebaseId,
        "whatsapp": whatsapp == null ? null : whatsapp,
    };
}

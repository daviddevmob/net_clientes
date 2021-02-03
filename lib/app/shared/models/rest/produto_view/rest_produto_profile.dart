// To parse this JSON data, do
//
//     final restProdutoProfile = restProdutoProfileFromJson(jsonString);

import 'dart:convert';

RestProdutoProfile restProdutoProfileFromJson(String str) => RestProdutoProfile.fromJson(json.decode(str));

String restProdutoProfileToJson(RestProdutoProfile data) => json.encode(data.toJson());

class RestProdutoProfile {
    RestProdutoProfile({
        this.restAdicionals,
        this.restProdutos,
    });

    List<RestAdicional> restAdicionals;
    List<RestProduto> restProdutos;

    factory RestProdutoProfile.fromJson(Map<String, dynamic> json) => RestProdutoProfile(
        restAdicionals: json["rest_adicionals"] == null ? null : List<RestAdicional>.from(json["rest_adicionals"].map((x) => RestAdicional.fromJson(x))),
        restProdutos: json["rest_produtos"] == null ? null : List<RestProduto>.from(json["rest_produtos"].map((x) => RestProduto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rest_adicionals": restAdicionals == null ? null : List<dynamic>.from(restAdicionals.map((x) => x.toJson())),
        "rest_produtos": restProdutos == null ? null : List<dynamic>.from(restProdutos.map((x) => x.toJson())),
    };
}

class RestAdicional {
    RestAdicional({
        this.nome,
        this.preco,
    });

    String nome;
    double preco;

    factory RestAdicional.fromJson(Map<String, dynamic> json) => RestAdicional(
        nome: json["nome"] == null ? null : json["nome"],
        preco: json["preco"] == null ? null : json["preco"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "nome": nome == null ? null : nome,
        "preco": preco == null ? null : preco,
    };
}

class RestProduto {
    RestProduto({
        this.descricao,
        this.disponivel,
        this.foto,
        this.nome,
        this.preco,
        this.precoPromo,
        this.quantidade,
        this.restOpcaos,
    });

    String descricao;
    bool disponivel;
    String foto;
    String nome;
    double preco;
    double precoPromo;
    int quantidade;
    List<RestOpcao> restOpcaos;

    factory RestProduto.fromJson(Map<String, dynamic> json) => RestProduto(
        descricao: json["descricao"] == null ? null : json["descricao"],
        disponivel: json["disponivel"] == null ? null : json["disponivel"],
        foto: json["foto"] == null ? null : json["foto"],
        nome: json["nome"] == null ? null : json["nome"],
        preco: json["preco"] == null ? null : json["preco"].toDouble(),
        precoPromo: json["preco_promo"] == null ? null : json["preco_promo"].toDouble(),
        quantidade: json["quantidade"] == null ? null : json["quantidade"],
        restOpcaos: json["rest_opcaos"] == null ? null : List<RestOpcao>.from(json["rest_opcaos"].map((x) => RestOpcao.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "descricao": descricao == null ? null : descricao,
        "disponivel": disponivel == null ? null : disponivel,
        "foto": foto == null ? null : foto,
        "nome": nome == null ? null : nome,
        "preco": preco == null ? null : preco,
        "preco_promo": precoPromo == null ? null : precoPromo,
        "quantidade": quantidade == null ? null : quantidade,
        "rest_opcaos": restOpcaos == null ? null : List<dynamic>.from(restOpcaos.map((x) => x.toJson())),
    };
}

class RestOpcao {
    RestOpcao({
        this.opcaoNome,
        this.restOpcaoItems,
        this.restOpcaoId,
    });

    String opcaoNome;
    List<RestOpcaoItem> restOpcaoItems;
    int restOpcaoId;

    factory RestOpcao.fromJson(Map<String, dynamic> json) => RestOpcao(
        opcaoNome: json["opcao_nome"] == null ? null : json["opcao_nome"],
        restOpcaoItems: json["rest_opcao_items"] == null ? null : List<RestOpcaoItem>.from(json["rest_opcao_items"].map((x) => RestOpcaoItem.fromJson(x))),
        restOpcaoId: json["rest_opcao_id"] == null ? null : json["rest_opcao_id"],
    );

    Map<String, dynamic> toJson() => {
        "opcao_nome": opcaoNome == null ? null : opcaoNome,
        "rest_opcao_items": restOpcaoItems == null ? null : List<dynamic>.from(restOpcaoItems.map((x) => x.toJson())),
        "rest_opcao_id": restOpcaoId == null ? null : restOpcaoId,
    };
}

class RestOpcaoItem {
    RestOpcaoItem({
        this.itemPreco,
        this.itemNome,
        this.restOpcaoItemId,
    });

    double itemPreco;
    String itemNome;
    int restOpcaoItemId;

    factory RestOpcaoItem.fromJson(Map<String, dynamic> json) => RestOpcaoItem(
        itemPreco: json["item_preco"] == null ? null : json["item_preco"].toDouble(),
        itemNome: json["item_nome"] == null ? null : json["item_nome"],
        restOpcaoItemId: json["rest_opcao_item_id"] == null ? null : json["rest_opcao_item_id"],
    );

    Map<String, dynamic> toJson() => {
        "item_preco": itemPreco == null ? null : itemPreco,
        "item_nome": itemNome == null ? null : itemNome,
        "rest_opcao_item_id": restOpcaoItemId == null ? null : restOpcaoItemId,
    };
}

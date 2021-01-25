// To parse this JSON data, do
//
//     final lojaPerfilPageModel = lojaPerfilPageModelFromJson(jsonString);

import 'dart:convert';

LojaPerfilPageModel lojaPerfilPageModelFromJson(String str) => LojaPerfilPageModel.fromJson(json.decode(str));

String lojaPerfilPageModelToJson(LojaPerfilPageModel data) => json.encode(data.toJson());

class LojaPerfilPageModel {
    LojaPerfilPageModel({
        this.categoria,
        this.lojaNome,
        this.entregaDomicilio,
        this.lojaFisica,
        this.usuario,
        this.fotoPerfilLink,
        this.lojaDescricao,
        this.lojaId,
        this.lojaProdCategoria,
        this.lojaProdutos,
        this.lojaFirebaseId,
    });

    int categoria;
    String lojaNome;
    bool entregaDomicilio;
    bool lojaFisica;
    Usuario usuario;
    String fotoPerfilLink;
    String lojaDescricao;
    int lojaId;
    List<LojaProdCategoria> lojaProdCategoria;
    List<LojaProduto> lojaProdutos;
    String lojaFirebaseId;

    factory LojaPerfilPageModel.fromJson(Map<String, dynamic> json) => LojaPerfilPageModel(
        categoria: json["categoria"] == null ? null : json["categoria"],
        lojaNome: json["loja_nome"] == null ? null : json["loja_nome"],
        entregaDomicilio: json["entrega_domicilio"] == null ? null : json["entrega_domicilio"],
        lojaFisica: json["loja_fisica"] == null ? null : json["loja_fisica"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
        fotoPerfilLink: json["foto_perfil_link"] == null ? null : json["foto_perfil_link"],
        lojaDescricao: json["loja_descricao"] == null ? null : json["loja_descricao"],
        lojaId: json["loja_id"] == null ? null : json["loja_id"],
        lojaProdCategoria: json["loja_prod_categoria"] == null ? null : List<LojaProdCategoria>.from(json["loja_prod_categoria"].map((x) => LojaProdCategoria.fromJson(x))),
        lojaProdutos: json["loja_produtos"] == null ? null : List<LojaProduto>.from(json["loja_produtos"].map((x) => LojaProduto.fromJson(x))),
        lojaFirebaseId: json["loja_firebase_id"] == null ? null : json["loja_firebase_id"],
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria == null ? null : categoria,
        "loja_nome": lojaNome == null ? null : lojaNome,
        "entrega_domicilio": entregaDomicilio == null ? null : entregaDomicilio,
        "loja_fisica": lojaFisica == null ? null : lojaFisica,
        "usuario": usuario == null ? null : usuario.toJson(),
        "foto_perfil_link": fotoPerfilLink == null ? null : fotoPerfilLink,
        "loja_descricao": lojaDescricao == null ? null : lojaDescricao,
        "loja_id": lojaId == null ? null : lojaId,
        "loja_prod_categoria": lojaProdCategoria == null ? null : List<dynamic>.from(lojaProdCategoria.map((x) => x.toJson())),
        "loja_produtos": lojaProdutos == null ? null : List<dynamic>.from(lojaProdutos.map((x) => x.toJson())),
        "loja_firebase_id": lojaFirebaseId == null ? null : lojaFirebaseId,
    };
}

class LojaProdCategoria {
    LojaProdCategoria({
        this.nomeCategoria,
        this.lojaProdCategoriaId,
    });

    String nomeCategoria;
    int lojaProdCategoriaId;

    factory LojaProdCategoria.fromJson(Map<String, dynamic> json) => LojaProdCategoria(
        nomeCategoria: json["nome_categoria"] == null ? null : json["nome_categoria"],
        lojaProdCategoriaId: json["loja_prod_categoria_id"] == null ? null : json["loja_prod_categoria_id"],
    );

    Map<String, dynamic> toJson() => {
        "nome_categoria": nomeCategoria == null ? null : nomeCategoria,
        "loja_prod_categoria_id": lojaProdCategoriaId == null ? null : lojaProdCategoriaId,
    };
}

class LojaProduto {
    LojaProduto({
        this.descricao,
        this.disponivel,
        this.foto1Link,
        this.foto2Link,
        this.preco,
        this.precoPromo,
        this.produtoNome,
        this.quantidade,
        this.lojaProdutoId,
        this.lojaCategoriaProdId,
    });

    String descricao;
    bool disponivel;
    String foto1Link;
    String foto2Link;
    double preco;
    double precoPromo;
    String produtoNome;
    int quantidade;
    int lojaProdutoId;
    int lojaCategoriaProdId;

    factory LojaProduto.fromJson(Map<String, dynamic> json) => LojaProduto(
        descricao: json["descricao"] == null ? null : json["descricao"],
        disponivel: json["disponivel"] == null ? null : json["disponivel"],
        foto1Link: json["foto1_link"] == null ? null : json["foto1_link"],
        foto2Link: json["foto2_link"] == null ? null : json["foto2_link"],
        preco: json["preco"] == null ? null : json["preco"].toDouble(),
        precoPromo: json["preco_promo"] == null ? null : json["preco_promo"].toDouble(),
        produtoNome: json["produto_nome"] == null ? null : json["produto_nome"],
        quantidade: json["quantidade"] == null ? null : json["quantidade"],
        lojaProdutoId: json["loja_produto_id"] == null ? null : json["loja_produto_id"],
        lojaCategoriaProdId: json["loja_categoria_prod_id"] == null ? null : json["loja_categoria_prod_id"],
    );

    Map<String, dynamic> toJson() => {
        "descricao": descricao == null ? null : descricao,
        "disponivel": disponivel == null ? null : disponivel,
        "foto1_link": foto1Link == null ? null : foto1Link,
        "foto2_link": foto2Link == null ? null : foto2Link,
        "preco": preco == null ? null : preco,
        "preco_promo": precoPromo == null ? null : precoPromo,
        "produto_nome": produtoNome == null ? null : produtoNome,
        "quantidade": quantidade == null ? null : quantidade,
        "loja_produto_id": lojaProdutoId == null ? null : lojaProdutoId,
        "loja_categoria_prod_id": lojaCategoriaProdId == null ? null : lojaCategoriaProdId,
    };
}

class Usuario {
    Usuario({
        this.localizacao,
        this.taxaEntrega,
        this.diasSemana,
        this.horarioAtendimento,
        this.socialLinks,
        this.metodoPagamento,
    });

    Localizacao localizacao;
    TaxaEntrega taxaEntrega;
    DiasSemana diasSemana;
    HorarioAtendimento horarioAtendimento;
    SocialLinks socialLinks;
    MetodoPagamento metodoPagamento;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        localizacao: json["localizacao"] == null ? null : Localizacao.fromJson(json["localizacao"]),
        taxaEntrega: json["taxa_entrega"] == null ? null : TaxaEntrega.fromJson(json["taxa_entrega"]),
        diasSemana: json["dias_semana"] == null ? null : DiasSemana.fromJson(json["dias_semana"]),
        horarioAtendimento: json["horario_atendimento"] == null ? null : HorarioAtendimento.fromJson(json["horario_atendimento"]),
        socialLinks: json["social_links"] == null ? null : SocialLinks.fromJson(json["social_links"]),
        metodoPagamento: json["metodo_pagamento"] == null ? null : MetodoPagamento.fromJson(json["metodo_pagamento"]),
    );

    Map<String, dynamic> toJson() => {
        "localizacao": localizacao == null ? null : localizacao.toJson(),
        "taxa_entrega": taxaEntrega == null ? null : taxaEntrega.toJson(),
        "dias_semana": diasSemana == null ? null : diasSemana.toJson(),
        "horario_atendimento": horarioAtendimento == null ? null : horarioAtendimento.toJson(),
        "social_links": socialLinks == null ? null : socialLinks.toJson(),
        "metodo_pagamento": metodoPagamento == null ? null : metodoPagamento.toJson(),
    };
}

class DiasSemana {
    DiasSemana({
        this.domingo,
        this.quarta,
        this.quinta,
        this.sabado,
        this.segunda,
        this.sexta,
        this.terca,
    });

    bool domingo;
    bool quarta;
    bool quinta;
    bool sabado;
    bool segunda;
    bool sexta;
    bool terca;

    factory DiasSemana.fromJson(Map<String, dynamic> json) => DiasSemana(
        domingo: json["domingo"] == null ? null : json["domingo"],
        quarta: json["quarta"] == null ? null : json["quarta"],
        quinta: json["quinta"] == null ? null : json["quinta"],
        sabado: json["sabado"] == null ? null : json["sabado"],
        segunda: json["segunda"] == null ? null : json["segunda"],
        sexta: json["sexta"] == null ? null : json["sexta"],
        terca: json["terca"] == null ? null : json["terca"],
    );

    Map<String, dynamic> toJson() => {
        "domingo": domingo == null ? null : domingo,
        "quarta": quarta == null ? null : quarta,
        "quinta": quinta == null ? null : quinta,
        "sabado": sabado == null ? null : sabado,
        "segunda": segunda == null ? null : segunda,
        "sexta": sexta == null ? null : sexta,
        "terca": terca == null ? null : terca,
    };
}

class HorarioAtendimento {
    HorarioAtendimento({
        this.domingo,
        this.quarta,
        this.quinta,
        this.sabado,
        this.segunda,
        this.sexta,
        this.terca,
    });

    String domingo;
    String quarta;
    String quinta;
    String sabado;
    String segunda;
    String sexta;
    String terca;

    factory HorarioAtendimento.fromJson(Map<String, dynamic> json) => HorarioAtendimento(
        domingo: json["domingo"] == null ? null : json["domingo"],
        quarta: json["quarta"] == null ? null : json["quarta"],
        quinta: json["quinta"] == null ? null : json["quinta"],
        sabado: json["sabado"] == null ? null : json["sabado"],
        segunda: json["segunda"] == null ? null : json["segunda"],
        sexta: json["sexta"] == null ? null : json["sexta"],
        terca: json["terca"] == null ? null : json["terca"],
    );

    Map<String, dynamic> toJson() => {
        "domingo": domingo == null ? null : domingo,
        "quarta": quarta == null ? null : quarta,
        "quinta": quinta == null ? null : quinta,
        "sabado": sabado == null ? null : sabado,
        "segunda": segunda == null ? null : segunda,
        "sexta": sexta == null ? null : sexta,
        "terca": terca == null ? null : terca,
    };
}

class Localizacao {
    Localizacao({
        this.mapaLink,
        this.bairro,
        this.endereco,
        this.complemento,
    });

    String mapaLink;
    int bairro;
    String endereco;
    String complemento;

    factory Localizacao.fromJson(Map<String, dynamic> json) => Localizacao(
        mapaLink: json["mapa_link"] == null ? null : json["mapa_link"],
        bairro: json["bairro"] == null ? null : json["bairro"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        complemento: json["complemento"] == null ? null : json["complemento"],
    );

    Map<String, dynamic> toJson() => {
        "mapa_link": mapaLink == null ? null : mapaLink,
        "bairro": bairro == null ? null : bairro,
        "endereco": endereco == null ? null : endereco,
        "complemento": complemento == null ? null : complemento,
    };
}

class MetodoPagamento {
    MetodoPagamento({
        this.aleloAlimentacao,
        this.aleloRefeicao,
        this.americanExpress,
        this.amex,
        this.dinheiro,
        this.elo,
        this.mastercard,
        this.metodoPagamento,
        this.sodexoAlimentacao,
        this.sodexoRefeicao,
        this.ticketAlimentacao,
        this.ticketRestaurante,
        this.visa,
    });

    bool aleloAlimentacao;
    bool aleloRefeicao;
    bool americanExpress;
    bool amex;
    bool dinheiro;
    bool elo;
    bool mastercard;
    int metodoPagamento;
    bool sodexoAlimentacao;
    bool sodexoRefeicao;
    bool ticketAlimentacao;
    bool ticketRestaurante;
    bool visa;

    factory MetodoPagamento.fromJson(Map<String, dynamic> json) => MetodoPagamento(
        aleloAlimentacao: json["alelo_alimentacao"] == null ? null : json["alelo_alimentacao"],
        aleloRefeicao: json["alelo_refeicao"] == null ? null : json["alelo_refeicao"],
        americanExpress: json["american_express"] == null ? null : json["american_express"],
        amex: json["amex"] == null ? null : json["amex"],
        dinheiro: json["dinheiro"] == null ? null : json["dinheiro"],
        elo: json["elo"] == null ? null : json["elo"],
        mastercard: json["mastercard"] == null ? null : json["mastercard"],
        metodoPagamento: json["metodo_pagamento"] == null ? null : json["metodo_pagamento"],
        sodexoAlimentacao: json["sodexo_alimentacao"] == null ? null : json["sodexo_alimentacao"],
        sodexoRefeicao: json["sodexo_refeicao"] == null ? null : json["sodexo_refeicao"],
        ticketAlimentacao: json["ticket_alimentacao"] == null ? null : json["ticket_alimentacao"],
        ticketRestaurante: json["ticket_restaurante"] == null ? null : json["ticket_restaurante"],
        visa: json["visa"] == null ? null : json["visa"],
    );

    Map<String, dynamic> toJson() => {
        "alelo_alimentacao": aleloAlimentacao == null ? null : aleloAlimentacao,
        "alelo_refeicao": aleloRefeicao == null ? null : aleloRefeicao,
        "american_express": americanExpress == null ? null : americanExpress,
        "amex": amex == null ? null : amex,
        "dinheiro": dinheiro == null ? null : dinheiro,
        "elo": elo == null ? null : elo,
        "mastercard": mastercard == null ? null : mastercard,
        "metodo_pagamento": metodoPagamento == null ? null : metodoPagamento,
        "sodexo_alimentacao": sodexoAlimentacao == null ? null : sodexoAlimentacao,
        "sodexo_refeicao": sodexoRefeicao == null ? null : sodexoRefeicao,
        "ticket_alimentacao": ticketAlimentacao == null ? null : ticketAlimentacao,
        "ticket_restaurante": ticketRestaurante == null ? null : ticketRestaurante,
        "visa": visa == null ? null : visa,
    };
}

class SocialLinks {
    SocialLinks({
        this.telefone,
        this.whatsapp,
    });

    String telefone;
    String whatsapp;

    factory SocialLinks.fromJson(Map<String, dynamic> json) => SocialLinks(
        telefone: json["telefone"] == null ? null : json["telefone"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
    );

    Map<String, dynamic> toJson() => {
        "telefone": telefone == null ? null : telefone,
        "whatsapp": whatsapp == null ? null : whatsapp,
    };
}

class TaxaEntrega {
    TaxaEntrega({
        this.taxaEntrega,
    });

    double taxaEntrega;

    factory TaxaEntrega.fromJson(Map<String, dynamic> json) => TaxaEntrega(
        taxaEntrega: json["taxa_entrega"] == null ? null : json["taxa_entrega"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "taxa_entrega": taxaEntrega == null ? null : taxaEntrega,
    };
}

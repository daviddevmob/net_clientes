// To parse this JSON data, do
//
//     final restProfile = restProfileFromJson(jsonString);

import 'dart:convert';

RestProfile restProfileFromJson(String str) => RestProfile.fromJson(json.decode(str));

String restProfileToJson(RestProfile data) => json.encode(data.toJson());

class RestProfile {
    RestProfile({
        this.categoria,
        this.restNome,
        this.entregaDomicilio,
        this.retiradaLoja,
        this.usuario,
        this.fotoLink,
        this.restDescricao,
        this.restId,
        this.restFirebaseId,
        this.restProdCategoria,
        this.restAvaliacaos,
    });

    int categoria;
    String restNome;
    bool entregaDomicilio;
    bool retiradaLoja;
    Usuario usuario;
    String fotoLink;
    String restDescricao;
    int restId;
    String restFirebaseId;
    List<RestProdCategoria> restProdCategoria;
    List<RestAvaliacao> restAvaliacaos;

    factory RestProfile.fromJson(Map<String, dynamic> json) => RestProfile(
        categoria: json["categoria"] == null ? null : json["categoria"],
        restNome: json["rest_nome"] == null ? null : json["rest_nome"],
        entregaDomicilio: json["entrega_domicilio"] == null ? null : json["entrega_domicilio"],
        retiradaLoja: json["retirada_loja"] == null ? null : json["retirada_loja"],
        usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
        fotoLink: json["foto_link"] == null ? null : json["foto_link"],
        restDescricao: json["rest_descricao"] == null ? null : json["rest_descricao"],
        restId: json["rest_id"] == null ? null : json["rest_id"],
        restFirebaseId: json["rest_firebase_id"] == null ? null : json["rest_firebase_id"],
        restProdCategoria: json["rest_prod_categoria"] == null ? null : List<RestProdCategoria>.from(json["rest_prod_categoria"].map((x) => RestProdCategoria.fromJson(x))),
        restAvaliacaos: json["rest_avaliacaos"] == null ? null : List<RestAvaliacao>.from(json["rest_avaliacaos"].map((x) => RestAvaliacao.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria == null ? null : categoria,
        "rest_nome": restNome == null ? null : restNome,
        "entrega_domicilio": entregaDomicilio == null ? null : entregaDomicilio,
        "retirada_loja": retiradaLoja == null ? null : retiradaLoja,
        "usuario": usuario == null ? null : usuario.toJson(),
        "foto_link": fotoLink == null ? null : fotoLink,
        "rest_descricao": restDescricao == null ? null : restDescricao,
        "rest_id": restId == null ? null : restId,
        "rest_firebase_id": restFirebaseId == null ? null : restFirebaseId,
        "rest_prod_categoria": restProdCategoria == null ? null : List<dynamic>.from(restProdCategoria.map((x) => x.toJson())),
        "rest_avaliacaos": restAvaliacaos == null ? null : List<dynamic>.from(restAvaliacaos.map((x) => x.toJson())),
    };
}

class RestAvaliacao {
    RestAvaliacao({
        this.nota,
    });

    double nota;

    factory RestAvaliacao.fromJson(Map<String, dynamic> json) => RestAvaliacao(
        nota: json["nota"] == null ? null : json["nota"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "nota": nota == null ? null : nota,
    };
}

class RestProdCategoria {
    RestProdCategoria({
        this.nomeCategoria,
        this.restAdicionals,
        this.restProdutos,
    });

    String nomeCategoria;
    List<RestAdicional> restAdicionals;
    List<RestProduto> restProdutos;

    factory RestProdCategoria.fromJson(Map<String, dynamic> json) => RestProdCategoria(
        nomeCategoria: json["nome_categoria"] == null ? null : json["nome_categoria"],
        restAdicionals: json["rest_adicionals"] == null ? null : List<RestAdicional>.from(json["rest_adicionals"].map((x) => RestAdicional.fromJson(x))),
        restProdutos: json["rest_produtos"] == null ? null : List<RestProduto>.from(json["rest_produtos"].map((x) => RestProduto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nome_categoria": nomeCategoria == null ? null : nomeCategoria,
        "rest_adicionals": restAdicionals == null ? null : List<dynamic>.from(restAdicionals.map((x) => x.toJson())),
        "rest_produtos": restProdutos == null ? null : List<dynamic>.from(restProdutos.map((x) => x.toJson())),
    };
}

class RestAdicional {
    RestAdicional({
        this.preco,
        this.nome,
    });

    double preco;
    String nome;

    factory RestAdicional.fromJson(Map<String, dynamic> json) => RestAdicional(
        preco: json["preco"] == null ? null : json["preco"].toDouble(),
        nome: json["nome"] == null ? null : json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "preco": preco == null ? null : preco,
        "nome": nome == null ? null : nome,
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
        this.restCategoriaId,
        this.restProdutoId,
    });

    String descricao;
    bool disponivel;
    String foto;
    String nome;
    double preco;
    double precoPromo;
    int restCategoriaId;
    int restProdutoId;

    factory RestProduto.fromJson(Map<String, dynamic> json) => RestProduto(
        descricao: json["descricao"] == null ? null : json["descricao"],
        disponivel: json["disponivel"] == null ? null : json["disponivel"],
        foto: json["foto"] == null ? null : json["foto"],
        nome: json["nome"] == null ? null : json["nome"],
        preco: json["preco"] == null ? null : json["preco"].toDouble(),
        precoPromo: json["preco_promo"] == null ? null : json["preco_promo"].toDouble(),
        restCategoriaId: json["rest_categoria_id"] == null ? null : json["rest_categoria_id"],
        restProdutoId: json["rest_produto_id"] == null ? null : json["rest_produto_id"],
    );

    Map<String, dynamic> toJson() => {
        "descricao": descricao == null ? null : descricao,
        "disponivel": disponivel == null ? null : disponivel,
        "foto": foto == null ? null : foto,
        "nome": nome == null ? null : nome,
        "preco": preco == null ? null : preco,
        "preco_promo": precoPromo == null ? null : precoPromo,
        "rest_categoria_id": restCategoriaId == null ? null : restCategoriaId,
        "rest_produto_id": restProdutoId == null ? null : restProdutoId,
    };
}

class Usuario {
    Usuario({
        this.firebaseId,
        this.localizacao,
        this.taxaEntrega,
        this.diasSemana,
        this.horarioAtendimento,
        this.socialLinks,
        this.metodoPagamento,
    });

    String firebaseId;
    Localizacao localizacao;
    TaxaEntrega taxaEntrega;
    DiasSemana diasSemana;
    HorarioAtendimento horarioAtendimento;
    SocialLinks socialLinks;
    MetodoPagamento metodoPagamento;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        firebaseId: json["firebase_id"] == null ? null : json["firebase_id"],
        localizacao: json["localizacao"] == null ? null : Localizacao.fromJson(json["localizacao"]),
        taxaEntrega: json["taxa_entrega"] == null ? null : TaxaEntrega.fromJson(json["taxa_entrega"]),
        diasSemana: json["dias_semana"] == null ? null : DiasSemana.fromJson(json["dias_semana"]),
        horarioAtendimento: json["horario_atendimento"] == null ? null : HorarioAtendimento.fromJson(json["horario_atendimento"]),
        socialLinks: json["social_links"] == null ? null : SocialLinks.fromJson(json["social_links"]),
        metodoPagamento: json["metodo_pagamento"] == null ? null : MetodoPagamento.fromJson(json["metodo_pagamento"]),
    );

    Map<String, dynamic> toJson() => {
        "firebase_id": firebaseId == null ? null : firebaseId,
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

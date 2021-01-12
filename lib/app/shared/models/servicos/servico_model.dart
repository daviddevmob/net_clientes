// To parse this JSON data, do
//
//     final servicoModel = servicoModelFromJson(jsonString);

import 'dart:convert';

ServicoModel servicoModelFromJson(String str) => ServicoModel.fromJson(json.decode(str));

String servicoModelToJson(ServicoModel data) => json.encode(data.toJson());

class ServicoModel {
    ServicoModel({
        this.usuario,
    });

    List<Usuario> usuario;

    factory ServicoModel.fromJson(Map<String, dynamic> json) => ServicoModel(
        usuario: json["usuario"] == null ? null : List<Usuario>.from(json["usuario"].map((x) => Usuario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario == null ? null : List<dynamic>.from(usuario.map((x) => x.toJson())),
    };
}

class Usuario {
    Usuario({
        this.diasSemana,
        this.horarioAtendimento,
        this.localizacao,
        this.socialLinks,
        this.servicoGeral,
    });

    DiasSemana diasSemana;
    HorarioAtendimento horarioAtendimento;
    Localizacao localizacao;
    SocialLinks socialLinks;
    ServicoGeral servicoGeral;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        diasSemana: json["dias_semana"] == null ? null : DiasSemana.fromJson(json["dias_semana"]),
        horarioAtendimento: json["horario_atendimento"] == null ? null : HorarioAtendimento.fromJson(json["horario_atendimento"]),
        localizacao: json["localizacao"] == null ? null : Localizacao.fromJson(json["localizacao"]),
        socialLinks: json["social_links"] == null ? null : SocialLinks.fromJson(json["social_links"]),
        servicoGeral: json["servico_geral"] == null ? null : ServicoGeral.fromJson(json["servico_geral"]),
    );

    Map<String, dynamic> toJson() => {
        "dias_semana": diasSemana == null ? null : diasSemana.toJson(),
        "horario_atendimento": horarioAtendimento == null ? null : horarioAtendimento.toJson(),
        "localizacao": localizacao == null ? null : localizacao.toJson(),
        "social_links": socialLinks == null ? null : socialLinks.toJson(),
        "servico_geral": servicoGeral == null ? null : servicoGeral.toJson(),
    };
}

class DiasSemana {
    DiasSemana({
        this.domingo,
        this.quarta,
        this.quinta,
        this.sabado,
        this.segunda,
        this.semanaId,
        this.sexta,
        this.terca,
    });

    bool domingo;
    bool quarta;
    bool quinta;
    bool sabado;
    bool segunda;
    int semanaId;
    bool sexta;
    bool terca;

    factory DiasSemana.fromJson(Map<String, dynamic> json) => DiasSemana(
        domingo: json["domingo"] == null ? null : json["domingo"],
        quarta: json["quarta"] == null ? null : json["quarta"],
        quinta: json["quinta"] == null ? null : json["quinta"],
        sabado: json["sabado"] == null ? null : json["sabado"],
        segunda: json["segunda"] == null ? null : json["segunda"],
        semanaId: json["semana_id"] == null ? null : json["semana_id"],
        sexta: json["sexta"] == null ? null : json["sexta"],
        terca: json["terca"] == null ? null : json["terca"],
    );

    Map<String, dynamic> toJson() => {
        "domingo": domingo == null ? null : domingo,
        "quarta": quarta == null ? null : quarta,
        "quinta": quinta == null ? null : quinta,
        "sabado": sabado == null ? null : sabado,
        "segunda": segunda == null ? null : segunda,
        "semana_id": semanaId == null ? null : semanaId,
        "sexta": sexta == null ? null : sexta,
        "terca": terca == null ? null : terca,
    };
}

class HorarioAtendimento {
    HorarioAtendimento({
        this.domingo,
        this.horarioId,
        this.quarta,
        this.quinta,
        this.sabado,
        this.segunda,
        this.sexta,
        this.terca,
    });

    String domingo;
    int horarioId;
    String quarta;
    String quinta;
    String sabado;
    String segunda;
    String sexta;
    String terca;

    factory HorarioAtendimento.fromJson(Map<String, dynamic> json) => HorarioAtendimento(
        domingo: json["domingo"] == null ? null : json["domingo"],
        horarioId: json["horario_id"] == null ? null : json["horario_id"],
        quarta: json["quarta"] == null ? null : json["quarta"],
        quinta: json["quinta"] == null ? null : json["quinta"],
        sabado: json["sabado"] == null ? null : json["sabado"],
        segunda: json["segunda"] == null ? null : json["segunda"],
        sexta: json["sexta"] == null ? null : json["sexta"],
        terca: json["terca"] == null ? null : json["terca"],
    );

    Map<String, dynamic> toJson() => {
        "domingo": domingo == null ? null : domingo,
        "horario_id": horarioId == null ? null : horarioId,
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
        this.bairro,
        this.complemento,
        this.endereco,
        this.mapaLink,
    });

    int bairro;
    String complemento;
    String endereco;
    String mapaLink;

    factory Localizacao.fromJson(Map<String, dynamic> json) => Localizacao(
        bairro: json["bairro"] == null ? null : json["bairro"],
        complemento: json["complemento"] == null ? null : json["complemento"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        mapaLink: json["mapa_link"] == null ? null : json["mapa_link"],
    );

    Map<String, dynamic> toJson() => {
        "bairro": bairro == null ? null : bairro,
        "complemento": complemento == null ? null : complemento,
        "endereco": endereco == null ? null : endereco,
        "mapa_link": mapaLink == null ? null : mapaLink,
    };
}

class ServicoGeral {
    ServicoGeral({
        this.servicoDescricao,
        this.servicoDomicilio,
        this.servicoFotoCapa,
        this.servicoFotoPerfil,
        this.categoria,
        this.servicoFotos,
        this.servicoLocal,
        this.servicoNome,
        this.servicoLists,
    });

    String servicoDescricao;
    bool servicoDomicilio;
    String servicoFotoCapa;
    String servicoFotoPerfil;
    int categoria;
    List<ServicoFoto> servicoFotos;
    bool servicoLocal;
    String servicoNome;
    List<ServicoList> servicoLists;

    factory ServicoGeral.fromJson(Map<String, dynamic> json) => ServicoGeral(
        servicoDescricao: json["servico_descricao"] == null ? null : json["servico_descricao"],
        servicoDomicilio: json["servico_domicilio"] == null ? null : json["servico_domicilio"],
        servicoFotoCapa: json["servico_foto_capa"] == null ? null : json["servico_foto_capa"],
        servicoFotoPerfil: json["servico_foto_perfil"] == null ? null : json["servico_foto_perfil"],
        categoria: json["categoria"] == null ? null : json["categoria"],
        servicoFotos: json["servico_fotos"] == null ? null : List<ServicoFoto>.from(json["servico_fotos"].map((x) => ServicoFoto.fromJson(x))),
        servicoLocal: json["servico_local"] == null ? null : json["servico_local"],
        servicoNome: json["servico_nome"] == null ? null : json["servico_nome"],
        servicoLists: json["servico_lists"] == null ? null : List<ServicoList>.from(json["servico_lists"].map((x) => ServicoList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "servico_descricao": servicoDescricao == null ? null : servicoDescricao,
        "servico_domicilio": servicoDomicilio == null ? null : servicoDomicilio,
        "servico_foto_capa": servicoFotoCapa == null ? null : servicoFotoCapa,
        "servico_foto_perfil": servicoFotoPerfil == null ? null : servicoFotoPerfil,
        "categoria": categoria == null ? null : categoria,
        "servico_fotos": servicoFotos == null ? null : List<dynamic>.from(servicoFotos.map((x) => x.toJson())),
        "servico_local": servicoLocal == null ? null : servicoLocal,
        "servico_nome": servicoNome == null ? null : servicoNome,
        "servico_lists": servicoLists == null ? null : List<dynamic>.from(servicoLists.map((x) => x.toJson())),
    };
}

class ServicoFoto {
    ServicoFoto({
        this.descricao,
        this.link,
    });

    String descricao;
    String link;

    factory ServicoFoto.fromJson(Map<String, dynamic> json) => ServicoFoto(
        descricao: json["descricao"] == null ? null : json["descricao"],
        link: json["link"] == null ? null : json["link"],
    );

    Map<String, dynamic> toJson() => {
        "descricao": descricao == null ? null : descricao,
        "link": link == null ? null : link,
    };
}

class ServicoList {
    ServicoList({
        this.servicoNome,
        this.servicoPreco,
        this.servicoTempo,
    });

    String servicoNome;
    String servicoPreco;
    String servicoTempo;

    factory ServicoList.fromJson(Map<String, dynamic> json) => ServicoList(
        servicoNome: json["servico_nome"] == null ? null : json["servico_nome"],
        servicoPreco: json["servico_preco"] == null ? null : json["servico_preco"],
        servicoTempo: json["servico_tempo"] == null ? null : json["servico_tempo"],
    );

    Map<String, dynamic> toJson() => {
        "servico_nome": servicoNome == null ? null : servicoNome,
        "servico_preco": servicoPreco == null ? null : servicoPreco,
        "servico_tempo": servicoTempo == null ? null : servicoTempo,
    };
}

class SocialLinks {
    SocialLinks({
        this.email,
        this.instagram,
        this.telefone,
        this.whatsapp,
    });

    String email;
    String instagram;
    String telefone;
    String whatsapp;

    factory SocialLinks.fromJson(Map<String, dynamic> json) => SocialLinks(
        email: json["email"] == null ? null : json["email"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        telefone: json["telefone"] == null ? null : json["telefone"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
    );

    Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "instagram": instagram == null ? null : instagram,
        "telefone": telefone == null ? null : telefone,
        "whatsapp": whatsapp == null ? null : whatsapp,
    };
}

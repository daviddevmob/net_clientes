// To parse this JSON data, do
//
//     final ongModel = ongModelFromJson(jsonString);

import 'dart:convert';

OngModel ongModelFromJson(String str) => OngModel.fromJson(json.decode(str));

String ongModelToJson(OngModel data) => json.encode(data.toJson());

class OngModel {
    OngModel({
        this.usuario,
    });

    List<Usuario> usuario;

    factory OngModel.fromJson(Map<String, dynamic> json) => OngModel(
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
        this.ongGeral,
        this.socialLinks,
    });

    DiasSemana diasSemana;
    HorarioAtendimento horarioAtendimento;
    Localizacao localizacao;
    OngGeral ongGeral;
    SocialLinks socialLinks;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        diasSemana: json["dias_semana"] == null ? null : DiasSemana.fromJson(json["dias_semana"]),
        horarioAtendimento: json["horario_atendimento"] == null ? null : HorarioAtendimento.fromJson(json["horario_atendimento"]),
        localizacao: json["localizacao"] == null ? null : Localizacao.fromJson(json["localizacao"]),
        ongGeral: json["ong_geral"] == null ? null : OngGeral.fromJson(json["ong_geral"]),
        socialLinks: json["social_links"] == null ? null : SocialLinks.fromJson(json["social_links"]),
    );

    Map<String, dynamic> toJson() => {
        "dias_semana": diasSemana == null ? null : diasSemana.toJson(),
        "horario_atendimento": horarioAtendimento == null ? null : horarioAtendimento.toJson(),
        "localizacao": localizacao == null ? null : localizacao.toJson(),
        "ong_geral": ongGeral == null ? null : ongGeral.toJson(),
        "social_links": socialLinks == null ? null : socialLinks.toJson(),
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

class OngGeral {
    OngGeral({
        this.ongDescricao,
        this.ongImagemCapa,
        this.ongImagemPerfil,
        this.ongNome,
        this.ongId,
        this.ongFotos,
        this.ongContrubiocaos,
    });

    String ongDescricao;
    String ongImagemCapa;
    String ongImagemPerfil;
    String ongNome;
    int ongId;
    List<OngFoto> ongFotos;
    List<OngContrubiocao> ongContrubiocaos;

    factory OngGeral.fromJson(Map<String, dynamic> json) => OngGeral(
        ongDescricao: json["ong_descricao"] == null ? null : json["ong_descricao"],
        ongImagemCapa: json["ong_imagem_capa"] == null ? null : json["ong_imagem_capa"],
        ongImagemPerfil: json["ong_imagem_perfil"] == null ? null : json["ong_imagem_perfil"],
        ongNome: json["ong_nome"] == null ? null : json["ong_nome"],
        ongId: json["ong_id"] == null ? null : json["ong_id"],
        ongFotos: json["ong_fotos"] == null ? null : List<OngFoto>.from(json["ong_fotos"].map((x) => OngFoto.fromJson(x))),
        ongContrubiocaos: json["ong_contrubiocaos"] == null ? null : List<OngContrubiocao>.from(json["ong_contrubiocaos"].map((x) => OngContrubiocao.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ong_descricao": ongDescricao == null ? null : ongDescricao,
        "ong_imagem_capa": ongImagemCapa == null ? null : ongImagemCapa,
        "ong_imagem_perfil": ongImagemPerfil == null ? null : ongImagemPerfil,
        "ong_nome": ongNome == null ? null : ongNome,
        "ong_id": ongId == null ? null : ongId,
        "ong_fotos": ongFotos == null ? null : List<dynamic>.from(ongFotos.map((x) => x.toJson())),
        "ong_contrubiocaos": ongContrubiocaos == null ? null : List<dynamic>.from(ongContrubiocaos.map((x) => x.toJson())),
    };
}

class OngContrubiocao {
    OngContrubiocao({
        this.contribuicaoId,
        this.texto,
    });

    int contribuicaoId;
    String texto;

    factory OngContrubiocao.fromJson(Map<String, dynamic> json) => OngContrubiocao(
        contribuicaoId: json["contribuicao_id"] == null ? null : json["contribuicao_id"],
        texto: json["texto"] == null ? null : json["texto"],
    );

    Map<String, dynamic> toJson() => {
        "contribuicao_id": contribuicaoId == null ? null : contribuicaoId,
        "texto": texto == null ? null : texto,
    };
}

class OngFoto {
    OngFoto({
        this.ongFotoDescricao,
        this.ongFotoLink,
        this.ongFotoId,
    });

    String ongFotoDescricao;
    String ongFotoLink;
    int ongFotoId;

    factory OngFoto.fromJson(Map<String, dynamic> json) => OngFoto(
        ongFotoDescricao: json["ong_foto_descricao"] == null ? null : json["ong_foto_descricao"],
        ongFotoLink: json["ong_foto_link"] == null ? null : json["ong_foto_link"],
        ongFotoId: json["ong_foto_id"] == null ? null : json["ong_foto_id"],
    );

    Map<String, dynamic> toJson() => {
        "ong_foto_descricao": ongFotoDescricao == null ? null : ongFotoDescricao,
        "ong_foto_link": ongFotoLink == null ? null : ongFotoLink,
        "ong_foto_id": ongFotoId == null ? null : ongFotoId,
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

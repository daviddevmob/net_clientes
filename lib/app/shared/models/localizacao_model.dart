class LocalizacaoModel {
    LocalizacaoModel({
        this.complemento,
        this.endereco,
        this.localizacaoId,
        this.mapaLink,
    });

    String complemento;
    String endereco;
    int localizacaoId;
    String mapaLink;

    factory LocalizacaoModel.fromJson(Map<String, dynamic> json) => LocalizacaoModel(
        complemento: json["complemento"] == null ? null : json["complemento"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        localizacaoId: json["localizacao_id"] == null ? null : json["localizacao_id"],
        mapaLink: json["mapa_link"] == null ? null : json["mapa_link"],
    );

    Map<String, dynamic> toJson() => {
        "complemento": complemento == null ? null : complemento,
        "endereco": endereco == null ? null : endereco,
        "localizacao_id": localizacaoId == null ? null : localizacaoId,
        "mapa_link": mapaLink == null ? null : mapaLink,
    };
}

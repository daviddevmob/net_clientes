// To parse this JSON data, do
//
//     final googleMapsLocalizacaoModel = googleMapsLocalizacaoModelFromJson(jsonString);

import 'dart:convert';

GoogleMapsLocalizacaoModel googleMapsLocalizacaoModelFromJson(String str) => GoogleMapsLocalizacaoModel.fromJson(json.decode(str));

String googleMapsLocalizacaoModelToJson(GoogleMapsLocalizacaoModel data) => json.encode(data.toJson());

class GoogleMapsLocalizacaoModel {
    GoogleMapsLocalizacaoModel({
        this.candidates,
        this.status,
    });

    List<Candidate> candidates;
    String status;

    factory GoogleMapsLocalizacaoModel.fromJson(Map<String, dynamic> json) => GoogleMapsLocalizacaoModel(
        candidates: json["candidates"] == null ? null : List<Candidate>.from(json["candidates"].map((x) => Candidate.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "candidates": candidates == null ? null : List<dynamic>.from(candidates.map((x) => x.toJson())),
        "status": status == null ? null : status,
    };
}

class Candidate {
    Candidate({
        this.formattedAddress,
        this.geometry,
        this.name,
    });

    String formattedAddress;
    Geometry geometry;
    String name;

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        formattedAddress: json["formatted_address"] == null ? null : json["formatted_address"],
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "formatted_address": formattedAddress == null ? null : formattedAddress,
        "geometry": geometry == null ? null : geometry.toJson(),
        "name": name == null ? null : name,
    };
}

class Geometry {
    Geometry({
        this.location,
        this.viewport,
    });

    Location location;
    Viewport viewport;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        viewport: json["viewport"] == null ? null : Viewport.fromJson(json["viewport"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location == null ? null : location.toJson(),
        "viewport": viewport == null ? null : viewport.toJson(),
    };
}

class Location {
    Location({
        this.lat,
        this.lng,
    });

    double lat;
    double lng;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
    };
}

class Viewport {
    Viewport({
        this.northeast,
        this.southwest,
    });

    Location northeast;
    Location southwest;

    factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: json["northeast"] == null ? null : Location.fromJson(json["northeast"]),
        southwest: json["southwest"] == null ? null : Location.fromJson(json["southwest"]),
    );

    Map<String, dynamic> toJson() => {
        "northeast": northeast == null ? null : northeast.toJson(),
        "southwest": southwest == null ? null : southwest.toJson(),
    };
}

// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeResponseModel homeModelFromJson(String str) =>
    HomeResponseModel.fromJson(json.decode(str));

String homeModelToJson(HomeResponseModel data) => json.encode(data.toJson());

class HomeResponseModel {
  List<Featured>? featured;
  List<Audiobook>? ebooks;
  List<Audiobook>? audiobooks;
  List<Audiobook>? newReleases;
  List<Audiobook>? bestsellingEbooks;
  AdditionalLists? additionalLists;

  HomeResponseModel({
    this.featured,
    this.ebooks,
    this.audiobooks,
    this.newReleases,
    this.bestsellingEbooks,
    this.additionalLists,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        featured: json["featured"] == null
            ? []
            : List<Featured>.from(
                json["featured"]!.map((x) => Featured.fromJson(x))),
        ebooks: json["ebooks"] == null
            ? []
            : List<Audiobook>.from(
                json["ebooks"]!.map((x) => Audiobook.fromJson(x))),
        audiobooks: json["audiobooks"] == null
            ? []
            : List<Audiobook>.from(
                json["audiobooks"]!.map((x) => Audiobook.fromJson(x))),
        newReleases: json["new_releases"] == null
            ? []
            : List<Audiobook>.from(
                json["new_releases"]!.map((x) => Audiobook.fromJson(x))),
        bestsellingEbooks: json["bestselling_ebooks"] == null
            ? []
            : List<Audiobook>.from(
                json["bestselling_ebooks"]!.map((x) => Audiobook.fromJson(x))),
        additionalLists: json["additional_lists"] == null
            ? null
            : AdditionalLists.fromJson(json["additional_lists"]),
      );

  Map<String, dynamic> toJson() => {
        "featured": featured == null
            ? []
            : List<dynamic>.from(featured!.map((x) => x.toJson())),
        "ebooks": ebooks == null
            ? []
            : List<dynamic>.from(ebooks!.map((x) => x.toJson())),
        "audiobooks": audiobooks == null
            ? []
            : List<dynamic>.from(audiobooks!.map((x) => x.toJson())),
        "new_releases": newReleases == null
            ? []
            : List<dynamic>.from(newReleases!.map((x) => x.toJson())),
        "bestselling_ebooks": bestsellingEbooks == null
            ? []
            : List<dynamic>.from(bestsellingEbooks!.map((x) => x.toJson())),
        "additional_lists": additionalLists?.toJson(),
      };
}

class AdditionalLists {
  AdditionalLists();

  factory AdditionalLists.fromJson(Map<String, dynamic> json) =>
      AdditionalLists();

  Map<String, dynamic> toJson() => {};
}

class Audiobook {
  String? title;
  String? englishTitle;
  String? slug;
  String? frontCover;

  Audiobook({
    this.title,
    this.englishTitle,
    this.slug,
    this.frontCover,
  });

  factory Audiobook.fromJson(Map<String, dynamic> json) => Audiobook(
        title: json["title"],
        englishTitle: json["english_title"],
        slug: json["slug"],
        frontCover: json["front_cover"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "english_title": englishTitle,
        "slug": slug,
        "front_cover": frontCover,
      };
}

class Featured {
  String? title;
  String? slug;
  String? type;
  String? image;
  dynamic caption;
  String? link;

  Featured({
    this.title,
    this.slug,
    this.type,
    this.image,
    this.caption,
    this.link,
  });

  factory Featured.fromJson(Map<String, dynamic> json) => Featured(
        title: json["title"],
        slug: json["slug"],
        type: json["type"],
        image: json["image"],
        caption: json["caption"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "type": type,
        "image": image,
        "caption": caption,
        "link": link,
      };
}

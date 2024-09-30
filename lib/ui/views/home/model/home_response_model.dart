// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

HomeResponseModel welcomeFromJson(String str) =>
    HomeResponseModel.fromJson(json.decode(str));

String welcomeToJson(HomeResponseModel data) => json.encode(data.toJson());

class HomeResponseModel {
  Pagination pagination;
  List<Result> results;

  HomeResponseModel({
    required this.pagination,
    required this.results,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        pagination: Pagination.fromJson(json["pagination"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Pagination {
  int count;
  int page;
  int pages;
  dynamic previous;
  String next;
  int size;

  Pagination({
    required this.count,
    required this.page,
    required this.pages,
    required this.previous,
    required this.next,
    required this.size,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        count: json["count"],
        page: json["page"],
        pages: json["pages"],
        previous: json["previous"],
        next: json["next"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "page": page,
        "pages": pages,
        "previous": previous,
        "next": next,
        "size": size,
      };
}

class Result {
  String title;
  String englishTitle;
  String slug;
  String frontCover;

  Result({
    required this.title,
    required this.englishTitle,
    required this.slug,
    required this.frontCover,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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

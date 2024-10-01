// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  String? englishTitle;
  dynamic englishSubtitle;
  String? nepaliTitle;
  dynamic nepaliSubtitle;
  String? englishDescription;
  String? nepaliDescription;
  String? backCoverText;
  String? language;
  Publisher? publisher;
  List<Category>? categories;
  DateTime? releaseOn;
  String? slug;
  Ebook? ebook;
  Paperback? paperback;
  dynamic hardcover;
  String? frontCover;
  List<Author>? authors;
  String? featuredImage;
  int? id;
  List<dynamic>? relatedBooks;
  String? amazon;
  dynamic pdf;
  bool? isUnicode;
  List<dynamic>? contributions;
  List<dynamic>? bookAwards;
  List<dynamic>? bookAwardShortlists;
  String? frontCoverFull;
  String? backCoverFull;
  String? backCoverThumbnail;
  bool? hasTableOfContents;
  dynamic audiobook;

  BookModel({
    this.englishTitle,
    this.englishSubtitle,
    this.nepaliTitle,
    this.nepaliSubtitle,
    this.englishDescription,
    this.nepaliDescription,
    this.backCoverText,
    this.language,
    this.publisher,
    this.categories,
    this.releaseOn,
    this.slug,
    this.ebook,
    this.paperback,
    this.hardcover,
    this.frontCover,
    this.authors,
    this.featuredImage,
    this.id,
    this.relatedBooks,
    this.amazon,
    this.pdf,
    this.isUnicode,
    this.contributions,
    this.bookAwards,
    this.bookAwardShortlists,
    this.frontCoverFull,
    this.backCoverFull,
    this.backCoverThumbnail,
    this.hasTableOfContents,
    this.audiobook,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        englishTitle: json["english_title"],
        englishSubtitle: json["english_subtitle"],
        nepaliTitle: json["nepali_title"],
        nepaliSubtitle: json["nepali_subtitle"],
        englishDescription: json["english_description"],
        nepaliDescription: json["nepali_description"],
        backCoverText: json["back_cover_text"],
        language: json["language"],
        publisher: json["publisher"] == null
            ? null
            : Publisher.fromJson(json["publisher"]),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        releaseOn: json["release_on"] == null
            ? null
            : DateTime.parse(json["release_on"]),
        slug: json["slug"],
        ebook: json["ebook"] == null ? null : Ebook.fromJson(json["ebook"]),
        paperback: json["paperback"] == null
            ? null
            : Paperback.fromJson(json["paperback"]),
        hardcover: json["hardcover"],
        frontCover: json["front_cover"],
        authors: json["authors"] == null
            ? []
            : List<Author>.from(
                json["authors"]!.map((x) => Author.fromJson(x))),
        featuredImage: json["featured_image"],
        id: json["id"],
        relatedBooks: json["related_books"] == null
            ? []
            : List<dynamic>.from(json["related_books"]!.map((x) => x)),
        amazon: json["amazon"],
        pdf: json["pdf"],
        isUnicode: json["is_unicode"],
        contributions: json["contributions"] == null
            ? []
            : List<dynamic>.from(json["contributions"]!.map((x) => x)),
        bookAwards: json["book_awards"] == null
            ? []
            : List<dynamic>.from(json["book_awards"]!.map((x) => x)),
        bookAwardShortlists: json["book_award_shortlists"] == null
            ? []
            : List<dynamic>.from(json["book_award_shortlists"]!.map((x) => x)),
        frontCoverFull: json["front_cover_full"],
        backCoverFull: json["back_cover_full"],
        backCoverThumbnail: json["back_cover_thumbnail"],
        hasTableOfContents: json["has_table_of_contents"],
        audiobook: json["audiobook"],
      );

  Map<String, dynamic> toJson() => {
        "english_title": englishTitle,
        "english_subtitle": englishSubtitle,
        "nepali_title": nepaliTitle,
        "nepali_subtitle": nepaliSubtitle,
        "english_description": englishDescription,
        "nepali_description": nepaliDescription,
        "back_cover_text": backCoverText,
        "language": language,
        "publisher": publisher?.toJson(),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "release_on":
            "${releaseOn!.year.toString().padLeft(4, '0')}-${releaseOn!.month.toString().padLeft(2, '0')}-${releaseOn!.day.toString().padLeft(2, '0')}",
        "slug": slug,
        "ebook": ebook?.toJson(),
        "paperback": paperback?.toJson(),
        "hardcover": hardcover,
        "front_cover": frontCover,
        "authors": authors == null
            ? []
            : List<dynamic>.from(authors!.map((x) => x.toJson())),
        "featured_image": featuredImage,
        "id": id,
        "related_books": relatedBooks == null
            ? []
            : List<dynamic>.from(relatedBooks!.map((x) => x)),
        "amazon": amazon,
        "pdf": pdf,
        "is_unicode": isUnicode,
        "contributions": contributions == null
            ? []
            : List<dynamic>.from(contributions!.map((x) => x)),
        "book_awards": bookAwards == null
            ? []
            : List<dynamic>.from(bookAwards!.map((x) => x)),
        "book_award_shortlists": bookAwardShortlists == null
            ? []
            : List<dynamic>.from(bookAwardShortlists!.map((x) => x)),
        "front_cover_full": frontCoverFull,
        "back_cover_full": backCoverFull,
        "back_cover_thumbnail": backCoverThumbnail,
        "has_table_of_contents": hasTableOfContents,
        "audiobook": audiobook,
      };
}

class Author {
  String? name;
  String? localizedName;
  String? slug;
  dynamic description;
  dynamic photo;

  Author({
    this.name,
    this.localizedName,
    this.slug,
    this.description,
    this.photo,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        localizedName: json["localized_name"],
        slug: json["slug"],
        description: json["description"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "localized_name": localizedName,
        "slug": slug,
        "description": description,
        "photo": photo,
      };
}

class Category {
  String? slug;
  String? name;

  Category({
    this.slug,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
      };
}

class Ebook {
  dynamic mrp;
  dynamic productId;
  dynamic sellingPrice;
  OwnershipStatus? ownershipStatus;
  bool? hasAudio;
  bool? isImageBook;
  dynamic googlePlayPid;
  bool? allowPurchase;
  bool? hasPreview;

  Ebook({
    this.mrp,
    this.productId,
    this.sellingPrice,
    this.ownershipStatus,
    this.hasAudio,
    this.isImageBook,
    this.googlePlayPid,
    this.allowPurchase,
    this.hasPreview,
  });

  factory Ebook.fromJson(Map<String, dynamic> json) => Ebook(
        mrp: json["mrp"],
        productId: json["product_id"],
        sellingPrice: json["selling_price"],
        ownershipStatus: json["ownership_status"] == null
            ? null
            : OwnershipStatus.fromJson(json["ownership_status"]),
        hasAudio: json["has_audio"],
        isImageBook: json["is_image_book"],
        googlePlayPid: json["google_play_pid"],
        allowPurchase: json["allow_purchase"],
        hasPreview: json["has_preview"],
      );

  Map<String, dynamic> toJson() => {
        "mrp": mrp,
        "product_id": productId,
        "selling_price": sellingPrice,
        "ownership_status": ownershipStatus?.toJson(),
        "has_audio": hasAudio,
        "is_image_book": isImageBook,
        "google_play_pid": googlePlayPid,
        "allow_purchase": allowPurchase,
        "has_preview": hasPreview,
      };
}

class OwnershipStatus {
  bool? access;
  String? reason;
  dynamic subscriptionData;

  OwnershipStatus({
    this.access,
    this.reason,
    this.subscriptionData,
  });

  factory OwnershipStatus.fromJson(Map<String, dynamic> json) =>
      OwnershipStatus(
        access: json["access"],
        reason: json["reason"],
        subscriptionData: json["subscription_data"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "reason": reason,
        "subscription_data": subscriptionData,
      };
}

class Paperback {
  bool? released;
  DateTime? releaseOn;
  dynamic editionText;
  String? isbn13;
  dynamic pages;
  dynamic width;
  dynamic height;
  dynamic thickness;
  double? weight;
  int? mrp;
  double? sellingPrice;
  int? productId;
  String? origin;
  String? isbn10;
  dynamic dimensions;
  bool? available;
  String? deliveryTime;

  Paperback({
    this.released,
    this.releaseOn,
    this.editionText,
    this.isbn13,
    this.pages,
    this.width,
    this.height,
    this.thickness,
    this.weight,
    this.mrp,
    this.sellingPrice,
    this.productId,
    this.origin,
    this.isbn10,
    this.dimensions,
    this.available,
    this.deliveryTime,
  });

  factory Paperback.fromJson(Map<String, dynamic> json) => Paperback(
        released: json["released"],
        releaseOn: json["release_on"] == null
            ? null
            : DateTime.parse(json["release_on"]),
        editionText: json["edition_text"],
        isbn13: json["isbn13"],
        pages: json["pages"],
        width: json["width"],
        height: json["height"],
        thickness: json["thickness"],
        weight: json["weight"],
        mrp: json["mrp"],
        sellingPrice: json["selling_price"],
        productId: json["product_id"],
        origin: json["origin"],
        isbn10: json["isbn10"],
        dimensions: json["dimensions"],
        available: json["available"],
        deliveryTime: json["delivery_time"],
      );

  Map<String, dynamic> toJson() => {
        "released": released,
        "release_on":
            "${releaseOn!.year.toString().padLeft(4, '0')}-${releaseOn!.month.toString().padLeft(2, '0')}-${releaseOn!.day.toString().padLeft(2, '0')}",
        "edition_text": editionText,
        "isbn13": isbn13,
        "pages": pages,
        "width": width,
        "height": height,
        "thickness": thickness,
        "weight": weight,
        "mrp": mrp,
        "selling_price": sellingPrice,
        "product_id": productId,
        "origin": origin,
        "isbn10": isbn10,
        "dimensions": dimensions,
        "available": available,
        "delivery_time": deliveryTime,
      };
}

class Publisher {
  String? slug;
  String? displayName;
  String? logo;

  Publisher({
    this.slug,
    this.displayName,
    this.logo,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        slug: json["slug"],
        displayName: json["display_name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "display_name": displayName,
        "logo": logo,
      };
}

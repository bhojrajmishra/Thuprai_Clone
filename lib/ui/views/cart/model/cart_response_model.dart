// To parse this JSON data, do
//
//     final getCartModel = getCartModelFromJson(jsonString);

import 'dart:convert';

CartResponseModel getCartModelFromJson(String str) =>
    CartResponseModel.fromJson(json.decode(str));

String getCartModelToJson(CartResponseModel data) => json.encode(data.toJson());

class CartResponseModel {
  int? id;
  String? owner;
  String? status;
  List<Line>? lines;
  String? url;
  String? totalExclTax;
  String? totalExclTaxExclDiscounts;
  String? totalInclTax;
  String? totalInclTaxExclDiscounts;
  String? totalTax;
  List<dynamic>? voucherDiscounts;
  bool? isTaxKnown;

  CartResponseModel({
    this.id,
    this.owner,
    this.status,
    this.lines,
    this.url,
    this.totalExclTax,
    this.totalExclTaxExclDiscounts,
    this.totalInclTax,
    this.totalInclTaxExclDiscounts,
    this.totalTax,
    this.voucherDiscounts,
    this.isTaxKnown,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      CartResponseModel(
        id: json["id"],
        owner: json["owner"],
        status: json["status"],
        lines: json["lines"] == null
            ? []
            : List<Line>.from(json["lines"]!.map((x) => Line.fromJson(x))),
        url: json["url"],
        totalExclTax: json["total_excl_tax"],
        totalExclTaxExclDiscounts: json["total_excl_tax_excl_discounts"],
        totalInclTax: json["total_incl_tax"],
        totalInclTaxExclDiscounts: json["total_incl_tax_excl_discounts"],
        totalTax: json["total_tax"],
        voucherDiscounts: json["voucher_discounts"] == null
            ? []
            : List<dynamic>.from(json["voucher_discounts"]!.map((x) => x)),
        isTaxKnown: json["is_tax_known"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "status": status,
        "lines": lines == null
            ? []
            : List<dynamic>.from(lines!.map((x) => x.toJson())),
        "url": url,
        "total_excl_tax": totalExclTax,
        "total_excl_tax_excl_discounts": totalExclTaxExclDiscounts,
        "total_incl_tax": totalInclTax,
        "total_incl_tax_excl_discounts": totalInclTaxExclDiscounts,
        "total_tax": totalTax,
        "voucher_discounts": voucherDiscounts == null
            ? []
            : List<dynamic>.from(voucherDiscounts!.map((x) => x)),
        "is_tax_known": isTaxKnown,
      };
}

class Line {
  int? id;
  int? quantity;
  String? priceInclTax;
  String? priceExclTax;
  int? productId;
  String? productTitle;
  String? productUpc;
  String? productClass;
  double? mrp;
  String? thumbnail;
  String? slug;

  Line({
    this.id,
    this.quantity,
    this.priceInclTax,
    this.priceExclTax,
    this.productId,
    this.productTitle,
    this.productUpc,
    this.productClass,
    this.mrp,
    this.thumbnail,
    this.slug,
  });

  factory Line.fromJson(Map<String, dynamic> json) => Line(
        id: json["id"],
        quantity: json["quantity"],
        priceInclTax: json["price_incl_tax"],
        priceExclTax: json["price_excl_tax"],
        productId: json["product_id"],
        productTitle: json["product_title"],
        productUpc: json["product_upc"],
        productClass: json["product_class"],
        mrp: json["mrp"],
        thumbnail: json["thumbnail"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "price_incl_tax": priceInclTax,
        "price_excl_tax": priceExclTax,
        "product_id": productId,
        "product_title": productTitle,
        "product_upc": productUpc,
        "product_class": productClass,
        "mrp": mrp,
        "thumbnail": thumbnail,
        "slug": slug,
      };
}

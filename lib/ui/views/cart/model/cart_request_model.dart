class CartRequestModel {
  String? path;
  int? quantity;
  String? url;

  CartRequestModel({
    this.path,
    this.quantity,
    this.url,
  });

  // Convert a JSON map into a LoginModel object
  factory CartRequestModel.fromJson(Map<String, dynamic> json) {
    return CartRequestModel(
      path: json['path'] ?? '',
      quantity: json['quantity'] ?? '',
      url: json['url'] ?? '',
    );
  }

  // Convert a LoginModel object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'quantity': quantity,
      'url': url,
    };
  }
}

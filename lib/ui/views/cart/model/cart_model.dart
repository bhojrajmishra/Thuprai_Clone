class CartModel {
  //product for sale
  final String bookId;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;

  CartModel({
    required this.bookId,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

//user cart
  static List<CartModel> cartItems = [];

  static double get totalPrice {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  static void addToCart(CartModel item) {
    cartItems.add(item);
  }

  static void removeFromCart(CartModel item) {
    cartItems.remove(item);
  }

  static void clearCart() {
    cartItems.clear();
  }
}

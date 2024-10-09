class Product {
  final String name;
  final String image;
  final String category;
  final double price;
  final double offerPrice;
  final String quantity;
  final String shop;
  final String id;

  Product({
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    required this.offerPrice,
    required this.quantity,
    required this.shop,
    required this.id,
  });

  // Factory method to create a Product object from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? 'No name available',
      image: json['image'] ?? '',
      category: json['category']['name'] ?? 'Unknown category',
      price: (json['price'] != null) ? double.tryParse(json['price'].toString()) ?? 0.0 : 0.0,
      offerPrice: (json['offerPrice'] != null) ? double.tryParse(json['offerPrice'].toString()) ?? 0.0 : 0.0,
      quantity: json['quantity'] ?? '0',
      shop: json['shop'] ?? 'Unknown shop',
      id: json['_id'] ?? '',
    );
  }
}

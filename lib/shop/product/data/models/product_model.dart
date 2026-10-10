import 'package:my_store/shop/product/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title, // all pages use this one
    required super.price, // all pages use this one
    required super.description,
    required super.category, // all pages use this one
    required super.stock, // all pages use this one
    required super.size,
    required super.image, // all pages use this one
    required super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      stock: json['stock'],
      size: List<String>.from(json['size']),
      image: json['image'],
      rating: (json['rating'] as num).toInt(),
    );
  }
}

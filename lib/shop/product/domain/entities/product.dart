import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final int stock;
  final List<String> size;
  final String image;
  final int rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.stock,
    required this.size,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    category,
    stock,
    size,
    image,
    rating,
  ];
}

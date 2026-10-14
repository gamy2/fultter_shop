import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class GetAllProductsEvent extends ProductsEvent {}

class GetAllCategoriesEvent extends ProductsEvent {}

// class GetFeaturedProductsEvent extends ProductsEvent {}

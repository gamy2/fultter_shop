import 'package:equatable/equatable.dart';
import 'package:my_store/core/utils/enums.dart';
import 'package:my_store/shop/product/domain/entities/product.dart';

class ProductsState extends Equatable {
  final List<Product> products;
  final String productsErrorMessage;
  final RequestState productsRequestState;
  // final List<Product> featuredProducts;
  // final String featuredProductsErrorMessage;
  // final RequestState featuredProductsRequestState;

  const ProductsState({
    this.products = const [],
    this.productsErrorMessage = '',
    this.productsRequestState = RequestState.loading,
    // this.featuredProducts = const [],
    // this.featuredProductsErrorMessage = '',
    // this.featuredProductsRequestState = RequestState.loading,
  });
  @override
  List<Object?> get props => [
    products,
    productsErrorMessage,
    productsRequestState,
    // featuredProducts,
    // featuredProductsErrorMessage,
    // featuredProductsRequestState,
  ];
}

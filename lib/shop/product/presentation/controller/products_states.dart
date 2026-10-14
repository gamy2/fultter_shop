import 'package:equatable/equatable.dart';
import 'package:my_store/core/utils/enums.dart';
import 'package:my_store/shop/product/domain/entities/category.dart';
import 'package:my_store/shop/product/domain/entities/product.dart';

class ProductsState extends Equatable {
  final List<Product> products;
  final String productsErrorMessage;
  final RequestState productsRequestState;
  final List<Category> categories;
  final String categoriesErrorMessage;
  final RequestState categoriesRequestState;

  const ProductsState({
    this.products = const [],
    this.productsErrorMessage = '',
    this.productsRequestState = RequestState.loading,
    this.categories = const [],
    this.categoriesErrorMessage = '',
    this.categoriesRequestState = RequestState.loading,
  });
  ProductsState copyWith({
    List<Product>? products,
    String? productsErrorMessage,
    RequestState? productsRequestState,
    List<Category>? categories,
    String? categoriesErrorMessage,
    RequestState? categoriesRequestState,
  }) => ProductsState(
    products: products ?? this.products,
    productsErrorMessage: productsErrorMessage ?? this.productsErrorMessage,
    productsRequestState: productsRequestState ?? this.productsRequestState,
    categories: categories ?? this.categories,
    categoriesErrorMessage:
        categoriesErrorMessage ?? this.categoriesErrorMessage,
    categoriesRequestState:
        categoriesRequestState ?? this.categoriesRequestState,
  );

  @override
  List<Object?> get props => [
    products,
    productsErrorMessage,
    productsRequestState,
    categories,
    categoriesErrorMessage,
    categoriesRequestState,
  ];
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/enums.dart';
import 'package:my_store/shop/product/domain/usecase/get_all_categories_usecase.dart';
import 'package:my_store/shop/product/domain/usecase/get_all_products_usecase.dart';
import 'package:my_store/shop/product/presentation/controller/products_events.dart';
import 'package:my_store/shop/product/presentation/controller/products_states.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsUsecase getAllProductsUsecase;
  final GetAllCategoriesUsecase getAllCategoriesUsecase;

  ProductsBloc(this.getAllProductsUsecase, this.getAllCategoriesUsecase)
    : super(ProductsState()) {
    // Get all products
    on<GetAllProductsEvent>((event, emit) async {
      final res = await getAllProductsUsecase.call();

      res.fold(
        (l) => emit(
          state.copyWith(
            productsRequestState: RequestState.error,
            productsErrorMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            products: r,
            productsRequestState: RequestState.loaded,
          ),
        ),
      );
    });

    on<GetAllCategoriesEvent>((event, emit) async {
      final res = await getAllCategoriesUsecase.call();

      res.fold(
        (l) => emit(
          state.copyWith(
            categoriesRequestState: RequestState.error,
            categoriesErrorMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            categories: r,
            categoriesRequestState: RequestState.loaded,
          ),
        ),
      );
    });

    // on<GetFeaturedProductsEvent>((event, emit) async {});
  }
}


// [] != null
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/enums.dart';
import 'package:my_store/shop/product/domain/usecase/get_all_products_usecase.dart';
import 'package:my_store/shop/product/presentation/controller/products_events.dart';
import 'package:my_store/shop/product/presentation/controller/products_states.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsUsecase getAllProductsUsecase;

  ProductsBloc(this.getAllProductsUsecase) : super(ProductsState()) {
    // Get all products
    on<GetAllProductsEvent>((event, emit) async {
      final res = await getAllProductsUsecase.call();
      // print(res);
      res.fold(
        (l) => emit(
          ProductsState(
            productsRequestState: RequestState.error,
            productsErrorMessage: l.message,
          ),
        ),
        (r) => emit(
          ProductsState(products: r, productsRequestState: RequestState.loaded),
        ),
      );
    });

    // on<GetFeaturedProductsEvent>((event, emit) async {});
  }
}


// [] != null
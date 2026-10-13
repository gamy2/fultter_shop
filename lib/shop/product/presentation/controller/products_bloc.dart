import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/network/dio_client.dart';
import 'package:my_store/core/utils/enums.dart';
import 'package:my_store/shop/product/data/datasource/product_remote_data_source.dart';
import 'package:my_store/shop/product/data/repository/product_repository.dart';
import 'package:my_store/shop/product/domain/repository/base_product_repository.dart';
import 'package:my_store/shop/product/domain/usecase/get_all_products_usecase.dart';
import 'package:my_store/shop/product/presentation/controller/products_events.dart';
import 'package:my_store/shop/product/presentation/controller/products_states.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState()) {
    // Get all products
    on<GetAllProductsEvent>((event, emit) async {
      BaseProductRremoteDataSource baseProductRemoteDataSource =
          ProductRemoteDataSource(DioClient());
      BaseProductRepository baseProductRepository = ProductRepository(
        baseProductRemoteDataSource,
      );
      final res = await GetAllProductsUsecase(baseProductRepository).call();
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
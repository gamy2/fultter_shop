import 'package:get_it/get_it.dart';
import 'package:my_store/core/network/dio_client.dart';
import 'package:my_store/shop/product/data/datasource/product_remote_data_source.dart';
import 'package:my_store/shop/product/data/repository/product_repository.dart';
import 'package:my_store/shop/product/domain/repository/base_product_repository.dart';
import 'package:my_store/shop/product/domain/usecase/get_all_products_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void setupLocator() {
    // useCases
    sl.registerLazySingleton(() => GetAllProductsUsecase(sl()));

    // repo
    sl.registerLazySingleton<BaseProductRepository>(
      () => ProductRepository(sl()),
    );
    // data sourse
    sl.registerLazySingleton<BaseProductRremoteDataSource>(
      () => ProductRemoteDataSource(DioClient()),
    );
  }
}

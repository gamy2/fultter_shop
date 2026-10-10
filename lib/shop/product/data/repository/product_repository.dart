import 'package:dartz/dartz.dart';
import 'package:my_store/core/error/excptions.dart';
import 'package:my_store/core/error/failure.dart';
import 'package:my_store/shop/product/data/datasource/product_remote_data_source.dart';
import 'package:my_store/shop/product/domain/entities/product.dart';
import 'package:my_store/shop/product/domain/repository/base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  final BaseProductRremoteDataSource productRemoteDataSource;
  ProductRepository(this.productRemoteDataSource);
  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    final result = await productRemoteDataSource.getAllProducts();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(int id) async {
    final result = await productRemoteDataSource.getProductById(id);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorModel.message));
    }
  }
}

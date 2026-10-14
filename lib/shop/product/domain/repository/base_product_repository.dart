import 'package:dartz/dartz.dart';
import 'package:my_store/core/error/failure.dart';
import 'package:my_store/shop/product/domain/entities/category.dart';
import 'package:my_store/shop/product/domain/entities/product.dart';

// contract
abstract class BaseProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Product>> getProductById(int id);
  Future<Either<Failure, List<Category>>> getAllCategories();
}

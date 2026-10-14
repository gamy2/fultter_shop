import 'package:dartz/dartz.dart';
import 'package:my_store/core/error/failure.dart';
import 'package:my_store/shop/product/domain/entities/category.dart';
import 'package:my_store/shop/product/domain/repository/base_product_repository.dart';

class GetAllCategoriesUsecase {
  final BaseProductRepository baseProductRepository;

  GetAllCategoriesUsecase(this.baseProductRepository);

  Future<Either<Failure, List<Category>>> call() async {
    return await baseProductRepository.getAllCategories();
  }
}


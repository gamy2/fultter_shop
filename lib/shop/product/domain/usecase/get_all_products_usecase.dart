import 'package:my_store/shop/product/domain/entities/product.dart';
import 'package:my_store/shop/product/domain/repository/base_product_repository.dart';

class GetAllProductsUsecase {
  final BaseProductRepository baseProductRepository;

  GetAllProductsUsecase(this.baseProductRepository);

  Future<List<Product>> call() async {
    return await baseProductRepository.getAllProducts();
  }
}

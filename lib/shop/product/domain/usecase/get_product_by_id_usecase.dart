import 'package:my_store/shop/product/domain/entities/product.dart';
import 'package:my_store/shop/product/domain/repository/base_product_repository.dart';

class GetProductByIdUseCase {
  final BaseProductRepository baseProductRepository;

  GetProductByIdUseCase(this.baseProductRepository);

  Future<Product> call(int id) async {
    return await baseProductRepository.getProductById(id);
  }
}

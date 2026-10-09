import 'package:my_store/shop/product/domain/entities/product.dart';

// contract
abstract class BaseProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(int id);
}

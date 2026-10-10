import 'package:dio/dio.dart';
import 'package:my_store/core/network/network_constantes.dart';
import 'package:my_store/shop/product/data/models/product_model.dart';

abstract class BaseProductRremoteDataSource {}

class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts() async {
    final response = await Dio().get('${NetworkConstants.baseUrl}products');

    if (response.statusCode == 200) {
      return List<ProductModel>.from(
        (response.data as List).map((e) => ProductModel.fromJson(e)),
      );
    } else {
      return [];
    }
  }
}

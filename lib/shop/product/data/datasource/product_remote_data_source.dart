import 'package:dio/dio.dart';
import 'package:my_store/core/error/excptions.dart';
import 'package:my_store/core/network/dio_client.dart';
import 'package:my_store/core/network/error_model.dart';
import 'package:my_store/core/network/network_constantes.dart';
import 'package:my_store/shop/product/data/models/product_model.dart';

abstract class BaseProductRremoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(int id);
}

class ProductRemoteDataSource extends BaseProductRremoteDataSource {
  ProductRemoteDataSource(this._dioClient);

  final DioClient _dioClient;
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await Dio().get(NetworkConstants.productsEndpoint);

    if (response.statusCode == 200) {
      return List<ProductModel>.from(
        (response.data["data"] as List).map((e) => ProductModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final response = await _dioClient.dio.get(
      NetworkConstants.getProductByIdPath(id),
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}

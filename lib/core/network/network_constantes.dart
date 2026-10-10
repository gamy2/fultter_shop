class NetworkConstants {
  static const String baseUrl = "https://fakestoreapi.noksha.dev/api/";
  static const String productsEndpoint = "${baseUrl}products";
  // static method
  static String getProductByIdPath(int id) => "products/$id";
}

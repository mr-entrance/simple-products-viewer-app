import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:simple_product_viewer_app/services/api_client.dart';

class ProductService {
  final ApiClient _apiClient;

  ProductService({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<ProductModel>> fetchProductList() async {
    final response = await _apiClient.get(path: ApiConstants.productListPath);
    final res = ApiListResult<ProductModel>.fromJson(
      response.data,
      (json) => ProductModel.fromJson(json as Map<String, Object?>),
    );
    return res.data;
  }
}

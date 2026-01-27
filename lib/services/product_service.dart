import 'package:simple_product_viewer_app/models/product_model.dart';
import 'package:simple_product_viewer_app/services/api_client.dart';

class ProductService {
  final ApiClient _apiClient;
  final List<ProductModel> _cachedProducts = [];

  ProductService({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<ProductModel>> fetchProductList() async {
    final response = await _apiClient.get(path: ApiConstants.productListPath);
    final res = ApiListResult<ProductModel>.fromJson(
      response.data,
      (json) => ProductModel.fromJson(json as Map<String, Object?>),
    );
    _cachedProducts.addAll(res.data);
    return res.data;
  }

  Future<ProductModel> fetchProduct(String id) async {
    if (_cachedProducts.isNotEmpty) {
      return _cachedProducts.firstWhere((product) => product.id == id);
    }
    final list = await fetchProductList();
    return list.firstWhere((product) => product.id == id);
  }
}

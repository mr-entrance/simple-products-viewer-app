import 'package:get_it/get_it.dart';
import 'package:simple_product_viewer_app/services/api_client.dart';
import 'package:simple_product_viewer_app/services/product_service.dart';

final getIt = GetIt.instance;

void init() {
  // core
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  // services
  getIt.registerLazySingleton(() => ProductService(apiClient: getIt()));
}

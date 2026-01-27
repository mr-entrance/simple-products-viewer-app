import 'package:get_it/get_it.dart';
import 'package:simple_product_viewer_app/screens/product_detail/product_detail_cubit.dart';
import 'package:simple_product_viewer_app/screens/product_list/product_list_cubit.dart';
import 'package:simple_product_viewer_app/services/api_client.dart';
import 'package:simple_product_viewer_app/services/product_service.dart';

final sl = GetIt.instance;

void init() {
  // core
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  // services
  sl.registerLazySingleton(() => ProductService(apiClient: sl()));
  // cubits
  sl.registerFactory(() => ProductListCubit(sl()));
  sl.registerFactory(() => ProductDetailCubit(sl()));
}

import 'package:get_it/get_it.dart';
import 'package:simple_product_viewer_app/cubits/recently_viewed_product_list_cubit.dart';
import 'package:simple_product_viewer_app/screens/cart/cart_cubit.dart';
import 'package:simple_product_viewer_app/cubits/product_list_cubit.dart';
import 'package:simple_product_viewer_app/services/api_client.dart';
import 'package:simple_product_viewer_app/services/product_service.dart';

final sl = GetIt.instance;

void init() {
  // core
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  // services
  sl.registerLazySingleton(() => ProductService(apiClient: sl()));
  // cubits
  sl.registerLazySingleton(() => ProductListCubit(sl()));
  sl.registerLazySingleton(() => RecentlyViewedProductListCubit());
  sl.registerLazySingleton(() => CartCubit());
}

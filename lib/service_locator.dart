import 'package:get_it/get_it.dart';
import 'package:online_store/features/auth/data/repository/auth_repository_impl.dart';
import 'package:online_store/features/auth/data/source/auth_firebase_service.dart';
import 'package:online_store/features/auth/domain/repository/auth_repository.dart';
import 'package:online_store/features/auth/domain/use_case/get_ages.dart';
import 'package:online_store/features/auth/domain/use_case/get_current_user_use_case.dart';
import 'package:online_store/features/auth/domain/use_case/is_logged_in_use_case.dart';
import 'package:online_store/features/auth/domain/use_case/send_password_reset_email_use_case.dart';
import 'package:online_store/features/auth/domain/use_case/sign_out_use_case.dart';
import 'package:online_store/features/auth/domain/use_case/signin_use_case.dart';
import 'package:online_store/features/auth/domain/use_case/signup_use_case.dart';
import 'package:online_store/features/cart/domain/use_cases/get_cart_products_use_case.dart';
import 'package:online_store/features/cart/domain/use_cases/remove_item_from_cart_use_case.dart';
import 'package:online_store/features/checkout/data/repositories/order_repository_impl.dart';
import 'package:online_store/features/checkout/data/sources/order_firebase_services.dart';
import 'package:online_store/features/checkout/domain/repositories/order_repository.dart';
import 'package:online_store/features/checkout/domain/use_cases/get_orders_use_case.dart';
import 'package:online_store/features/checkout/domain/use_cases/order_regestration_use_case.dart';
import 'package:online_store/features/home/data/repository/category_repository_impl.dart';
import 'package:online_store/features/home/data/repository/product_repository_impl.dart';
import 'package:online_store/features/home/data/source/category_firebase_services.dart';
import 'package:online_store/features/home/data/source/product_firebase_service.dart';
import 'package:online_store/features/home/domain/repository/category_repository.dart';
import 'package:online_store/features/home/domain/repository/product_repository.dart';
import 'package:online_store/features/home/domain/use_case.dart/category/get_categories_use_case.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/add_or_remove_favorite_product_use_case.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_favorite_products_use_case.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_new_in_use_case.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_products_by_category_id_use_case.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_products_by_title_use_case.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/get_top_selling_use_case.dart';
import 'package:online_store/features/cart/data/repository/cart_repository_impl.dart';
import 'package:online_store/features/cart/data/sources/cart_firebase_service.dart';
import 'package:online_store/features/cart/domain/repository/cart_repository.dart';
import 'package:online_store/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:online_store/features/home/domain/use_case.dart/product/is_favorite_product_use_case.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services
  getIt.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );
  getIt.registerSingleton<CategoryFirebaseServices>(
    CategoryFirebaseServicesImpl(),
  );
  getIt.registerSingleton<ProductFirebaseService>(
    ProductFirebaseServiceImpl(),
  );
  getIt.registerSingleton<CartFirebaseService>(
    CartFirebaseServiceImpl(),
  );
  getIt.registerSingleton<OrderFirebaseService>(
    OrderFirebaseServiceImpl(),
  );

  // Repositories
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );
  getIt.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(),
  );
  getIt.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(),
  );
  getIt.registerSingleton<CartRepository>(
    CartRepositoryImpl(),
  );
  getIt.registerSingleton<OrderRepository>(
    OrderRepositoryImpl(),
  );

  // UseCases
  getIt.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
  getIt.registerSingleton<SignOutUseCase>(
    SignOutUseCase(),
  );
  getIt.registerSingleton<GetAgesUseCase>(
    GetAgesUseCase(),
  );
  getIt.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );
  getIt.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );
  getIt.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase(),
  );
  getIt.registerSingleton<GetCurrentUserUseCase>(
    GetCurrentUserUseCase(),
  );
  getIt.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase(),
  );
  getIt.registerSingleton<GetTopSellingUseCase>(
    GetTopSellingUseCase(),
  );
  getIt.registerSingleton<GetNewInUseCase>(
    GetNewInUseCase(),
  );
  getIt.registerSingleton<GetProductsByCategoryIdUseCase>(
    GetProductsByCategoryIdUseCase(),
  );
  getIt.registerSingleton<GetProductsByTitleUseCase>(
    GetProductsByTitleUseCase(),
  );
  getIt.registerSingleton<AddToCartUseCase>(
    AddToCartUseCase(),
  );
  getIt.registerSingleton<GetCartProductsUseCase>(
    GetCartProductsUseCase(),
  );
  getIt.registerSingleton<RemoveItemFromCartUseCase>(
    RemoveItemFromCartUseCase(),
  );
  getIt.registerSingleton<OrderRegestrationUseCase>(
    OrderRegestrationUseCase(),
  );
  getIt.registerSingleton<AddOrRemoveFavoriteProductUseCase>(
    AddOrRemoveFavoriteProductUseCase(),
  );
  getIt.registerSingleton<IsFavoriteProductUseCase>(
    IsFavoriteProductUseCase(),
  );
  getIt.registerSingleton<GetFavoriteProductsUseCase>(
    GetFavoriteProductsUseCase(),
  );
  getIt.registerSingleton<GetOrdersUseCase>(
    GetOrdersUseCase(),
  );
}

import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

class ProductPriceHelper {
 static double provideCurrentPrice({required ProductEntity product}) {
    return product.discountedPrice != 0
        ? product.discountedPrice.toDouble()
        : product.price.toDouble();
  }
}

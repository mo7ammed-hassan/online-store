import 'package:online_store/features/cart/domain/entity/cart_item_entity.dart';

class CartHelper {
  static double calculateCartSubTotal(List<CartItemEntity> cartItems) {
    double subTotalPrice = 0.0;
    for (var item in cartItems) {
      subTotalPrice = subTotalPrice + (item.totalPrice * item.productQuantity);
    }
    return subTotalPrice;
  }
}

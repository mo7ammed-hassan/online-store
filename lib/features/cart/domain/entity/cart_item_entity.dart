class CartItemEntity {
  final String productId;
  final String productTitle;
  final double productPrice;
  final String productSize;
  final String productColor;
  final String productImage;
  final int productQuantity;
  final double totalPrice;
  final String createdDate;
  final String id;

  CartItemEntity({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productSize,
    required this.productColor,
    required this.productImage,
    required this.productQuantity,
    required this.totalPrice,
    required this.createdDate,
    required this.id,
  });
}

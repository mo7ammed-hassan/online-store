import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_store/features/home/domain/entity/product/product_color_entity.dart';

class ProductEntity {
  final String categoryId;
  final List<ProductColorEntity> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final num gender;
  final List<String> images;
  final num price;
  final List<String> size;
  final String productId;
  final num salesNumber;
  final String title;

  ProductEntity(
      {required this.categoryId,
      required this.colors,
      required this.createdDate,
      required this.discountedPrice,
      required this.gender,
      required this.images,
      required this.price,
      required this.size,
      required this.productId,
      required this.salesNumber,
      required this.title});
}

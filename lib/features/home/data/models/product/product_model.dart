// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_store/features/home/data/models/product/product_color_model.dart';
import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

class ProductModel {
  final String categoryId;
  final String title;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final List<String> images;
  final num price;
  final num discountedPrice;
  final num gender;
  final String productId;
  final num salesNumber;
  final List<String> size;

  ProductModel({
    required this.categoryId,
    required this.title,
    required this.colors,
    required this.createdDate,
    required this.images,
    required this.price,
    required this.discountedPrice,
    required this.gender,
    required this.productId,
    required this.salesNumber,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'title': title,
      'colors': colors.map((e) => e.toMap()).toList(),
      'createdDate': createdDate,
      'images': images.map((e) => e.toString()).toList(),
      'price': price,
      'discountPrice': discountedPrice,
      'gender': gender,
      'productId': productId,
      'salesNumber': salesNumber,
      'size': size.map((e) => e.toString()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
      title: map['title'] as String,
      colors: List<ProductColorModel>.from(
        map['colors'].map((e) => ProductColorModel.fromMap(e)),
      ),
      createdDate: map['createdDate'] as Timestamp,
      images: List<String>.from(
        map['images'].map((e) => e.toString()),
      ),
      price: map['price'] as num,
      discountedPrice: map['discountPrice'] as num,
      gender: map['gender'] as num,
      productId: map['productId'] as String,
      salesNumber: map['salesNumber'] as num,
      size: List<String>.from(
        map['size'].map((e) => e.toString()),
      ),
    );
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      size: size,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId: categoryId,
      colors: colors.map((e) => e.fromEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      size: size,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}

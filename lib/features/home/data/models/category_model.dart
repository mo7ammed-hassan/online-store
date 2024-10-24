// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:online_store/features/home/domain/entity/category_entity.dart';

class CategoryModel {
  final String categoryId;
  final String title;
  final String imageUrl;

  CategoryModel(
    this.categoryId,
    this.title,
    this.imageUrl,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'title': title,
      'image': imageUrl,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      map['categoryId'] as String,
      map['title'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      title: title,
      imageUrl: imageUrl,
    );
  }
}

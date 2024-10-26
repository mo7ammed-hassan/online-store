import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

abstract class TopSellingDisplayState {}

class TopSellingLoading extends TopSellingDisplayState {}

class TopSellingLoaded extends TopSellingDisplayState {
  final List<ProductEntity> products;
  TopSellingLoaded({required this.products});
}

class LoadTopSellingFailure extends TopSellingDisplayState {}

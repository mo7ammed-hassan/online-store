import 'package:online_store/features/home/domain/entity/product/product_entity.dart';

abstract class NewInDisplayState {}

class NewInLoading extends NewInDisplayState {}

class NewInLoaded extends NewInDisplayState {
  final List<ProductEntity> products;
  NewInLoaded({required this.products});
}

class LoadNewInFailure extends NewInDisplayState {}

import 'package:online_store/features/order/domain/entity/order_entity.dart';

abstract class GetOrdersState {}

class GetOrdersLoading extends GetOrdersState {}

class GetOrdersLoaded extends GetOrdersState {
  final List<OrderEntity> orders;

  GetOrdersLoaded(this.orders);
}

class GetOrdersFailure extends GetOrdersState {
  final String errorMessage;

  GetOrdersFailure(this.errorMessage);
}

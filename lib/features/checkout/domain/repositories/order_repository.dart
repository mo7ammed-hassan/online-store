import 'package:dartz/dartz.dart';
import 'package:online_store/features/checkout/data/models/order_registration_req_model.dart';

abstract class OrderRepository {
  Future<Either> orderRegistration(OrderRegistrationReqModel order);
  Future<Either> getOrders();
}

import 'package:dartz/dartz.dart';
import 'package:online_store/features/order/data/models/order_model.dart';
import 'package:online_store/features/checkout/data/models/order_registration_req_model.dart';
import 'package:online_store/features/checkout/data/sources/order_firebase_services.dart';
import 'package:online_store/features/checkout/domain/repositories/order_repository.dart';
import 'package:online_store/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> orderRegistration(OrderRegistrationReqModel order) async {
    var returnedDta =
        await getIt<OrderFirebaseService>().orderRegistration(order);

    return returnedDta.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );
  }

  @override
  Future<Either> getOrders() async {
    var returnedDta = await getIt<OrderFirebaseService>().getOrders();

    return returnedDta.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map(
                (e) => OrderModel.fromMap(e).toEntity(),
              )
              .toList(),
        );
      },
    );
  }
}

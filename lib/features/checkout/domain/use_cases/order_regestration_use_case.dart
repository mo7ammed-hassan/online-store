import 'package:online_store/core/usecase.dart/usecase.dart';
import 'package:online_store/features/checkout/data/models/order_registration_req_model.dart';
import 'package:online_store/features/checkout/domain/repositories/order_repository.dart';
import 'package:online_store/service_locator.dart';

class OrderRegestrationUseCase extends UseCase<dynamic, OrderRegistrationReqModel> {
  @override
  Future call({OrderRegistrationReqModel? params}) async {
    return await getIt<OrderRepository>().orderRegistration(params!);
  }
}

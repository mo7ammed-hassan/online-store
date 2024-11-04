import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/features/checkout/domain/use_cases/get_orders_use_case.dart';
import 'package:online_store/features/order/presentation/cubits/get_orders_state.dart';
import 'package:online_store/service_locator.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersLoading());

  void getAllOrders() async {
    var returnedData = await getIt<GetOrdersUseCase>().call();

    returnedData.fold(
      (error) {
        emit(
          GetOrdersFailure(error),
        );
      },
      (orders) {
        emit(
          GetOrdersLoaded(orders),
        );
      },
    );
  }
}

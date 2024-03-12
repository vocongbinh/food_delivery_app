import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/common/repository/repository_helper.dart';
import 'package:food_delivery_app/data/api/order/order_api.dart';
import 'package:food_delivery_app/data/model/Order/order.dart' as orderModel;

class OrderRepository with RepositoryHelper<orderModel.Order> {
  final OrderApi orderApi;

  const OrderRepository({required this.orderApi});

  Future<Either<String, bool>> createOrder(orderModel.Order order) async {
    return checkItemFailOrSuccess(orderApi.createOrder(order));
  }
}

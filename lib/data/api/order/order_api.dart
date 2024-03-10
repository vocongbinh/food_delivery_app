import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/model/Order/order.dart';
import 'package:food_delivery_app/values/app_config.dart';

class OrderApi with ApiHelper<Order> {
  final DioClient dioClient;

  OrderApi({required this.dioClient});

  Future<bool> createOrder(Order Order) async {
    return await makePostRequest(
        dioClient.dio.post("${ApiConfig.order}", data: Order));
  }
}

import 'package:dio/dio.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/data/api/order/order_api.dart';
import 'package:food_delivery_app/models/auth_controller.dart';
import 'package:food_delivery_app/models/on_boarding_controller.dart';
import 'package:food_delivery_app/repository/order_repository.dart';
import 'package:food_delivery_app/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //dio
  Get.lazyPut(() => Dio());
  Get.lazyPut(() => DioClient(Get.find<Dio>()));
  //api
  Get.lazyPut(() => OrderApi(dioClient: Get.find<DioClient>()));
  //repos
  Get.lazyPut(() => UserRepository());
  Get.lazyPut(() => OrderRepository(orderApi: Get.find<OrderApi>()));
  //controllers
  Get.lazyPut(() => AuthController(Get.find<OrderRepository>()));
  Get.lazyPut(() => OnBoardingController());
}

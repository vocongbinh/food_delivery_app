import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/model/Order/order.dart' as orderModel;
import 'package:food_delivery_app/repository/order_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final OrderRepository orderRepository;
  AuthController(this.orderRepository);
  void sendRequest() async {
    orderModel.Order order =
        orderModel.Order(message: "message", userId: "userId", orderId: "12");
    Either<String, bool> response = await orderRepository.createOrder(order);
    print(response.isRight());
  }

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    update();
  }

  bool _firstTime = false;

  bool get firstTime => _firstTime;

  set firstTime(bool newState) {
    _obscureText = newState;
    update();
  }

  bool? _loggedIn;

  bool get loggedIn => _loggedIn ?? false;

  set loggedIn(bool newState) {
    _loggedIn = newState;
    update();
  }

  bool? _isRememberMe;

  bool get isRememberMe => _isRememberMe ?? false;

  set isRememberMe(bool newState) {
    _isRememberMe = newState;
    update();
  }

  final updateProfileFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.getBool('loggedIn') ?? false;
  }

  validateAndSave() {
    final form = loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

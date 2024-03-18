import 'package:food_delivery_app/common/network/api_helper.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';

import 'package:food_delivery_app/data/model/address/address.dart';

import 'package:food_delivery_app/values/app_config.dart';

class AddressApi with ApiHelper<Address> {
  final DioClient dioClient;

  AddressApi({required this.dioClient});

  Future<bool> addAddress(Map<String, dynamic> address) async {
    return await makePostRequest(
        dioClient.dio.post(ApiConfig.address, data: address));
  }

  Future<List<Address>> getAll() async {
    return await makeGetRequest(
        dioClient.dio.get(ApiConfig.address), Address.fromJson);
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as location;
import 'package:permission_handler/permission_handler.dart' as handler;

class LocationService {
  LocationService.init();
  static LocationService instance = LocationService.init();
  final location.Location _location = location.Location();
  Future<bool> checkForServiceAvailability() async {
    bool isEnabled = await _location.serviceEnabled();
    if (isEnabled) {
      return Future.value(true);
    }
    isEnabled = await _location.requestService();
    if (isEnabled) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> checkForPermission() async {
    location.PermissionStatus status = await _location.hasPermission();
    if (status == location.PermissionStatus.denied) {
      status = await _location.requestPermission();
      if (status == location.PermissionStatus.granted) {
        return true;
      }
      return false;
    }
    if (status == location.PermissionStatus.deniedForever) {
      Get.snackbar("Permission Needed",
          "We use permission to get your location in order to give you",
          onTap: (snack) async {
        await handler.openAppSettings();
      }).show();
      return false;
    }
    return Future.value(true);
  }

  Future<void> getUserLocation(LocationController controller) async {
    controller.updateIsAccessingLocation(true);
    if (!(await checkForServiceAvailability())) {
      controller.errorDescription.value = 'Service is not available';
      controller.updateIsAccessingLocation(false);
      return;
    }
    if (!(await checkForPermission())) {
      controller.errorDescription.value = 'Permission not given';

      controller.updateIsAccessingLocation(false);
      return;
    }
    final location.LocationData data = await _location.getLocation();
    controller.updateUserLocation(data);
    controller.updateIsAccessingLocation(false);
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(data.latitude!, data.longitude!);

    String address =
        "${placeMarks[0].street}, ${placeMarks[0].subAdministrativeArea} ${placeMarks[0].administrativeArea}";

    controller.updateAddress(address);
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/add_location_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/location_page.dart';
import 'package:food_delivery_app/pages/map_page.dart';
import 'package:food_delivery_app/pages/saved_location_page.dart';
import 'package:food_delivery_app/pages/search_location_page.dart';

import 'package:food_delivery_app/pages/search_page.dart';
import 'package:food_delivery_app/pages/search_result_page.dart';
import 'package:food_delivery_app/pages/splash_page.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.locationPage,
      getPages: [
        GetPage(
            name: Routes.homePages,
            page: () => HomePage(),
            transition: Transition.leftToRight),
        GetPage(name: Routes.splashPages, page: () => SplashPage()),
        GetPage(name: Routes.searchPage, page: () => SearchPage()),
        GetPage(name: Routes.locationPage, page: () => LocationPage()),
        GetPage(name: Routes.searchResultPage, page: () => SearchResultPage()),
        GetPage(name: Routes.mapPage, page: () => MapPage()),
        GetPage(name: Routes.addLocation, page: () => AddLocationPage()),
        GetPage(name: Routes.searchLocation, page: () => SearchLocationPage()),
        GetPage(name: Routes.saveLocation, page: () => SaveLocationPage()),
      ],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        fontFamily: 'Sen',
        useMaterial3: true,
      ),
    );
  }
}

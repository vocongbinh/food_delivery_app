import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/splash_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My app'),
      ),
      body: Center(
        child: TextButton(
          child: Text('haha'),
          onPressed: () {},
        ),
      ),
    );
  }
}

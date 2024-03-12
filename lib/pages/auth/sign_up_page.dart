import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/models/auth_controller.dart';
import 'package:food_delivery_app/resources/components/reuseable_text.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../resources/components/custom_button.dart';
import '../../resources/components/custom_textfield.dart';
import '../../values/app_colors.dart';

class SignUpPage extends GetView<AuthController> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          color: Colors.black,
          child: Column(children: [
            SizedBox(
              height: 100,
            ),
            ReusableText(
                text: "Sign Up",
                style:
                    AppStyles.customeText(30, Colors.white, FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            ReusableText(
                text: "Please sign up to get started",
                style:
                    AppStyles.customeText(14, Colors.white, FontWeight.bold)),
            SizedBox(
              height: 50,
            ),
            Container(
                height: Get.height * 0.70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.h),
                        topRight: Radius.circular(30))),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: controller.signupFormKey,
                      child: ListView(
                        children: [
                          ReusableText(
                              text: "NAME",
                              style: AppStyles.customeText(
                                  14, AppColors.subTextColor, FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                              controller: email,
                              hintText: "John doe",
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email!.isEmpty || !email.contains("@")) {
                                  return "Please enter a valid email";
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          ReusableText(
                              text: "EMAIL",
                              style: AppStyles.customeText(
                                  14, AppColors.subTextColor, FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                              controller: email,
                              hintText: "example@gmail.com",
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email!.isEmpty || !email.contains("@")) {
                                  return "Please enter a valid email";
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          ReusableText(
                              text: "PASSWORD",
                              style: AppStyles.customeText(
                                  14, AppColors.subTextColor, FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: password,
                            hintText: "Password",
                            obscureText: controller.obscureText,
                            keyboardType: TextInputType.text,
                            validator: (password) {
                              if (password!.isEmpty || password.length < 7) {
                                return "Please enter a valid password";
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.obscureText =
                                    !controller.obscureText;
                              },
                              child: Icon(
                                controller.obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.subTextColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ReusableText(
                              text: "RE-TYPE PASSWORD",
                              style: AppStyles.customeText(
                                  14, AppColors.subTextColor, FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: password,
                            hintText: "Retype password",
                            obscureText: controller.obscureText,
                            keyboardType: TextInputType.text,
                            validator: (password) {
                              if (password!.isEmpty || password.length < 7) {
                                return "Please enter a valid password";
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.obscureText =
                                    !controller.obscureText;
                              },
                              child: Icon(
                                controller.obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.subTextColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            text: "SIGN UP",
                            onTap: () {
                              controller.sendRequest();
                            },
                          ),
                        ],
                      ),
                    ))),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/auth_controller.dart';
import 'package:food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/resources/components/custom_button.dart';
import 'package:food_delivery_app/resources/components/reuseable_text.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../resources/components/custom_textfield.dart';

class LoginPage extends GetView<AuthController> {
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
                text: "Log In",
                style:
                    AppStyles.customeText(30, Colors.white, FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            ReusableText(
                text: "Please sign in your existing account",
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
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: controller.loginFormKey,
                      child: ListView(
                        children: [
                          ReusableText(
                              text: "EMAIL",
                              style: AppStyles.customeText(
                                  14, AppColors.subTextColor, FontWeight.bold)),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                              controller: email,
                              hintText: "Email",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      side: BorderSide(
                                          color: AppColors.subTextColor,
                                          width: 0.5),
                                      value: controller.isRememberMe,
                                      onChanged: (val) => controller
                                          .isRememberMe = val ?? false),
                                  ReusableText(
                                      text: "Remember me",
                                      style: AppStyles.customeText(
                                          14,
                                          AppColors.subTextColor,
                                          FontWeight.normal)),
                                ],
                              ),
                              GestureDetector(
                                child: ReusableText(
                                    text: "Forgot Password",
                                    style: AppStyles.customeText(
                                        14,
                                        AppColors.primaryColor,
                                        FontWeight.bold)),
                                onTap: () {
                                  print("go to forgot password");
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            text: "Login",
                            onTap: () {
                              if (controller.validateAndSave()) {
                              } else {
                                Get.snackbar(
                                  "Sign Failed",
                                  "Please check your credentials",
                                  colorText: AppColors.whiteColor,
                                  backgroundColor: Colors.red,
                                  icon: const Icon(Icons.add_alert),
                                );
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableText(
                                  text: "Don't have an account? ",
                                  style: AppStyles.customeText(
                                      14,
                                      AppColors.subTextColor,
                                      FontWeight.normal)),
                              GestureDetector(
                                child: ReusableText(
                                    text: "SIGN UP",
                                    style: AppStyles.customeText(
                                        14,
                                        AppColors.primaryColor,
                                        FontWeight.bold)),
                                onTap: () {
                                  print("go to sign up");
                                  Get.to(() => SignUpPage());
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Row(
                          //   children: [],
                          // )
                        ],
                      ),
                    ))),
          ]),
        ),
      ),
    );
  }
}

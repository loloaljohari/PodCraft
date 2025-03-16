import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcraft/core/classes/Animation/AnimatedText.dart';
import 'package:podcraft/core/classes/Widgets/TextFeildwidget.dart';
import 'package:podcraft/core/static/themeColors.dart';
import 'package:podcraft/models/Loginmodel.dart';
import 'package:podcraft/pages/ForgetPassword.dart';
import 'package:podcraft/pages/HomeChat.dart';
import 'package:podcraft/pages/SingUp.dart';
import 'package:podcraft/pages/VerifyAccount.dart';

class ResetPasswordController extends GetxController {
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
}

class LogIn extends StatelessWidget {
  final ResetPasswordController controller = Get.put(ResetPasswordController());
  final Loginmodel loginmodel = Get.put(Loginmodel());
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                width: 108,
                height: 91,
                child: Image.asset('images/Group 6.png', fit: BoxFit.contain),
              )),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Log in to your account",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 90),
              Text("Email Address", style: TextStyle(color: gray)),
              const SizedBox(height: 10),
              TextFeildwidget(
                controller: email,
                hintText: "Enter your email address",
                icon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.email_outlined,
                    color: gray,
                    size: 32,
                    weight: 2,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text("Password", style: TextStyle(color: gray)),
              const SizedBox(height: 10),
              Obx(() => TextFeildwidget(
                    controller: password,
                    hintText: "Enter your password",
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: gray,
                          size: 32,
                        ),
                        onPressed: () {
                          controller.isPasswordHidden.value =
                              !controller.isPasswordHidden.value;
                        },
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(ForgetPassword());
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: gray),
                  ),
                ),
              ),
              Text(
                'We are very glad to have you back to ',
                style: TextStyle(
                  color: gray,
                  fontSize: 20,
                ),
              ),
              const Text(
                'ProdCraft',
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(47, 146, 166, 1)),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: blue),
                    width: double.infinity,
                    height: 64,
                    child: TextButton(
                      onPressed: () async {
                        bool isSuccess = await loginmodel.Login(
                            email: email.text, password: password.text);
                        if (isSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Success'),
                            backgroundColor: Colors.green,
                          ));
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      HomeChat(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return ScaleTransition(
                                  scale: Tween<double>(
                                          begin: 0.0,
                                          end:1.0) // بداية من صفر إلى الحجم الكامل
                                      .animate(CurvedAnimation(
                                    parent: animation,
                                    curve:
                                        Curves.easeInOut, // تخصيص منحنى الحركة
                                  )),
                                  alignment: Alignment
                                      .topLeft, // تحديد نقطة البداية (الزاوية العليا اليسرى)
                                  child: child,
                                );
                              },
                            ),
                            (route) => false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Error'),
                            backgroundColor: Colors.blueGrey[700],
                            duration: Duration(seconds: 7),
                          ));
                        }
                      },
                      child: loginmodel.isloading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: black,
                              ),
                            )
                          : Text("Login",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400)),
                    ),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: TextStyle(color: gray),
                    ),
                    AnimatedText(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

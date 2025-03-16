import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcraft/core/classes/Animation/AnimatedLogin.dart';
import 'package:podcraft/core/classes/Widgets/TextFeildwidget.dart';
import 'package:podcraft/core/static/themeColors.dart';
import 'package:podcraft/models/SignUpmodel.dart';
import 'package:podcraft/pages/LogIn.dart';
import 'package:podcraft/pages/VerifyAccount.dart';

class Singup extends StatelessWidget {
  Singup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller =
        Get.put(ResetPasswordController(), tag: "1");

    final ResetPasswordController controllerr =
        Get.put(ResetPasswordController(), tag: "2");
    SignUpmodel signUpmodel = Get.put(SignUpmodel());
    TextEditingController first_name = TextEditingController();
    TextEditingController last_name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController password_confirmation = TextEditingController();
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        title: const Text(''),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: 180,
            height: 91,
            child: Image.asset(
              "images/Group 6.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 69),
            child: SizedBox(
                width: 194,
                height: 39,
                child: Text(
                  "Create new account",
                  style: TextStyle(
                    color: blue,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ),
          Form(
              child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    width: 185,
                    height: 64,
                    child: TextFeildwidget(
                        icon: Text(''),
                        controller: first_name,
                        hintText: 'Enter first name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: 185,
                      height: 64,
                      child: TextFeildwidget(
                          icon: Text(''),
                          controller: last_name,
                          hintText: 'Enter last name'),
                    ),
                  ),
                ],
              ),
            ),
          )),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 5, top: 20),
            child: Text(
              'Email Address',
              style: TextStyle(color: white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
                width: 400,
                height: 64,
                child: TextFeildwidget(
                  controller: email,
                  hintText: "Enter your email address",
                  icon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.email_outlined,
                      color: gray,
                      size: 32,
                    ),
                  ),
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 5, top: 20),
            child: Text(
              'Password',
              style: TextStyle(color: white),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                width: 400,
                height: 64,
                child: Obx(() {
                  return TextFeildwidget(
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
                          )),
                      controller: password,
                      hintText: 'Enter your password');
                }),
              )),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 5, top: 20),
            child: Text(
              'Confirm Password',
              style: TextStyle(color: white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              width: 400,
              height: 64,
              child: Obx(() {
                return TextFeildwidget(
                    icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(
                            controllerr.isPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: gray,
                            size: 32,
                          ),
                          onPressed: () {
                            controllerr.isPasswordHidden.value =
                                !controllerr.isPasswordHidden.value;
                          },
                        )),
                    controller: password_confirmation,
                    hintText: 'Enter your password');
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: Text(
              "We are very excited to have you join ",
              style: TextStyle(
                  color: gray, fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text("ProdCraft",
                style: TextStyle(
                    color: blue, fontSize: 20, fontWeight: FontWeight.w500)),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: blue),
                width: 300,
                height: 70,
                child: signUpmodel.isloading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: black,
                        ),
                      )
                    : TextButton(
                        onPressed: () async {
                          bool isSuccess = await signUpmodel.registerUser(
                              firstName: first_name.text,
                              lastName: last_name.text,
                              email: email.text,
                              password: password.text,
                              confirmpassword: password_confirmation.text);
                          if (isSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Success'),
                              backgroundColor: Colors.green,
                            ));
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        VerifyAccount(Email: email.text,),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return ScaleTransition(
                                    scale: Tween<double>(
                                            begin: 0.0,
                                            end:
                                                1.0) // بداية من صفر إلى الحجم الكامل
                                        .animate(CurvedAnimation(
                                      parent: animation,
                                      curve: Curves
                                          .easeInOut, // تخصيص منحنى الحركة
                                    )),
                                    alignment: Alignment
                                        .topLeft, // تحديد نقطة البداية (الزاوية العليا اليسرى)
                                    child: child,
                                  );
                                },
                              )
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Error'),
                              backgroundColor: Colors.blueGrey[700],
                              duration: Duration(seconds: 7),
                            ));
                          }
                        },
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                      ),
              ),
            );
          }),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Text("Already have an account?",
                    style: TextStyle(
                        color: gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
              AnimatedLogin()
            ],
          )
        ],
      ),
    );
  }
}

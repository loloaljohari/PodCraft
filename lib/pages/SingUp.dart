import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcraft/core/classes/Animation/AnimatedLogin.dart';
import 'package:podcraft/core/classes/Widgets/TextFeildwidget.dart';
import 'package:podcraft/core/static/themeColors.dart';
import 'package:podcraft/pages/LogIn.dart';

class Singup extends StatelessWidget {
  Singup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller =
        Get.put(ResetPasswordController(),tag: "1");

    final ResetPasswordController controllerr =
        Get.put(ResetPasswordController(),tag: "2");
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    TextEditingController controller5 = TextEditingController();
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
                        controller: controller1,
                        hintText: 'Enter first name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: 185,
                      height: 64,
                      child: TextFeildwidget(
                          icon: Text(''),
                          controller: controller2,
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
                  controller: controller3,
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
                      controller: controller4,
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
                    controller: controller5,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: blue),
              width: 300,
              height: 70,
              child: TextButton(
                onPressed: () {},
                child: Text("Sign Up",
                    style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
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

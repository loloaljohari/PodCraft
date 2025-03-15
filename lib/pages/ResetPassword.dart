import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcraft/core/static/themeColors.dart';
import 'package:podcraft/pages/LogIn.dart';
    
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  
  final ResetPasswordController controller = Get.put(ResetPasswordController());
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
             SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      width: 45,
                      height: 45,
                      child: Image.asset('images/Group 9.png')),
                ),
                Container(
                    width: 35,
                    height: 40,
                    child: Image.asset('images/Group 6.png')),
              ],
            ),
            const SizedBox(height: 20),

            Center(
              child: Text(
                "Reset Password",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            Text("New Password", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 10),
            Obx(() => TextField(
                  controller: passwordController,
                  obscureText: controller.isPasswordHidden.value,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: Colors.white54),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value;
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                )),

            const SizedBox(height: 20),


            Text("Confirm Password", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 10),
            Obx(() => TextField(
                  controller: confirmPasswordController,
                  obscureText: controller.isConfirmPasswordHidden.value,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: Colors.white54),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.isConfirmPasswordHidden.value =
                            !controller.isConfirmPasswordHidden.value;
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                )),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                Get.off(LogIn());
                },
                child: Text("Continue",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ),

            const SizedBox(height: 180),
   Padding(
              padding: EdgeInsets.only(left:120),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                        color: gray1, borderRadius: BorderRadius.circular(5)),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                        color: gray1, borderRadius: BorderRadius.circular(5)),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                        color: blue, borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
            )
,
            // Center(
            //   child: DotsIndicator(
            //     dotsCount: 3,
            //     position: 2,
            //     decorator: DotsDecorator(
            //       color: Colors.grey,
            //       activeColor: Colors.cyan,
            //       size: Size.square(10),
            //       activeSize: Size(20, 10),
            //       activeShape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(5)),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
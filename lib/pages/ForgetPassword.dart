import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcraft/core/static/themeColors.dart';
import 'package:podcraft/pages/OTP.dart';
import 'package:podcraft/pages/ResetPassword.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            const SizedBox(height: 30),
            Center(
              child: Text(
                "Forget Password",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 50),
            Text(
              "You have requested password recovery for your account in ProdCaft. Don't worry, we are here to help you",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                hintText: "Enter your email address",
                hintStyle: TextStyle(color: Colors.white54),
                suffixIcon: Icon(Icons.email_outlined, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white),
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
            ),
            const SizedBox(height: 50),
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
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Otp(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin =
                            Offset(1.0, 0.0); // البداية خارج الشاشة (يمين)
                        var end = Offset.zero; // النهاية (في الموقع الطبيعي)
                        var curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Text("Continue",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Please follow the following steps to reset your password",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 160),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 120),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(5)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                          color: gray1, borderRadius: BorderRadius.circular(5)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                          color: gray1, borderRadius: BorderRadius.circular(5)),
                    )
                  ],
                ),
              ),
            ),
            // DotsIndicator(
            //   dotsCount: 3,
            //   position: 0,
            //   decorator: DotsDecorator(
            //     color: Colors.grey,
            //     activeColor: Colors.cyan,
            //     size: Size.square(10),
            //     activeSize: Size(20, 10),
            //     activeShape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

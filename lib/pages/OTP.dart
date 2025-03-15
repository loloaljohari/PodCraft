import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:podcraft/core/static/themeColors.dart';
import 'package:podcraft/pages/ResetPassword.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
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
                "Enter OTP",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80),
              child: Text(
                "Enter the OTP code we just sent you on your registered Email",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: OtpTextField(
                fieldHeight: 54,
                fieldWidth: 56,
                numberOfFields: 5,
                cursorColor: gray1,
                borderWidth: 0,
                borderRadius: BorderRadius.circular(13),
                filled: true,
                fillColor: blue,
                showFieldAsBox: true,
                autoFocus: true,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ResetPassword(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't Receive Code? ",
                      style: TextStyle(
                          color: gray,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
              
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Text(" Resend Code",
                        style: TextStyle(
                            color: blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Resend code in ",style: TextStyle(color: gray),),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: TimerCountdown(
                    format: CountDownTimerFormat.minutesSeconds,
                    endTime: DateTime.now().add(Duration(minutes: 1)),
                    colonsTextStyle: TextStyle(color: blue),
                    timeTextStyle: TextStyle(color: blue),
                  ),
                )
              ],
              
            ),
              const SizedBox(height: 115),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 120),
                child: Align(
                  child: Row(
                    children: [
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

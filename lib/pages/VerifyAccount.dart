import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:podcraft/core/static/themeColors.dart';
import 'package:podcraft/models/verifymodel.dart';
import 'package:podcraft/pages/HomeChat.dart';
import 'package:podcraft/pages/LogIn.dart';

class VerifyAccount extends StatefulWidget {
  final String Email;
  VerifyAccount({Key? key, required this.Email}) : super(key: key);

  @override
  _VerifyAccountState createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  String? code;
  Verifymodel verifymodel = Get.put(Verifymodel());
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
                "Verify Account",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Text(
                "Code has been send to johndoe@gmail.com. Enter the code to verify your account.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: OtpTextField(
                onSubmit: (value) {
                  print(value);
                  code = value;
                },
                fieldHeight: 44,
                fieldWidth: 46,
                numberOfFields: 6,
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
              height: 60,
            ),
            Obx(() {
              return SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    print(code);
                    print(widget.Email);
                    bool isSuccess = await verifymodel.verify(
                        code: code, email: widget.Email);
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
                                  LogIn(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return ScaleTransition(
                              scale: Tween<double>(
                                      begin: 0.0,
                                      end: 1.0) // بداية من صفر إلى الحجم الكامل
                                  .animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOut, // تخصيص منحنى الحركة
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
                  child: verifymodel.isloading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: black,
                          ),
                        )
                      : Text("Verify Account",
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              );
            }),
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
                Text(
                  "Resend code in ",
                  style: TextStyle(color: gray),
                ),
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
          ],
        ),
      ),
    );
  }
}

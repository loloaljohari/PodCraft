import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.asset('assets/Vector.png'),
                ),
                Image.asset('images/Group 5.png'),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "Forget Password",
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
                onPressed: () {},
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
            const SizedBox(height: 120),

           
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
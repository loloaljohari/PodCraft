// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcraft/core/classes/Animation/AnimatedButton.dart';
import 'package:podcraft/pages/LogIn.dart';
import 'package:podcraft/pages/SingUp.dart';

class OnBoarding extends StatefulWidget {
  // ignore: use_super_parameters
  const OnBoarding({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 13, 13, 1),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 600,
            child: Image.asset(
              "images/Ellipse 5.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: SizedBox(
                width: 194,
                height: 39,
                child: Text(
                  "Welcome to",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: SizedBox(
                width: 194,
                height: 39,
                child: Text(
                  "PodCraft",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 140, top: 6),
            child: SizedBox(
                width: 233,
                height: 66,
                child: Text(
                  "Create professional scripts for podcast episodes based on a topic",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ),
          Align(alignment: Alignment.centerRight, child: AnimatedButton()),
        ],
      ),
    );
  }
}

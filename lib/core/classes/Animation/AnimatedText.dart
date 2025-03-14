import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcraft/pages/LogIn.dart';
import 'package:podcraft/pages/SingUp.dart';

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedText> {
  bool _isPressed = false;

  void _toggleAnimation() {
    setState(() {
      _isPressed = !_isPressed;
      if (_isPressed) {
        Future.delayed(Duration(milliseconds: 300), () {
          _navigateToNextPage(context);
        });
      }
    });
  }

  void _navigateToNextPage(BuildContext context) {
    Get.offAll(Singup());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _toggleAnimation,
        child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut,
            style: _isPressed
                ? TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(47, 146, 166, 1),
                  )
                : TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(47, 146, 166, 1),
                  ),
            child: const Text(
              'Create Account',
            )));
  }
}

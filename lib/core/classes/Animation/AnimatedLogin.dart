import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcraft/pages/LogIn.dart';

class AnimatedLogin extends StatefulWidget {
  const AnimatedLogin({Key? key}) : super(key: key);

  @override
  _AnimatedLoginState createState() => _AnimatedLoginState();
}

class _AnimatedLoginState extends State<AnimatedLogin> {
  bool _isPressed = false;

  void _toggleAnimation() {
    setState(() {
      _isPressed = !_isPressed;
      if (_isPressed) {
        Future.delayed(Duration(milliseconds: 500), () {
          _navigateToNextPage(context);
        });
      }
    });
  }

  void _navigateToNextPage(BuildContext context) {
    Get.offAll(LogIn());
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
              '  Login',
            )));
  }
}

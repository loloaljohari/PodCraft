
import 'package:flutter/material.dart';
import 'package:podcraft/pages/SingUp.dart';

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  void _toggleAnimation() {
    setState(() {
      _isPressed = !_isPressed;
      if (_isPressed) {
        Future.delayed(Duration(milliseconds: 600), () {
          _navigateToNextPage(context);
        });
      }
    });
  }

  void _navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Singup()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleAnimation,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
          width: _isPressed ? 230 : 198,
          height: _isPressed ? 82 : 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              bottomRight: Radius.circular(40),
            ),
            color: Color.fromRGBO(53, 164, 186, 1),
          ),
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color.fromRGBO(13, 13, 13, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(13, 13, 13, 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
     
    );
  }
}
import 'package:flutter/material.dart';
import 'package:podcraft/core/static/themeColors.dart';

// ignore: must_be_immutable
class TextFeildwidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget icon;
  TextFeildwidget(
      {super.key, required this.controller, required this.hintText, required this.icon});
  @override
  Widget build(BuildContext context) {
    return  TextField(
                controller: controller,
                style: TextStyle(color: gray),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  hintText: hintText,
                  hintStyle: TextStyle(color: gray,fontSize: 14),
                  suffixIcon: icon,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: gray),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: gray),
                   
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: blue),
                  ),
                ),
              );
  }
}

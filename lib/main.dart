import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:podcraft/pages/OnBoarding.dart';

void main() {
  runApp(const PodCraft());
}

class PodCraft extends StatefulWidget {
  const PodCraft({super.key});

  @override
  State<PodCraft> createState() => _PodCraftState();
}

class _PodCraftState extends State<PodCraft> {
  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PodCraft",
      home: OnBoarding(),
    );
  }
}

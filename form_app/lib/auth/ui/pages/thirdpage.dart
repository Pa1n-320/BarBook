import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
class ThirdPage extends  StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Center(
          child:
          Lottie.network(
              'https://assets4.lottiefiles.com/packages/lf20_dFqqfQW5yd.json')
      ),
    );
  }
}
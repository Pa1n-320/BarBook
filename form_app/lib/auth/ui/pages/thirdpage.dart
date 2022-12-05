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
      child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.network(
              'https://assets4.lottiefiles.com/packages/lf20_dFqqfQW5yd.json',
              ),
              SizedBox(
                height: 20,
              ),
              Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_D3Jkbk4bHd.json',
              ),
              SizedBox(
                height: 20,
              ),
              Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_2ixzdfvy.json',
              ),
              SizedBox(
                height: 20,
              ),



            ]
          ),
      ),
    );
  }
}
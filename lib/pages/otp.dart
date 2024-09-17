import 'package:flutter/material.dart';
import 'dart:math';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  int otp = 0;

  void generateOtp() {
    Random random = Random();
    int min = 100000;
    int max = 1000000;
    setState(() {
      otp = min + random.nextInt((max + 1) - min);
    });
    print('$otp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Attendance"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          ElevatedButton(
              onPressed: () {
                generateOtp();
              },
              child: Text("Generate OTP")),
          SizedBox(
            height: 10,
          ),
          Text("OTP is $otp")
        ]),
      ),
    );
  }
}

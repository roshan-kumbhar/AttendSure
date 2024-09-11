import 'package:flutter/material.dart';
import 'dart:math';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  late int otp;
  late DateTime startTime;
  final TextEditingController otpController = TextEditingController(); // Controller for the OTP TextField
  String message = ''; // Message to display OTP status

  @override
  void initState() {
    super.initState();
    generateOTP();
  }

  // Function to generate OTP
  void generateOTP() {
    otp = Random().nextInt(900000) + 100000; // Generates a 6-digit OTP
    startTime = DateTime.now();
    message = 'Generated OTP: $otp (For Testing)'; // For testing, show OTP in the UI
    setState(() {}); // Rebuild the UI with new OTP
    print('Generated OTP: $otp'); // Also print the OTP to the console for debugging
  }

  // Function to verify OTP
  void verifyOTP() {
    String userOTP = otpController.text;
    if (DateTime.now().difference(startTime).inSeconds > 60) {
      setState(() {
        message = 'OTP expired';
      });
      generateOTP(); // Generate a new OTP if expired
    } else if (userOTP.isNotEmpty && int.parse(userOTP) == otp) {
      setState(() {
        message = 'Attendance Marked Successfully';
      });
    } else {
      setState(() {
        message = 'Wrong OTP';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter OTP:'),
            TextField(
              controller: otpController, // Link the controller to the text field
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter 6-digit OTP',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyOTP, // Trigger verification when button is pressed
              child: const Text('Submit OTP'),
            ),
            const SizedBox(height: 20),
            Text(
              message, // Display OTP status messages
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpController.dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }
}
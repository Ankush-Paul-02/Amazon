import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/auth_screen/screens/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AmazonApp());
}

class AmazonApp extends StatelessWidget {
  const AmazonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon',
      theme: theme,
      home: const OTPScreen(mobileNumber: '+911010101010'),
      // home: const AuthScreen(),
    );
  }
}

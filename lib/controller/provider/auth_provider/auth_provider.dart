import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String phoneNumber = '';
  String verificationId = '';
  String otp = '';

  //! Update phone number
  updatePhoneNumber({required String number}) {
    phoneNumber = number;
    notifyListeners();
  }

  //! Update verification id
  updateVerificationId({required String id}) {
    verificationId = id;
    notifyListeners();
  }
}

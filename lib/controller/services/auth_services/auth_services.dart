import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/view/auth_screen/screens/otp_screen.dart';
import 'package:amazon/view/auth_screen/screens/signin_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthServices {
  //! Verify user
  static bool checkAuthentication() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  //! Receive OTP
  static receiveOTP(
      {required BuildContext context, required String mobileNumber}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNumber,
        verificationCompleted: (phoneAuthCredential) {
          VxToast.show(context, msg: phoneAuthCredential.toString());
        },
        verificationFailed: (error) {
          VxToast.show(context, msg: error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          context.read<AuthProvider>().updateVerificationId(id: verificationId);
          Navigator.push(
            context,
            PageTransition(
              child: OTPScreen(mobileNumber: mobileNumber),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  //! Verify OTP
  static verifyOTP({required BuildContext context, required String otp}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<AuthProvider>().verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        PageTransition(
          child: const SignInLogic(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}

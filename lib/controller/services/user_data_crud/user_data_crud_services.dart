import 'package:amazon/constants/constants.dart';
import 'package:amazon/model/user_model.dart';
import 'package:amazon/view/auth_screen/screens/signin_logic.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:velocity_x/velocity_x.dart';

class UserDataCRUD {
  //! Add new user
  static addNewUser({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.phoneNumber)
          .set(userModel.toMap())
          .whenComplete(() {
        VxToast.show(context, msg: 'Data Added');
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const SignInLogic(),
                type: PageTransitionType.rightToLeft),
            (route) => false);
      });
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  //! Check user is present or not
  static Future<bool> checkUser({required BuildContext context}) async {
    bool isUserPresent = false;
    try {
      await firestore
          .collection('users')
          .where('mobileNumber', isEqualTo: auth.currentUser!.phoneNumber)
          .get()
          .then(
            (value) =>
                value.size > 0 ? isUserPresent = true : isUserPresent = false,
          );
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return isUserPresent;
  }
}

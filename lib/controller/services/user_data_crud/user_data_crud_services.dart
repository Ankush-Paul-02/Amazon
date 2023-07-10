// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:amazon/constants/constants.dart';
import 'package:amazon/model/address_model.dart';
import 'package:amazon/model/user_model.dart';
import 'package:amazon/view/auth_screen/screens/signin_logic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  static Future<bool> checkUser({
    required BuildContext context,
  }) async {
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

  //! Add user address
  static Future addUserAddress({
    required BuildContext context,
    required AddressModel addressModel,
    required String docId,
  }) async {
    try {
      await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .doc(docId)
          .set(addressModel.toMap())
          .whenComplete(() {
        VxToast.show(context, msg: 'Address added successfully.');
        Navigator.pop(context);
      });
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  //! Check user address
  static Future<bool> checkUserAddress({
    required BuildContext context,
  }) async {
    bool isAddressPresent = false;
    try {
      await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .get()
          .then(
            (value) => value.size > 0
                ? isAddressPresent = true
                : isAddressPresent = false,
          );
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return isAddressPresent;
  }

  //! Get all address
  static Future<List<AddressModel>> getAllAddress(
      {required BuildContext context}) async {
    List<AddressModel> allAddress = [];
    AddressModel defaultAddress = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .get();

      snapshot.docs.forEach((element) {
        allAddress.add(AddressModel.fromMap(element.data()));
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if (currentAddress.isDefault == true) {
          defaultAddress = currentAddress;
        }
      });
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return allAddress;
  }

  //! Get current address
  static Future getCurrentAddress({required BuildContext context}) async {
    AddressModel defaultAddress = AddressModel();
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Address')
          .doc(auth.currentUser!.phoneNumber)
          .collection('address')
          .get();

      snapshot.docs.forEach((element) {
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if (currentAddress.isDefault == true) {
          defaultAddress = currentAddress;
        }
      });
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return defaultAddress;
  }
}

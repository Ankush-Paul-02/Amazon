import 'package:amazon/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../utils/colors.dart';
import '../widgets/name_field.dart';
import '../widgets/phone_number_field.dart';
import '../widgets/proceed_button.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneController.text = auth.currentUser?.phoneNumber ?? '';
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(1.w, 9.h),
          child: Container(
            height: 9.h,
            width: 81.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/amazon_black_logo.png',
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Name field
            NameField(nameController: nameController),
            2.h.heightBox,
            //! phone number field
            PhoneNumberField(phoneController: phoneController),
            const Spacer(),
            //! Proceed button
            ProceedButton(
                nameController: nameController,
                phoneController: phoneController),
          ],
        )
            .box
            .size(100.w, 100.h)
            .padding(EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h))
            .make(),
      ),
    );
  }
}

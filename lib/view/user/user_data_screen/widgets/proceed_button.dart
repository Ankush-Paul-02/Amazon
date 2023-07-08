import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../controller/services/user_data_crud/user_data_crud_services.dart';
import '../../../../model/user_model.dart';
import '../../../../utils/colors.dart';

class ProceedButton extends StatelessWidget {
  const ProceedButton({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: () async {
        UserModel userModel = UserModel(
          name: nameController.text.trim(),
          mobileNumber: phoneController.text.trim(),
          userType: 'user',
        );
        await UserDataCRUD.addNewUser(userModel: userModel, context: context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: amber,
        minimumSize: Size(100.w, 6.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: 'Proceed'
          .text
          .textStyle(textTheme.bodyMedium)
          .black
          .make()
          .centered(),
    );
  }
}

import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/services/user_data_crud/user_data_crud_services.dart';
import 'package:amazon/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../utils/colors.dart';
import '../widgets/address_screen_app_bar.dart';
import '../widgets/custom_text_form_field.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(1.w, 9.h),
          child: const AddressScreenAppBar(),
        ),
        body: Column(
          children: [
            CustomTextFormField(
              controller: nameController,
              hintText: 'Enter your name',
            ),
            1.h.heightBox,
            CustomTextFormField(
              controller: mobileController,
              hintText: 'Enter your phone number',
            ),
            1.h.heightBox,
            CustomTextFormField(
              controller: houseController,
              hintText: 'Enter house name',
            ),
            1.h.heightBox,
            CustomTextFormField(
              controller: areaController,
              hintText: 'Enter your area',
            ),
            1.h.heightBox,
            CustomTextFormField(
              controller: landmarkController,
              hintText: 'Enter your landmark',
            ),
            1.h.heightBox,
            CustomTextFormField(
              controller: pinCodeController,
              hintText: 'Enter your pincode',
            ),
            1.h.heightBox,
            CustomTextFormField(
              controller: townController,
              hintText: 'Enter your town',
            ),
            1.h.heightBox,
            CustomTextFormField(
              controller: stateController,
              hintText: 'Enter your state',
            ),
            4.h.heightBox,
            ElevatedButton(
              onPressed: () {
                Uuid uuid = const Uuid();
                String docId = uuid.v1();
                AddressModel addressModel = AddressModel(
                  name: nameController.text.trim(),
                  mobileNumber: mobileController.text.trim(),
                  authenticatedMobileNumber: auth.currentUser!.phoneNumber,
                  houseNumber: houseController.text.trim(),
                  area: areaController.text.trim(),
                  landMark: landmarkController.text.trim(),
                  pinCode: pinCodeController.text.trim(),
                  town: townController.text.trim(),
                  state: stateController.text.trim(),
                  docId: docId,
                  isDefault: true,
                );
                UserDataCRUD.addUserAddress(
                    context: context, addressModel: addressModel, docId: docId);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: amber,
                minimumSize: Size(100.w, 6.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: 'Add Address'
                  .text
                  .textStyle(textTheme.bodyMedium)
                  .black
                  .make()
                  .centered(),
            ),
          ],
        )
            .box
            .width(100.w)
            .padding(EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h))
            .make()
            .scrollVertical(),
      ),
    );
  }
}

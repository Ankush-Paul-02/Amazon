import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';
import '../widgets/laws.dart';
import '../widgets/sign_in_continue.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.mobileNumber});

  final String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Image(
          image: const AssetImage('assets/images/amazon_logo.png'),
          height: height * 0.04,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Authentication Required'
                  .text
                  .textStyle(textTheme.displaySmall)
                  .bold
                  .make(),
              (height * 0.01).heightBox,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.mobileNumber,
                      style: textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Change',
                      style: textTheme.bodySmall,
                    )
                  ],
                ),
              ),
              (height * 0.02).heightBox,
              'We have sent a One Time Password (OTP) to the mobile number above. Please enter it to complete verification.'
                  .text
                  .textStyle(textTheme.bodySmall)
                  .neutral900
                  .make(),
              (height * 0.02).heightBox,
              //! OTP field
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                controller: otpController,
                style: textTheme.bodySmall,
                cursorColor: black,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Enter OTP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: secondaryColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey),
                  ),
                ),
              ).box.size(width, height * 0.06).make(),
              (height * 0.01).heightBox,
              //! Continue button
              SignInContinueButton(
                  text: 'Continue',
                  onTap: () => AuthServices.verifyOTP(
                      context: context, otp: otpController.text.trim()),
                  width: width,
                  height: height,
                  textTheme: textTheme),
              (height * 0.01).heightBox,
              //! Resend OTP
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: 'Resend OTP'.text.size(16).color(blue).make(),
                ),
              ),
              (height * 0.02).heightBox,
              //! Terms and conditions
              const Laws(),
            ],
          )
              .box
              .size(width, height)
              .make()
              .pSymmetric(h: width * 0.03, v: height * 0.02),
        ),
      ),
    );
  }
}

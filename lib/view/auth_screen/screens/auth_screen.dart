import 'package:amazon/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/create_account.dart';
import '../widgets/laws.dart';
import '../widgets/sign_in.dart';
import '../widgets/sign_in_continue.dart';
import '../widgets/terms_conditions.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  String currentCountryCode = "+91";
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      //! App bar
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
              'Welcome'.text.size(22).semiBold.make(),
              (height * 0.02).heightBox,

              //! Main box
              Builder(builder: (context) {
                if (inLogin) {
                  return Login(height, width, textTheme, context);
                }
                return Register(height, width, textTheme, context);
              }),

              //! lower body
              (height * 0.05).heightBox,
              const Laws(),
            ],
          ).box.make().pSymmetric(h: width * 0.03, v: height * 0.01),
        ),
      ),
    );
  }

  Container Register(
      double height, double width, TextTheme textTheme, BuildContext context) {
    return Container(
      child: Column(
        children: [
          //! Create Account
          CreateAccount(
                  height: height,
                  inLogin: inLogin,
                  width: width,
                  textTheme: textTheme)
              .box
              .white
              .padding(EdgeInsets.symmetric(horizontal: width * 0.03))
              .size(width, height * 0.06)
              .make()
              .onTap(() {
            setState(() {
              inLogin = false;
            });
          }),
          (height * 0.01).heightBox,
          //! Name field
          TextFormField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            controller: nameController,
            style: textTheme.bodySmall,
            cursorColor: black,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              hintText: 'First and Last Name',
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
          ).box.size(width * 0.88, height * 0.06).make(),
          (height * 0.01).heightBox,
          //! Phone number section and country code
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! Country code
              currentCountryCode.text
                  .size(16)
                  .semiBold
                  .make()
                  .onTap(() {
                    showCountryPicker(
                        context: context,
                        onSelect: (value) {
                          setState(() {
                            currentCountryCode = "+${value.phoneCode}";
                          });
                        });
                  })
                  .box
                  .color(greyShade2)
                  .size(width * 0.2, height * 0.06)
                  .alignCenter
                  .border(color: grey)
                  .customRounded(BorderRadius.circular(5))
                  .make(),
              //! Phone number
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                controller: mobileController,
                style: textTheme.bodySmall,
                cursorColor: black,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Mobile number',
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
              ).box.size(width * 0.64, height * 0.06).make()
            ],
          ).box.make().pSymmetric(h: width * 0.03, v: height * 0.01),
          (height * 0.01).heightBox,
          //! Text
          'By enrolling your mobile phone number, you concent to receive automated security notifications via text message from Amazon.\nMessage and data rate may apply.'
              .text
              .textStyle(textTheme.labelMedium)
              .make()
              .pSymmetric(h: width * 0.03),
          //! Continue button
          SignInContinueButton(
                  text: 'Verify mobile number',
                  onTap: () {},
                  width: width,
                  height: height,
                  textTheme: textTheme)
              .pSymmetric(h: width * 0.03),
          (height * 0.02).heightBox,

          //! Sign in
          SignIn(
                  height: height,
                  inLogin: inLogin,
                  width: width,
                  textTheme: textTheme)
              .box
              .withDecoration(BoxDecoration(
                  color: greyShade1,
                  border: Border(top: BorderSide(color: greyShade3))))
              .padding(EdgeInsets.symmetric(horizontal: width * 0.03))
              .size(width, height * 0.06)
              .make()
              .onTap(() {
            setState(() {
              inLogin = true;
            });
          }),
        ],
      ).box.width(width).border(color: greyShade3).make(),
    );
  }

  Container Login(
      double height, double width, TextTheme textTheme, BuildContext context) {
    return Container(
      child: Column(
        children: [
          //! Create Account
          CreateAccount(
                  height: height,
                  inLogin: inLogin,
                  width: width,
                  textTheme: textTheme)
              .box
              .withDecoration(BoxDecoration(
                  color: greyShade1,
                  border: Border(bottom: BorderSide(color: greyShade3))))
              .padding(EdgeInsets.symmetric(horizontal: width * 0.03))
              .size(width, height * 0.06)
              .make()
              .onTap(() {
            setState(() {
              inLogin = false;
            });
          }),

          //! Sign in
          SignIn(
                  height: height,
                  inLogin: inLogin,
                  width: width,
                  textTheme: textTheme)
              .box
              .color(white)
              .padding(EdgeInsets.symmetric(horizontal: width * 0.03))
              .size(width, height * 0.06)
              .make()
              .onTap(() {
            setState(() {
              inLogin = true;
            });
          }),

          //! Phone number section and country code
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! Country code
              currentCountryCode.text
                  .size(16)
                  .semiBold
                  .make()
                  .onTap(() {
                    showCountryPicker(
                        context: context,
                        onSelect: (value) {
                          setState(() {
                            currentCountryCode = "+${value.phoneCode}";
                          });
                        });
                  })
                  .box
                  .color(greyShade2)
                  .size(width * 0.2, height * 0.06)
                  .alignCenter
                  .border(color: grey)
                  .customRounded(BorderRadius.circular(5))
                  .make(),
              //! Phone number
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                controller: mobileController,
                style: textTheme.bodySmall,
                cursorColor: black,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Mobile number',
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
              ).box.size(width * 0.64, height * 0.06).make()
            ],
          ).box.make().pSymmetric(h: width * 0.03, v: height * 0.01),
          (height * 0.02).heightBox,

          //! Continue button
          SignInContinueButton(
                  text: 'Continue',
                  onTap: () {},
                  width: width,
                  height: height,
                  textTheme: textTheme)
              .pSymmetric(h: width * 0.03),
          (height * 0.02).heightBox,

          //! Terms and conditions
          TermsAndConditions(textTheme: textTheme),
          (height * 0.02).heightBox,
        ],
      ).box.width(width).border(color: greyShade3).make(),
    );
  }
}

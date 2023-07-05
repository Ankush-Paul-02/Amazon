import 'package:amazon/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widgets/create_account.dart';
import 'widgets/laws.dart';
import 'widgets/sign_in.dart';
import 'widgets/sign_in_continue.dart';
import 'widgets/terms_conditions.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  String currentCountryCode = "+91";
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Welcome'.text.size(22).semiBold.make(),
            (height * 0.02).heightBox,

            //! Main box
            Column(
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
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
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
                    width: width, height: height, textTheme: textTheme),
                (height * 0.02).heightBox,

                //! Terms and conditions
                TermsAndConditions(textTheme: textTheme),
                (height * 0.02).heightBox,
              ],
            ).box.width(width).border(color: greyShade3).make(),

            //! lower body
            (height * 0.05).heightBox,
            Laws(width: width, height: height),
          ],
        ).box.make().pSymmetric(h: width * 0.03, v: height * 0.01),
      ),
    );
  }
}

import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:amazon/controller/services/user_data_crud/user_data_crud_services.dart';
import 'package:amazon/view/auth_screen/screens/auth_screen.dart';
import 'package:amazon/view/user/user_data_screen/screens/user_data_input_screen.dart';
import 'package:amazon/view/user/user_persistent_nav_bar/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  //! Check user
  checkUser() async {
    bool? isUserAlreadyThere = await UserDataCRUD.checkUser(context: context);

    if (isUserAlreadyThere == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        PageTransition(
          child: const UserBottomNavBar(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        PageTransition(
          child: const UserDataInputScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    }
  }

  //! Check weather the user is authenticated or not
  checkAuthentication() {
    bool isUserAuthenticated = AuthServices.checkAuthentication();
    isUserAuthenticated
        ? checkUser()
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const AuthScreen(),
                type: PageTransitionType.rightToLeft),
            (route) => false,
          );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Image(
        image: AssetImage('assets/images/amazon_splash_screen.png'),
        fit: BoxFit.fill,
      ).centered(),
    );
  }
}

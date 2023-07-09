import 'package:amazon/controller/provider/address_provider.dart';
import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/auth_screen/screens/signin_logic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AmazonApp());
}

class AmazonApp extends StatelessWidget {
  const AmazonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<AddressProvider>(
          create: (context) => AddressProvider(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Amazon',
          theme: theme,
          home: const SignInLogic(),
        ),
      ),
    );
  }
}

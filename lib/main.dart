import 'dart:developer';

import 'package:firbase_app_test/customer/providers/customer_provider.dart';
import 'package:firbase_app_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import 'admin/providers/admin_provider.dart';
import 'admin/views/screens/display_categories.dart';
import 'admin/views/screens/product_details_screen.dart';
import 'app_router/app_router.dart';
import 'auth/providers/auth_provider.dart';
import 'auth/screens/splach_screen.dart';
import 'customer/views/confirm_order_screen.dart';
import 'customer/views/customer_home_screen.dart';
import 'data_repositories/auth_helper.dart';
import 'map/custom_map.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) {
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider<AdminProvider>(
          create: (context) {
            return AdminProvider();
          },
        ),
        ChangeNotifierProvider<CustomerProvider>(
          create: (context) {
            return CustomerProvider();
          },
        ),

      ],
      child: AppInit()
    );
  }
}


class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.appRouter.navigatorKey,
      title: 'E-commerce App',
      theme: Provider.of<AdminProvider>(context).isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),


      home:SplashScreen(),//CustomerHomeScreen(),//
    );
  }
}
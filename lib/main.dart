import 'dart:developer';

import 'package:firbase_app_test/customer/providers/customer_provider.dart';
import 'package:firbase_app_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import 'admin/providers/admin_provider.dart';
import 'admin/views/screens/display_categories.dart';
import 'app_router/app_router.dart';
import 'auth/providers/auth_provider.dart';
import 'auth/screens/splach_screen.dart';
import 'customer/views/product_details_screen.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRouter.appRouter.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //primaryColor: Colors.orangeAccent,
          primarySwatch: Colors.orange,
        ),
        home:SplashScreen(),//CustomerHomeScreen(),//
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TextEditingController> controllers = [TextEditingController()];
  TextEditingController emailCOntroller = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Required field";
                } else if (!(isEmail(v))) {
                  return "Incorrect email syntax";
                }
              },
              controller: emailCOntroller,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Required field";
                } else if (v.length <= 6) {
                  return 'Error, the password must be larger than 6 letters';
                }
              },
              controller: passwordCOntroller,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  bool isValid = formKey.currentState!.validate();
                  if (isValid) {
                    AuthHelper.authHelper
                        .signUp(emailCOntroller.text, passwordCOntroller.text);
                  }
                },
                child: Text('Add New Auther')),
          ],
        ),
      ),
    );
  }
}

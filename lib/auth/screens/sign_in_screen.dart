import 'package:firbase_app_test/app_router/app_router.dart';
import 'package:firbase_app_test/auth/components/custom_textfield.dart';
import 'package:firbase_app_test/auth/providers/auth_provider.dart';
import 'package:firbase_app_test/auth/screens/account_screen.dart';
import 'package:firbase_app_test/auth/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_repositories/constant.dart';
import '../../utils.dart';
import '../widgets/custom_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Consumer<AuthProvider>(builder: (context, provider, x) {
          return Form(
              key: provider.signInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text
                        ( 'Sign In',
                        style: SafeGoogleFont ('Muli',
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff757575),),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  Text(
                    "Welcome Back",
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont ('Muli',
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(style: SafeGoogleFont ('Muli',fontWeight: FontWeight.w400,
                  ),
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height:150),
                  CustomTextField(
                    svgIcon: 'assets/icons/Mail.svg',
                    validation: provider.emailValidation,
                    label: 'Email',
                    controller: provider.loginEmailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    svgIcon: "assets/icons/Lock.svg",
                    isPassword: true,
                    validation: provider.passwordValidation,
                    label: 'Password',
                    controller: provider.passwordLoginController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded
                    (child:
                    CustomButton
                    (
                    text:'Sign In',
                    press:() {
                      provider.signIn();
                    },
                  ),
                  ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Don’t have an account? ",
                    style:
                    SafeGoogleFont (
                        'Muli',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                         ),
                    GestureDetector(
                       onTap: () =>  AppRouter.appRouter.goToWidgetAndReplace(SignUpScreen()),
                       child: Text(
                            "Sign Up",
                            style:SafeGoogleFont ('Muli',fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: PrimaryColor),
                    ),
                  ),
              ],
            ),
                ),



                
                ],
              ));
        }),
      ),
    );
  }
}

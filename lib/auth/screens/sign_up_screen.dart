import 'package:firbase_app_test/app_router/app_router.dart';
import 'package:firbase_app_test/auth/components/custom_textfield.dart';
import 'package:firbase_app_test/auth/providers/auth_provider.dart';
import 'package:firbase_app_test/auth/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_repositories/constant.dart';
import '../../utils.dart';
import '../widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Consumer<AuthProvider>(builder: (context, provider, x) {
          return Form(
              key: provider.signUpKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text
                          ( 'Sign Up',
                          style: SafeGoogleFont ('Muli',
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff757575),),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    Text(
                      "Register Account",
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
                      "Complete your details or continue  \n with social media",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height:50),
                    CustomTextField(
                      svgIcon:"assets/icons/User.svg" ,
                      validation: provider.requiredValidation,
                      label: 'Name',
                      controller: provider.userNameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      svgIcon:  "assets/icons/Phone.svg",
                      validation: provider.phoneValidation,
                      label: 'Phone Number',
                      controller: provider.phoneController,
                      textInputType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      svgIcon: "assets/icons/Mail.svg",
                      validation: provider.emailValidation,
                      label: 'Email',
                      controller: provider.registerEmailController,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      svgIcon: "assets/icons/Lock.svg",
                      validation: provider.passwordValidation,
                      label: 'Password',
                      controller: provider.passwordRegisterController,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    CustomButton
                      (
                      text:'Sign Up',
                      press:() {
                        provider.SignUp();
                      },
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already created account? ",
                          style:
                          SafeGoogleFont (
                              'Muli',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () =>  AppRouter.appRouter.goToWidgetAndReplace(SignInScreen()),
                          child: Text(
                            "Sign In",
                            style:SafeGoogleFont ('Muli',fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: PrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}

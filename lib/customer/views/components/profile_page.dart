import 'package:firbase_app_test/admin/providers/admin_provider.dart';
import 'package:firbase_app_test/customer/views/components/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../admin/views/screens/main_admin_screen.dart';
import '../../../app_router/app_router.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../auth/screens/account_screen.dart';
import '../../../utils.dart';

class ProfilePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text
              ( 'Profile',
              style: SafeGoogleFont ('Muli',
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Color(0xff757575),),
            ),

          ],
        ),

        //ProfilePic(),
        SizedBox(height: 20),
        ProfileWidget(
          text: "My Account",
          icon: "assets/icons/User Icon.svg",
          press: () {AppRouter.appRouter.goToWidget(AccountScreen());},),
        ProfileWidget(
          text: "Notifications",
          icon: "assets/icons/Bell.svg",
          press: () {},
        ),
        Provider.of<AuthProvider>(context).loggedUser!.isAdmin
        ? ProfileWidget(
          text: "Admin Dashboard",
          icon: "assets/icons/Settings.svg",
          press: () {AppRouter.appRouter.goToWidget(MainAdminScreen());},)
        : SizedBox(),
        ProfileWidget(
          text: Provider.of<AdminProvider>(context).isDarkMode
          ?"Set light mode"
          :"Set dark mode",
          icon: Provider.of<AdminProvider>(context).isDarkMode
              ? "assets/icons/sun.svg"
               :"assets/icons/darkmode.svg",
          press: () {Provider.of<AdminProvider>(context, listen: false).changeIsDarkMode();},
        ),
        ProfileWidget(
          text: "Log Out",
          icon: "assets/icons/Log out.svg",
          press: () { Provider.of<AuthProvider>(context, listen: false).signOut();},
        ),
      ],
    ),
  );
  }

}
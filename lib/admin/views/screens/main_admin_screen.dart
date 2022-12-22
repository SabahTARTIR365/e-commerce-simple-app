
import 'package:flutter/material.dart';
import '../../../app_router/app_router.dart';
import '../../../utils.dart';
import '../components/dashboard_widget.dart';
import 'all_sliders_screen.dart';
import 'display_categories.dart';

class MainAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_sharp,color: Color(0xff757575),)),
                  SizedBox(width: 60,),
                  Text
                    ( 'Admin Dashboard',
                    style: SafeGoogleFont ('Muli',
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff757575),),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(

                children: [
                  Text(
                    "     Welcome Back!",
                    textAlign: TextAlign.start,
                    style: SafeGoogleFont ('Muli',
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Row(
                children: [

                  DashboardWidget(
                    label: 'Go To Categories',
                    onPress: () {
                      AppRouter.appRouter.goToWidget(AllCategoriesScreen());
                      },),
                 const SizedBox(
                    width: 20,
                  ),
                  DashboardWidget(
                    label: 'Go To Sliders',
                    onPress: () {
                      AppRouter.appRouter.goToWidget(AllSliderScreen());
                    },),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

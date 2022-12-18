import 'package:firbase_app_test/data_repositories/auth_helper.dart';
import 'package:firbase_app_test/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils.dart';
import '../widgets/custom_button.dart';
import '../widgets/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  navigationFun(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    Provider.of<AuthProvider>(context, listen: false).checkUser();
  }


  @override
  Widget build(BuildContext context) {
   // navigationFun(context);
    return Scaffold(
      body:SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashWidget(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height*0.2),
                child: Column(
                  children:[
                   const  Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),

                  ],
                ),
              ),
            ),


            Expanded(
              child: CustomButton(
                text: "Continue",
                press: () {
                  //  Navigator.pushNamed(context, SignInScreen());
                  navigationFun(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFFFF7643) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

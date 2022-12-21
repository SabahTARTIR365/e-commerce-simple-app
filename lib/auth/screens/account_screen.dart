import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:firbase_app_test/auth/providers/auth_provider.dart';

import '../../customer/views/components/profile_image_widget.dart';
import '../../utils.dart';
import '../components/custom_textfield.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Consumer<AuthProvider>(
          builder: (context, provider, w) {
            return Container(
              color: Colors.white,
              child: provider.loggedUser == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                            SizedBox(width: 120,),
                            Text
                              ( 'Profile',
                              style: SafeGoogleFont ('Muli',
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff757575),),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        ProfileImageWidget(),
                        const SizedBox(
                          height: 20,
                        ),
                         //

                        CustomProfileWidget(
                          label: "user name: ",
                          value: provider.loggedUser!.userName,
                        ),
                        CustomProfileWidget(
                          label: "user email: ",
                          value: provider.loggedUser!.email,
                        ),
                        CustomProfileWidget(
                          label: "user phone: ",
                          value: provider.loggedUser!.phoneNumber,
                        ),
                      ],
                    ),
            );
          },
        )

    );
  }
}

class CustomProfileWidget extends StatelessWidget {
  final String label;
  final String value;
  const CustomProfileWidget({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
              child: Text(
            label,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
          Expanded(
              flex: 2,
              child: Text(
                value,
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}

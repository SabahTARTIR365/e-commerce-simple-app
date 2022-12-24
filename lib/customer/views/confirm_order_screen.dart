import 'package:firbase_app_test/customer/views/cart_screen.dart';
import 'package:firbase_app_test/data_repositories/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../admin/providers/admin_provider.dart';
import '../../app_router/app_router.dart';
import '../../auth/components/custom_textfield.dart';
import '../../auth/widgets/custom_button.dart';
import '../../utils.dart';
import 'order_success_screen.dart';

class ConfirmOrderScreen extends StatelessWidget
{
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
     // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Colors.white.withOpacity(0.2),
        elevation: 0,
        leading: IconButton(
          onPressed: () {  AppRouter.appRouter.goToWidgetAndReplace(CartScreen()); },
          icon: Icon(Icons.arrow_back_outlined,color: Colors.grey,),),
        title: Text(
            "Confirm Your Order ",
            style: SafeGoogleFont ('Muli',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey,)
        ),
      ),
      body:Consumer<AdminProvider>(builder: (context, provider, w) {
        return SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
               Icon( Icons.wrong_location_outlined,size: 30,color: PrimaryColor,),
            SizedBox(height: 5,),
            Text(
                "Add Address",
                style: SafeGoogleFont ('Muli',
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,)
            ),
           // SizedBox(height: 5,),
            Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
              decoration: BoxDecoration(
                  color: Colors.grey,
                borderRadius: BorderRadius.circular(80),
              ),
              width: MediaQuery.of(context).size.width*0.8,
              height: 410,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: GoogleMap(
                markers: provider.markers,
                onTap: (LatLng value){
                  provider.center=value;
                  provider.addMarker(value);
                  print(value.longitude);
                  print(value.longitude);
                },
                onMapCreated: provider.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: provider.center,
                  zoom: 11.0,
                ),
            ),
              ),),
            Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: CustomTextField(
                svgIcon: "assets/icons/white.svg",
                controller: provider.addressController,
                label: 'Address',
                validation: provider.requiredValidation,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 20, 10),
              child: CustomButton(
                text: "Confirm",
                press: () {
                  AppRouter.appRouter.goToWidgetAndReplace(OrderSuccessScreen());
                },
              ),
            ),


          ],
      ),
        );
        }),
    );
  }


}
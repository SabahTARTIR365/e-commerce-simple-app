
import 'package:firbase_app_test/admin/views/screens/add_new_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_router/app_router.dart';
import '../../../data_repositories/constant.dart';
import '../../../utils.dart';
import '../../providers/admin_provider.dart';
import '../components/Slider_widget.dart';

class AllSliderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        backgroundColor:  Colors.white.withOpacity(0.2),
        elevation: 0,
        title: Text('All Sliders',
            style: SafeGoogleFont ('Muli',
          fontSize: 23,
          fontWeight: FontWeight.w500,
          color: Colors.grey,)),
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewSliderScreen());
              },
              icon: Icon(Icons.add))
        ],
      ),

      body: Consumer<AdminProvider>(
        builder: (context, provider, u) {
          return provider.allSliders == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : provider.allSliders!.isEmpty
                  ? Center(
                      child: Text('No Sliders Found'),
                    )
                  : ListView.builder(
                      itemCount: provider.allSliders!.length,
                      itemBuilder: (context, index) {
                        return SliderWidget(provider.allSliders![index]);
                      });
        },
      ),
    );
  }
}

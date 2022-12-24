
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/components/custom_textfield.dart';
import '../../../data_repositories/constant.dart';
import '../../../utils.dart';
import '../../providers/admin_provider.dart';

class AddNewSliderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        backgroundColor:  Colors.white.withOpacity(0.2),
        elevation: 0,
        title :Text(
            "Add New Slider",
            style: SafeGoogleFont ('Muli',
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Colors.grey,)
        ),
      ),



      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                provider.pickImageForCategory();
              },
              child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey,
                  child: provider.imageFile == null
                      ? Center(
                          child: Icon(Icons.camera),
                        )
                      : Image.file(
                          provider.imageFile!,
                          fit: BoxFit.cover,
                        )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    svgIcon: "assets/icons/white.svg",
                    controller: provider.sliderTitleController,
                    label: 'Slider Title',
                    validation: provider.requiredValidation,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    svgIcon: "assets/icons/white.svg",
                    controller: provider.sliderUrlController,
                    label: 'Slider Url',
                    validation: provider.requiredValidation,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          provider.AddNewSlider();
                        },
                        child: Text('Add New Slider')),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

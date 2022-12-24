import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomTextField extends StatelessWidget {
  final Function validation;
  final TextEditingController controller;
  bool isPassword;
  bool isEnabled;
  final TextInputType textInputType;
  String svgIcon;
  final String label;
  CustomTextField({
    Key? key,
    required this.validation,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.isEnabled=true,
    this.textInputType = TextInputType.text,
    required this.svgIcon

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      maxLines: null,
      enabled: isEnabled,
      keyboardType: textInputType,
      obscureText: isPassword,
      controller: controller,
      validator: (v) => validation(v),
      decoration: InputDecoration(
          label: Text(label),
          suffixIcon:  Align( widthFactor: 1.0,
              heightFactor: 1.0,
              child: SvgPicture.asset(svgIcon,width: 15,height: 15,)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}

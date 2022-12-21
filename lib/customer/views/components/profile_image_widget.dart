import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../auth/providers/auth_provider.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, provider, w) {
          return Stack(
            children:[
              Container(
                height: 120,
                width: 120,
                decoration:   BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image:  provider.loggedUser?.imageUrl == null
                          ?  const AssetImage("assets/images/profile.png")
                          :  NetworkImage((provider.loggedUser?.imageUrl)!,) as ImageProvider ,
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SizedBox(
                  height: 38,
                  width: 38,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      primary: Colors.white,
                      backgroundColor: Color(0xFFF5F6F9),
                    ),
                    onPressed: () { provider.uploadNewFile();},
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                  ),
                ),
              )


            ],
          );
        },
      )
      ;
  }
}

import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage appLogoAsset = AssetImage("/Users/bilalelmahdaoui/DevEnv/AndroidStudioProjects/imt_podcast_app/images/logo-imt.png");
    Image appLogo = Image(image: appLogoAsset, width: 200, height: 200);
    return Container(child: appLogo);
  }

  static Widget smallSize() {
    AssetImage appLogoAsset = AssetImage("/Users/bilalelmahdaoui/DevEnv/AndroidStudioProjects/imt_podcast_app/images/logo-imt.png");
    Image appLogo = Image(image: appLogoAsset, width: 100, height: 100);
    return Container(child: appLogo);
  }

}
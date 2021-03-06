import 'dart:ui';
import 'package:digilearn/pages/Home/homeScreen.dart';
import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Support extends StatelessWidget {
  static String routeName = "/support";
  const Support({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<ScreenController>().change(1);
              print(Get.find<ScreenController>().page);
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
            }),
        title: Text('Help Center', style: TextStyle(color: Colors.white)),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.popAndPushNamed(context, HomeScreen.routeName);
          return true;
        },
        //Body Container
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: backgroundColor,
              image:
                  DecorationImage(image: AssetImage("assets/images/bg.png"))),
          child: WebView(
            initialUrl: Strings.appSupport,
          ),
        ),
      ),
    );
  }
}

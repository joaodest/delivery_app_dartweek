import 'package:delivery_app_dartweek/app/core/core/ui/styles/colors_app.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/theme/theme_config.dart';
import 'package:delivery_app_dartweek/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      title: "Delivery App",
      routes: {
        "/" : (context) => SplashPage(),
      },
    );
  }
}

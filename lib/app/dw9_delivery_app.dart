import 'package:delivery_app_dartweek/app/core/core/global/global_context.dart';
import 'package:delivery_app_dartweek/app/core/core/provider/application_binding.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/styles/colors_app.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/theme/theme_config.dart';
import 'package:delivery_app_dartweek/app/pages/auth/login/login_page.dart';
import 'package:delivery_app_dartweek/app/pages/auth/login/login_router.dart';
import 'package:delivery_app_dartweek/app/pages/auth/register/register_page.dart';
import 'package:delivery_app_dartweek/app/pages/auth/register/register_router.dart';
import 'package:delivery_app_dartweek/app/pages/home/home_page.dart';
import 'package:delivery_app_dartweek/app/pages/home/home_router.dart';
import 'package:delivery_app_dartweek/app/pages/order/order_completed_page.dart';
import 'package:delivery_app_dartweek/app/pages/order/order_page.dart';
import 'package:delivery_app_dartweek/app/pages/order/order_router.dart';
import 'package:delivery_app_dartweek/app/pages/product_details/product_details_page.dart';
import 'package:delivery_app_dartweek/app/pages/product_details/product_details_router.dart';
import 'package:delivery_app_dartweek/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Dw9DeliveryApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

   Dw9DeliveryApp({super.key}){
    GlobalContext.instance.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: false,
        navigatorKey: _navKey,
        title: "Delivery App",
        routes: {
          "/": (context) => SplashPage(),
          "/home": (context) => HomeRouter.page,
          "/productDetails": (context) => ProductDetailsRouter.page,
          "/auth/login": (context) => LoginRouter.page,
          "/auth/register": (context) => RegisterRouter.page,
          "/order": (context) => OrderRouter.page,
          "/order/completed": (context) => const OrderCompletedPage(),
        },
      ),
    );
  }
}

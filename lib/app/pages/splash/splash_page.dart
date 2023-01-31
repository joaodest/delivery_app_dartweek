import 'package:delivery_app_dartweek/app/core/core/config/env/env.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app_dartweek/app/core/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash"),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            height: 200,
            width: 200,
            onPressed: (){},
            label: Env.instance['backend_base_url'] ?? '',
          ),
          Container(
            color: Colors.red,
            width: context.percentWidth(.5),
            height: 200,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'text'),
          ),
        ],
      ),
    );
  }
}

import 'package:delivery_app_dartweek/app/core/core/rest_client/custom_dio.dart';
import 'package:delivery_app_dartweek/app/repositories/auth/auth_repository.dart';
import 'package:delivery_app_dartweek/app/repositories/auth/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context)=> CustomDio(),
        ),

        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(dio: context.read()),
        ),
      ],
      child: child,
    );
  }
}

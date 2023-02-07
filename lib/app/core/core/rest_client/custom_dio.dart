import 'package:delivery_app_dartweek/app/core/core/config/env/env.dart';
import 'package:delivery_app_dartweek/app/core/core/rest_client/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {

  late AuthInterceptor _authInterceptor;

  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.instance['backend_base_url'] ?? '',
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true
      ),
    );
    _authInterceptor = AuthInterceptor();
  }
  CustomDio auth(){
    interceptors.add(_authInterceptor);
    return this;
  }
  CustomDio unauth(){
    interceptors.add(_authInterceptor);
    return this;
  }
}

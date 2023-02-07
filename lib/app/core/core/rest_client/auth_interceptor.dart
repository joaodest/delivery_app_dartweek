import 'package:delivery_app_dartweek/app/core/core/global/global_context.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor{

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString("accessToken");
    options.headers["Authorization"] = "Bearer $accessToken";
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async{
    if(err.response?.statusCode == 401){
      //Redirecionar o usuário para a tela de home
      GlobalContext.instance.loginExpire();
      handler.next(err);
    } else {
      handler.next(err);
    }
  }
}
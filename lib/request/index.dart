import 'package:dio/dio.dart';

/// 环境枚举
enum env { development, production }

Map<env, String> baseUrl = {
  env.development: 'http://134.175.183.187:1080/',
  env.production: 'https://factory.myjuniu.com/'
};

Map<env, String> baseApi = {
  env.development: 'new-mf-fac/',
  env.production: 'new-mf-fac/'
};

class Requset {
  Dio dio = new Dio(BaseOptions(
    baseUrl: baseUrl[env.development],
  ));
}

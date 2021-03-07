import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

/// 环境枚举
enum env { development, production }

Map<env, String> baseUrl = {
  env.development: 'https://factory.myjuniu.com/',
  env.production: 'https://factory.myjuniu.com/'
};

Map<env, String> baseApi = {
  env.development: 'new-mf-fac/',
  env.production: 'new-mf-fac/'
};

class Requset {
  String url;
  Dio dio;
  Requset(String url) {
    this.url =
        url != null ? url : baseUrl[env.development] + baseApi[env.development];
    this.dio = new Dio(BaseOptions(baseUrl: this.url));
  }

  void init() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // config the http client
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        return "PROXY 192.168.31.116:8888";
        // return "PROXY 10.2.108.63:8888";
      };
      // you can also create a new HttpClient to dio
      // return new HttpClient();
      // client.badCertificateCallback =
      //     (X509Certificate cert, String host, int port) => true;
    };
  }
}

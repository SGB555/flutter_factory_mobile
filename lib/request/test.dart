import 'package:dio/dio.dart';
import 'package:flutter_factory_mobile/common/address.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_factory_mobile/request/code.dart';

import 'dioLogInterceptor.dart';
import 'resultData.dart';

class HttpManager {
  static HttpManager _instance = HttpManager._internal();
  Dio _dio;
  static const CODE_SUCCESS = 200;
  static const CODE_TIME_OUT = -1;

  factory HttpManager() => _instance;

  HttpManager._internal() {
    if (_dio == null) {
      _dio = new Dio(
        BaseOptions(baseUrl: Address.baseUrl, connectTimeout: 15000),
      );
      // 拦截器
      _dio.interceptors.add(new DioLogInterceptor());
      // _dio.interceptors.add(new ResponseInterceptors());
    }
  }

  /// 用于指定特定域名
  HttpManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio.options.baseUrl = baseUrl;
    }
    return this;
  }

  /// 一般请求，默认域名
  HttpManager _normal() {
    if (_dio != null) {
      if (_dio.options.baseUrl != Address.baseUrl) {
        _dio.options.baseUrl = Address.baseUrl;
      }
    }
    return this;
  }

  static HttpManager getInstance({String baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  /// 通用的GET请求
  get(api, {params, withLoading = true}) async {
    if (withLoading) {
      EasyLoading.show();
    }
    Response response;

    try {
      response = await _dio.get(api, queryParameters: params);
    } on DioError catch (e) {
      if (withLoading) {
        EasyLoading.dismiss();
      }
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }

    return response.data;
  }

  ///通用的POST请求
  post(api, {params, withLoading = true}) async {
    if (withLoading) {
      EasyLoading.show();
    }

    Response response;

    try {
      response = await _dio.post(api, data: params);
      if (withLoading) {
        EasyLoading.dismiss();
      }
    } on DioError catch (e) {
      if (withLoading) {
        EasyLoading.dismiss();
      }
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }

    return response.data;
  }

  /// 错误处理
  ResultData resultError(DioError e) {
    Response errorResponse;
    if (e.response != null) {
      errorResponse = e.response;
    } else {
      errorResponse = Response(statusCode: 666);
    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT) {
      errorResponse.statusCode = Code.NETWORK_TIMEOUT;
    }
    return new ResultData(
        errorResponse.statusMessage, false, errorResponse.statusCode);
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';

class Request {
  // 配置 Dio 实例
  static final BaseOptions _options = BaseOptions(

      ///Api地址
      baseUrl: 'http://218.78.33.135:8081/api',

      ///打开超时时间
      connectTimeout: 50000,

      ///接收超时时间
      receiveTimeout: 30000);

  // 创建 Dio 实例
  static final Dio _dio = Dio(_options);

  // _request 是核心函数，所有的请求都会走这里
  static Future<T> _request<T>(String path,
      {String? method, Map? params, data}) async {
    // restful 请求处理
    if (params != null) {
      params.forEach((key, value) {
        if (path.contains(key)) {
          path = path.replaceAll(":$key", value.toString());
          print(path);
        }
      });
    }
    try {
      Response response = await _dio.request(path,
          data: data, options: Options(method: method));
      return response.data;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<T> get<T>(String path, {Map? params}) {
    return _request(path, method: 'get', params: params);
  }

  static Future<T> post<T>(String path, {Map? params, data}) {
    return _request(path, method: 'post', params: params, data: data);
  }
// 这里只写了 get 和 post，其他的别名大家自己手动加上去就行
}

import 'dart:convert';
import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';


class LoggerInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("data status code :-->${data.statusCode}");
    log('interceptResponse ${data.statusCode} body: ${(data.body?.isNotEmpty ?? true) ? json.decode(data.body ?? '') : ""}');
    if (data.statusCode == 401) {}
    return data;
  }
}

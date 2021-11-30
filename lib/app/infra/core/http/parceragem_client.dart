import 'package:dio/adapter.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';

class ParceragemClient extends DioMixin {
  @override
  HttpClientAdapter get httpClientAdapter => BrowserHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: 'http://127.0.0.1:8000/api/v1/',
        headers: {
          'content-Type': 'application/json',
        },
      );
}

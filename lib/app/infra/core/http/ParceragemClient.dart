import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ParceragemClient extends DioMixin {
  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: 'http://10.0.2.2:8000/api/v1/',
        headers: {
          'content-Type': 'application/json',
          'authorization': 'Bearer 24|x8VfyZ1IHoEIhGB4L7zhKCtVBl4MtlzcmGympug2',
        },
      );
}

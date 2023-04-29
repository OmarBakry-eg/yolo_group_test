import 'dart:convert';
import 'dart:io';
//import 'package:casino_test/src/core/errors/logger.dart';
import 'package:casino_test/src/core/internet/internet_info.dart';
import 'package:casino_test/src/utils/ui/consts.dart';
// import 'dio_exception.dart';
// import 'error_model.dart';
import 'result.dart';
import 'package:http/http.dart' as http;

class NetworkClient {
  final InternetInfo _internetInfo;
  NetworkClient(this._internetInfo);

  static const String _devBaseURL = 'https://api.stackexchange.com/2.2/users';

  static const Duration _duration = Duration(seconds: 10);

  final http.Client _client = http.Client();


  // final Dio _dio = Dio(BaseOptions(
  //     connectTimeout: _duration, // 10 seconds
  //     receiveTimeout: _duration // 10 seconds
  //     ))
  //   ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
  //     logInfo(options.uri.toString());
  //     logInfo(options.headers.toString());
  //     logInfo(options.data.toString());
  //     return handler.next(options);
  //   }, onResponse: (response, handler) {
  //     logSuccess("RESPONSE_CODE ${response.statusCode}");
  //     logSuccess("RESPONSE_DATA ${response.data}");
  //     logSuccess('----------------------------------------------------------');
  //     return handler.next(response);
  //   }, onError: (response, handler) {
  //     logError(response.error.toString());
  //     logError("error.response.data ${response.response?.data}");
  //     logWarning('----------------------------------------------------------');
  //     return handler.next(response);
  //   }));

  Result _switchFunc(HttpException error)=> Result.error(error.message);
  

  Future<Result> get(
    String api, {
    Map<String, dynamic>? queryParameters,
    String? fullURL,
    bool isLoading = false,
    bool keepLoading = false,
    bool removeErrResult = false,
  }) async {
    String url = _devBaseURL + api;
    bool interNetaAvailale = await _internetInfo.isConnected;
    if (isLoading) {
      Constants.showLoading();
    }
    if (interNetaAvailale) {
      try {
        http.Response response =
            await _client.get(Uri.parse(fullURL ?? url)).timeout(_duration);

        if (!keepLoading && isLoading) {
          Constants.hideLoadingOrNavBack();
        }
        return Result.success(json.decode(response.body));
      } on HttpException catch (error) {
        if (isLoading && !keepLoading) {
          Constants.hideLoadingOrNavBack();
        }
        return _switchFunc(error);
      }
    } else {
      if (isLoading || !keepLoading) {
        Constants.hideLoadingOrNavBack();
      }
      return Result.networkError("No internet connection");
    }
  }
}

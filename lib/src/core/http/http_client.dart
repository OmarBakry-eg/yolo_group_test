import 'dart:convert';
import 'package:casino_test/src/core/errors/logger.dart';
import 'package:casino_test/src/core/internet/internet_info.dart';
import 'package:casino_test/src/utils/ui/consts.dart';
import 'result.dart';
import 'package:http/http.dart' as http;

class NetworkClient {
  final InternetInfo _internetInfo;
  NetworkClient(this._internetInfo);

  static const String _devBaseURL =
      'https://rickandmortyapi.com/api/character/?page=';

  static const Duration _duration = Duration(seconds: 3);

  final http.Client _client = http.Client();

  Result _errorFunc(Exception error) => Result.error(error.toString());

  Future<Result> get(
    String pageQueryParm, {
    String? fullURL,
    bool isLoading = false,
  }) async {
    String url = _devBaseURL + pageQueryParm;
    bool interNetaAvailale = await _internetInfo.isConnected;
    if (isLoading) {
      Constants.showLoading();
    }
    if (interNetaAvailale) {
      try {
        http.Response response =
            await _client.get(Uri.parse(fullURL ?? url)).timeout(_duration);
        logInfo("URL : $url");
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }
        logInfo("Response : ${response.statusCode}, ${response.body}");
        return Result.success(json.decode(response.body));
      } on Exception catch (error) {
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }
        return _errorFunc(error);
      }
    } else {
      if (isLoading) {
        Constants.hideLoadingOrNavBack();
      }
      return Result.networkError("No internet connection");
    }
  }
}

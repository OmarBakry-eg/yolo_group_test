import 'package:casino_test/src/core/http/http_client.dart';
import 'package:casino_test/src/core/internet/internet_info.dart';
import 'package:casino_test/src/features/home/data/repository/characters_repository.dart';
import 'package:casino_test/src/features/home/data/repository/characters_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MainDIModule {
  final GetIt sl = GetIt.instance;
  Future<void> init() async {
    final httpClient = Client();

    sl.registerLazySingleton<CharactersRepository>(
        () => CharactersRepositoryImpl(httpClient));

    sl.registerLazySingleton(() => NetworkClient(sl()));

    sl.registerLazySingleton<InternetInfo>(() => InternetInfoImpl(sl()));

    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}

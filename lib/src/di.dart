import 'package:casino_test/src/core/http/http_client.dart';
import 'package:casino_test/src/core/internet/internet_info.dart';
import 'package:casino_test/src/features/home/data/repository/characters_repository_impl.dart';
import 'package:casino_test/src/features/home/data/source/remote_source.dart';
import 'package:casino_test/src/features/home/domain/repository/domain_repo.dart';
import 'package:casino_test/src/features/home/domain/usecase/get_all_characters.dart';
import 'package:casino_test/src/features/home/presentation/bloc/main_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MainDIModule {
  static final GetIt sl = GetIt.instance;
  static Future<void> init() async {
//* BLOC
    sl.registerFactory<MainPageBloc>(() => MainPageBloc(sl()));

//* USECASES
    sl.registerLazySingleton<GetAllCharacters>(() => GetAllCharacters(sl()));

//* REPO
    sl.registerLazySingleton<CharactersDomainRepository>(
        () => CharactersRepositoryImpl(sl()));

//* DATA
    sl.registerLazySingleton<CharacterRemoteSourceImpl>(
        () => CharacterRemoteSourceImpl(sl()));

//* CORE
    sl.registerLazySingleton(() => NetworkClient(sl()));

    sl.registerLazySingleton<InternetInfo>(() => InternetInfoImpl(sl()));

    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}

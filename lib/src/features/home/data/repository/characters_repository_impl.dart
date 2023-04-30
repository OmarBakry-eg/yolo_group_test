import 'package:casino_test/src/core/errors/exceptions.dart';
import 'package:casino_test/src/core/errors/failures.dart';
import 'package:casino_test/src/features/home/data/source/remote_source.dart';
import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:casino_test/src/features/home/domain/repository/domain_repo.dart';
import 'package:dartz/dartz.dart';

class CharactersRepositoryImpl implements CharactersDomainRepository {
  final CharacterRemoteSourceImpl _characterRemoteSourceImpl;
  const CharactersRepositoryImpl(this._characterRemoteSourceImpl);

  @override
  Future<Either<Failure, List<CharacterEntity>?>> getAllCharacters(
      int page) async {
    try {
      final List<CharacterEntity> characterEntity =
          await _characterRemoteSourceImpl.getAllCharacters(page);
      return Right(characterEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on OfflineException catch (e) {
      return Left(OfflineFailure(message: e.message));
    }
  }

  // @override
  // Future<List<CharacterModel>?> getCharacters(int page) async {
  //   var client = Client();
  //   final charResult = await client.get(
  //     Uri.parse("https://rickandmortyapi.com/api/character/?page=$page"),
  //   );
  //   final jsonMap = await json.decode(charResult.body) as Map<String, dynamic>;

  //   final bool showMockedError = Random().nextBool();
  //   print("casino test log: showMockedError = $showMockedError");
  //   if (showMockedError) {
  //     return Future.delayed(
  //       const Duration(seconds: 5),
  //       () => null,
  //     );
  //   }
  //   return Future.value(
  //     List.of(
  //       (jsonMap["results"] as List<dynamic>).map(
  //         (value) => CharacterModel.fromJson(value),
  //       ),
  //     ),
  //   );
  // }
}

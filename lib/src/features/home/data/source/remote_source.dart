import 'package:casino_test/src/core/errors/exceptions.dart';
import 'package:casino_test/src/core/http/http_client.dart';
import 'package:casino_test/src/core/http/result.dart';
import 'package:casino_test/src/features/home/data/models/character_model.dart';

abstract class CharacterRemoteSource {
  Future<List<CharacterModel>> getAllCharacters(int page);
}

class CharacterRemoteSourceImpl implements CharacterRemoteSource {
  final NetworkClient _networkClient;
  const CharacterRemoteSourceImpl(this._networkClient);

  @override
  Future<List<CharacterModel>> getAllCharacters(int page) async {
    Result result = await _networkClient.get(page.toString());
    if (result is SuccessState) {
      List<CharacterModel> characters =
          List.of((result.value["results"] as List<dynamic>).map(
        (value) => CharacterModel.fromJson(value),
      ));
      return characters;
    } else if (result is ErrorState) {
      throw ServerException(message: result.msg.toString());
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }
}

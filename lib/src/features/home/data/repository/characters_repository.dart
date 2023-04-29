import 'package:casino_test/src/features/home/data/models/character_model.dart';

abstract class CharactersRepository {
  Future<List<CharacterModel>?> getCharacters(int page);
}

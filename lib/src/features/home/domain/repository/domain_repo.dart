import 'package:casino_test/src/core/errors/failures.dart';
import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CharactersDomainRepository {
  Future<Either<Failure,List<CharacterEntity>?>> getAllCharacters(int page);
}

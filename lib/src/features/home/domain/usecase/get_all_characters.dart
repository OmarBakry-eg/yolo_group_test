import 'package:casino_test/src/features/home/domain/repository/domain_repo.dart';
import 'package:casino_test/src/core/errors/failures.dart';
import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:dartz/dartz.dart';

class GetAllCharacters {
  final CharactersDomainRepository _repository;
  const GetAllCharacters(this._repository);

  Future<Either<Failure, List<CharacterEntity>?>> call(int page) async =>
      await _repository.getAllCharacters(page);
}

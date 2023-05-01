import 'package:casino_test/src/core/errors/failures.dart';
import 'package:casino_test/src/features/home/data/repository/characters_repository_impl.dart';
import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:casino_test/src/di.dart' as di;

class MockRepoSource extends Mock implements CharactersRepositoryImpl {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.MainDIModule.init();
  final MockRepoSource mockRepoSource = MockRepoSource();
  final CharactersRepositoryImpl repoSourceDataImpl =
      CharactersRepositoryImpl(di.MainDIModule.sl());
  test('getAllCharacters', () async {
    when(() => mockRepoSource.getAllCharacters(1)).thenAnswer((invocation) =>
        Future.value(Either.cond(() => false, () => const <CharacterEntity>[],
            () => const ServerFailure(message: ''))));

    expect(await repoSourceDataImpl.getAllCharacters(1),
        isA<Either<Failure, List<CharacterEntity>?>>());
  });
}

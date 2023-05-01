import 'package:casino_test/src/features/home/data/models/character_model.dart';
import 'package:casino_test/src/features/home/data/source/remote_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:casino_test/src/di.dart' as di;

class MockRemoteSource extends Mock implements CharacterRemoteSourceImpl {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.MainDIModule.init();
  final MockRemoteSource mockRemoteSource = MockRemoteSource();
  final CharacterRemoteSourceImpl remoteSourceDataImpl =
      CharacterRemoteSourceImpl(di.MainDIModule.sl());
  test('getAllCharacters', () async {
    when(() => mockRemoteSource.getAllCharacters(1))
        .thenAnswer((invocation) => Future.value(const <CharacterModel>[]));

    expect(remoteSourceDataImpl.getAllCharacters(1),
        isA<Future<List<CharacterModel>>>());
  });
}

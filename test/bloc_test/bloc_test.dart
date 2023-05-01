import 'package:casino_test/src/di.dart' as di;
import 'package:casino_test/src/features/home/presentation/bloc/main_bloc.dart';
import 'package:casino_test/src/features/home/presentation/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.MainDIModule.init();

  late MainPageBloc mainPageBloc;
  setUp(() {
    mainPageBloc = MainPageBloc(di.MainDIModule.sl());
  });

  tearDownAll(() => mainPageBloc.close());

  group('MainPageBloc', () {
    test('init state is InitialMainPageState', () {
      expect(mainPageBloc.state, InitialMainPageState());
    });

    blocTest(
      'setupScrollController',
      build: () => mainPageBloc,
      act: (cubit) => mainPageBloc.setupScrollController(),
      expect: () => [],
    );

    blocTest('getAllCharacters',
        build: () => mainPageBloc,
        act: (cubit) => mainPageBloc.getAllCharacters(),
        expect: () => [LoadingMainPageState(), isA<SuccessfulMainPageState>()]);
        
    blocTest('onRefreshCalled',
        build: () => mainPageBloc,
        act: (cubit) => mainPageBloc.onRefreshCalled(),
        expect: () => [LoadingMainPageState(), isA<SuccessfulMainPageState>()]);
  });
}

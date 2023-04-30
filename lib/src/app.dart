import 'package:casino_test/src/features/home/presentation/bloc/main_bloc.dart';
import 'package:casino_test/src/features/home/presentation/screens/character_screen.dart';
import 'package:casino_test/src/utils/ui/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: MainPageBloc(di.MainDIModule.sl()))
      ],
      child: MaterialApp(
        navigatorKey: Constants.navigatorKey,
        title: 'Test app',
        home: CharactersScreen(),
      ),
    );
  }
}

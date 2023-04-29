import 'package:casino_test/src/features/home/data/repository/characters_repository.dart';
import 'package:casino_test/src/features/home/presentation/bloc/main_bloc.dart';
import 'package:casino_test/src/features/home/presentation/bloc/main_event.dart';
import 'package:casino_test/src/features/home/presentation/bloc/main_state.dart';
import 'package:casino_test/src/features/home/presentation/widgets/successful_widget.dart';
import 'package:casino_test/src/utils/base/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MainPageBloc(
          InitialMainPageState(),
          GetIt.I.get<CharactersRepository>(),
        )..add(const GetTestDataOnMainPageEvent(1)),
        child: BlocConsumer<MainPageBloc, MainPageState>(
          listener: (context, state) {},
          builder: (blocContext, state) {
            if (state is LoadingMainPageState) {
              return const CustomLoadingWidget();
            } else if (state is SuccessfulMainPageState) {
              return SuccessfulWidget(characters: state.characters);
            } else {
              return const Center(child: const Text("error"));
            }
          },
        ),
      ),
    );
  }

}

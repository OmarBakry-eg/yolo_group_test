// import 'package:casino_test/src/core/errors/logger.dart';
import 'package:casino_test/src/features/home/presentation/bloc/main_bloc.dart';
import 'package:casino_test/src/features/home/presentation/bloc/main_state.dart';
import 'package:casino_test/src/features/home/presentation/widgets/character_list_widget.dart';
import 'package:casino_test/src/utils/base/custom_app_bar.dart';
import 'package:casino_test/src/utils/base/custom_base_text.dart';
import 'package:casino_test/src/utils/base/custom_loading_widget.dart';
import 'package:casino_test/src/utils/ui/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late final MainPageBloc _bloc;
  @override
  void initState() {
    _bloc = BlocProvider.of<MainPageBloc>(context);
    _bloc.setupScrollController();
    _bloc.getAllCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      appBar: CustomAppBar(
        centerTitle: true,
        title: 'Rick and Morty',
      ),
      body: BlocBuilder<MainPageBloc, MainPageState>(
        bloc: _bloc,
        //listener: (context, state) => logWarning('current state is $state'),
        builder: (blocContext, state) {
          if (state is LoadingMainPageState) {
            return const CustomLoadingWidget();
          } else if (state is SuccessfulMainPageState) {
            return CharacterListWidget(
              bloc: _bloc,
              useSucessfulState: true,
              sucessfulState: state,
            );
          } else if (state is UnSuccessfulMainPageState) {
            return state.characters.isNotEmpty
                ? CharacterListWidget(
                    bloc: _bloc,
                    useSucessfulState: false,
                    unSucessfulState: state,
                  )
                : Center(child: CustomBaseText(title: state.message));
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

import 'package:casino_test/src/features/home/presentation/bloc/main_bloc.dart';
import 'package:casino_test/src/features/home/presentation/bloc/main_state.dart';
import 'package:casino_test/src/utils/base/custom_base_text.dart';
import 'package:casino_test/src/utils/base/custom_loading_widget.dart';
import 'package:casino_test/src/utils/ui/extension.dart';
import 'package:casino_test/src/utils/ui/my_colors.dart';
import 'package:flutter/material.dart';

import 'character_widget.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget({
    super.key,
    required MainPageBloc bloc,
    required this.useSucessfulState,
    this.sucessfulState,
    this.unSucessfulState,
  }) : _bloc = bloc;

  final MainPageBloc _bloc;
  final bool useSucessfulState;
  final SuccessfulMainPageState? sucessfulState;
  final UnSuccessfulMainPageState? unSucessfulState;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: MyColors.orangeColor,
      onRefresh: () async => await _bloc.onRefreshCalled(),
      child: ListView.builder(
        controller: _bloc.scrollController,
        cacheExtent: double.infinity,
        itemCount: useSucessfulState
            ? sucessfulState!.hasReachedMax
                ? sucessfulState!.characters.length
                : sucessfulState!.characters.length + 1
            : unSucessfulState!.characters.length + 1,
        itemBuilder: (context, i) {
          if (useSucessfulState) {
            return i >= sucessfulState!.characters.length
                ? const Center(
                    child: CustomLoadingWidget(),
                  )
                : CharacterWidget(character: sucessfulState!.characters[i]);
          } else {
            return i >= unSucessfulState!.characters.length
                ? Center(
                    child: CustomBaseText(title: unSucessfulState!.message),
                  ).addPadding(context,
                    edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 6))
                : CharacterWidget(character: unSucessfulState!.characters[i]);
          }
        },
      ),
    );
  }
}

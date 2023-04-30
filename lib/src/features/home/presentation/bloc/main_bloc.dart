// import 'package:casino_test/src/features/home/data/repository/characters_repository.dart';
import 'dart:async';

import 'package:casino_test/src/core/errors/failures.dart';
import 'package:casino_test/src/core/errors/logger.dart';
import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:casino_test/src/features/home/domain/usecase/get_all_characters.dart';
import 'package:casino_test/src/utils/ui/consts.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'main_event.dart';
import 'main_state.dart';

class MainPageBloc extends Cubit<MainPageState> {
  final GetAllCharacters _getAllCharacters;
  MainPageBloc(this._getAllCharacters) : super(InitialMainPageState());

//? ----------------------------------------------------------------
//* Variables
  int _currentPage = 1;
  bool _firstTimeToCallEndPoint = true;

  List<CharacterEntity> _characterEntityList = [];

  final ScrollController scrollController = ScrollController();

//? ----------------------------------------------------------------
//* Public methods
  Future getAllCharacters() async {
    final MainPageState? newState = _checkIfCurrentPageIsTheLastOne();
    if (newState != null) {
      emit(newState);
    }
    if (state is UnSuccessfulMainPageState) {
      return;
    }
    logInfo('getAllCharacters called');
    final Either<Failure, List<CharacterEntity>?> res =
        await _getAllCharacters(_currentPage);
    emit(_emitErrorOrSuccessfulState(res));
  }

  Future onRefreshCalled() async {
    _currentPage = 1;
    _firstTimeToCallEndPoint = true;
    _characterEntityList.clear();
    return getAllCharacters();
  }

  void setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        if (_currentPage >= 42) {
          return;
        }
        getAllCharacters();
      }
    });
  }

//? ----------------------------------------------------------------
//* Private methods
  MainPageState _emitErrorOrSuccessfulState(
      Either<Failure, List<CharacterEntity>?> res) {
    return res.fold((failure) {
      if (_characterEntityList.isEmpty) {
        Constants.showMessage(description: failure.message);
      } else {
        _jumpToMaxScrollExtent(scrollController);
      }
      return UnSuccessfulMainPageState(
          message: failure.message, characters: _characterEntityList);
    }, (characterEntity) {
      _characterEntityList = [..._characterEntityList, ...characterEntity!];
      return SuccessfulMainPageState(_characterEntityList, _currentPage >= 42);
    });
  }

  void _jumpToMaxScrollExtent(ScrollController scrollController) {
    Timer(const Duration(milliseconds: 30), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  MainPageState? _checkIfCurrentPageIsTheLastOne() {
    if (_currentPage < 42 && !_firstTimeToCallEndPoint) {
      _currentPage = _currentPage + 1;
      _jumpToMaxScrollExtent(scrollController);
      return null;
    } else {
      _firstTimeToCallEndPoint = false;
      return LoadingMainPageState();
    }
  }
}

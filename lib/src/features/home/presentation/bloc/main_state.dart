import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:equatable/equatable.dart';

abstract class MainPageState extends Equatable {}

class InitialMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class LoadingMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class UnSuccessfulMainPageState extends MainPageState {
  @override
  List<Object> get props => [];
}

class SuccessfulMainPageState extends MainPageState {
  final List<CharacterEntity> characters;

  SuccessfulMainPageState(this.characters);

  @override
  List<Object> get props => [characters];
}

import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:equatable/equatable.dart';

abstract class MainPageState extends Equatable {
  const MainPageState();

  @override
  List<Object> get props => [];
}

class InitialMainPageState extends MainPageState {}

class LoadingMainPageState extends MainPageState {}

class UnSuccessfulMainPageState extends MainPageState {
  final String message;
  final List<CharacterEntity> characters;
  const UnSuccessfulMainPageState({required this.message,required this.characters});
  @override
  List<Object> get props => [message,characters];
}

class SuccessfulMainPageState extends MainPageState {
  final List<CharacterEntity> characters;
  final bool hasReachedMax;
  const SuccessfulMainPageState(this.characters,this.hasReachedMax);

  @override
  List<Object> get props => [characters,hasReachedMax];
}

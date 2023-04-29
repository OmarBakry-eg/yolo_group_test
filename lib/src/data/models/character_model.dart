import 'package:casino_test/src/domain/entity/character_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends CharacterEntity {
  const CharacterModel(
      {super.status,
      super.species,
      super.type,
      super.gender,
      super.id,
      super.created,
      super.name,
      super.image});

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

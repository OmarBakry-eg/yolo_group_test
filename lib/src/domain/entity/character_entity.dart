import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String? name, image, status, species, type, gender;
  final int? id;
  final DateTime? created;

  const CharacterEntity(
      {this.status,
      this.species,
      this.type,
      this.gender,
      this.id,
      this.created,
      this.name,
      this.image});

  @override
  List<Object?> get props =>
      [status, species, type, gender, id, created, name, image];
}

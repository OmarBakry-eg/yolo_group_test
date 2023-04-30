import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:casino_test/src/features/home/presentation/widgets/character_widget.dart';
import 'package:flutter/material.dart';

class SuccessfulWidget extends StatelessWidget {
  final List<CharacterEntity> characters;

  const SuccessfulWidget({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: double.infinity,
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterWidget(character: characters[index]);
      },
    );
  }
}

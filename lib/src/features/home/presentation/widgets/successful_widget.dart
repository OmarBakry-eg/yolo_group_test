import 'package:casino_test/src/features/home/data/models/character_model.dart';
import 'package:casino_test/src/features/home/presentation/widgets/character_widget.dart';
import 'package:flutter/material.dart';

class SuccessfulWidget extends StatelessWidget {
  final List<CharacterModel> characters;

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

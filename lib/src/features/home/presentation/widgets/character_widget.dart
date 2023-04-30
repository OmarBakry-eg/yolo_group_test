import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final CharacterEntity character;
  const CharacterWidget({super.key,required this.character});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Color.fromARGB(120, 204, 255, 255),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(character.name!),
            ),
            Image.network(
              character.image!,
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:casino_test/src/features/home/domain/entity/character_entity.dart';
import 'package:casino_test/src/utils/base/custom_base_text.dart';
import 'package:casino_test/src/utils/ui/consts.dart';
import 'package:casino_test/src/utils/ui/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class CharacterWidget extends StatelessWidget {
  final CharacterEntity character;
  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
            character.image ?? Constants.notFoundImg),
        backgroundColor: MyColors.purpleColor,
        radius: 25,
      ),
      title: CustomBaseText(title: character.name),
      isThreeLine: true,
      subtitle: CustomBaseText(
        title:
            'Created At : ${character.created == null ? 'unknown' : intl.DateFormat.MEd().format(character.created!)}\nGender : ${character.gender?.toLowerCase() == 'unknown' ? '' : character.gender}',
        color: Colors.grey[500],
        fontSize: 13,
      ),
      trailing: CustomBaseText(
          title:
              '${character.status?.toLowerCase() == 'unknown' ? '' : character.status}\n${character.species?.toLowerCase() == 'unknown' ? '' : character.species}'),
    );
    // return Container(
    //   alignment: Alignment.topLeft,
    //   padding: EdgeInsets.all(8),
    //   child: Container(
    //     padding: const EdgeInsets.all(16),
    //     width: double.infinity,
    //     decoration: ShapeDecoration(
    //       color: Color.fromARGB(120, 204, 255, 255),
    //       shape: ContinuousRectangleBorder(
    //         borderRadius: BorderRadius.circular(32),
    //       ),
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.all(2.0),
    //           child: Text(character.name!),
    //         ),
    //         Image.network(
    //           character.image!,
    //           width: 50,
    //           height: 50,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

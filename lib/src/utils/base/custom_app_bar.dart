import 'package:casino_test/src/utils/ui/my_colors.dart';
import 'package:flutter/material.dart';
import 'custom_base_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle, automaticallyImplyLeading;
  final String? title;
  const CustomAppBar(
      {Key? key,
      this.centerTitle = false,
      this.automaticallyImplyLeading = true,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: MyColors.blackColor,
      title: CustomBaseText(title: title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

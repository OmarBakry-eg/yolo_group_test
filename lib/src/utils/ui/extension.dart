import 'package:flutter/material.dart';

extension Updates on Widget {
  Row addElementsInRow(BuildContext context, List<Widget> elements,
      {bool makeItLast = false}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: makeItLast ? [...elements, this] : [this, ...elements]);
  }
  Align addingAlign(BuildContext context,
      {required AlignmentGeometry alignmentGeometry}) {
    return Align(
      alignment: alignmentGeometry,
      child: this,
    );
  }

  Padding addPadding(BuildContext context,
      {required EdgeInsetsGeometry edgeInsetsGeometry}) {
    return Padding(
      padding: edgeInsetsGeometry,
      child: this,
    );
  }
}

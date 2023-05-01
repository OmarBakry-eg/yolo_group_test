import 'package:flutter/material.dart';

mixin Constants {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static const String notFoundImg =
      'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png';

  static Future<void> showLoading(
      {String? title, String? description, Function? onPressed}) async {
    return showDialog<void>(
      context: navigatorKey.currentContext!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  static void hideLoadingOrNavBack() => navigatorKey.currentState!.pop();

  static Future<dynamic> showMessage(
          {String? title,
          String? description,
          Function? onPressed,
          bool removeCancelButton = true}) async =>
      navigatorKey.currentContext == null
          ? const SizedBox.shrink()
          : showDialog<void>(
              context: navigatorKey.currentContext!,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(title ?? "Alert"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(description ?? "Error Occured"),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        if (onPressed != null) {
                          onPressed();
                        } else {
                          hideLoadingOrNavBack();
                        }
                      },
                    ),
                    removeCancelButton
                        ? const SizedBox.shrink()
                        : TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              hideLoadingOrNavBack();
                            },
                          ),
                  ],
                );
              },
            );
}

import 'package:flutter/material.dart';

mixin Constants {
  static final navigatorKey = GlobalKey<NavigatorState>();

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

  static Future<void> navigateTo(Widget screen,
          {bool pushReplacment = false,
          bool pushAndRemoveUntil = false}) async =>
      pushReplacment
          ? await Navigator.pushReplacement(navigatorKey.currentContext!,
              MaterialPageRoute(builder: (_) => screen))
          : pushAndRemoveUntil
              ? await Navigator.pushAndRemoveUntil(navigatorKey.currentContext!,
                  MaterialPageRoute(builder: (_) => screen), (r) => false)
              : await Navigator.push(navigatorKey.currentContext!,
                  MaterialPageRoute(builder: (_) => screen));

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

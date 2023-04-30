import 'package:casino_test/src/app.dart';
import 'package:flutter/material.dart';
import 'src/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.MainDIModule.init();
  runApp(const MyApp());
}

import 'package:flutter/material.dart';
import 'package:googlekeep/homepage.dart';
import 'package:googlekeep/model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(googleKeepAdapter().typeId)) {
    Hive.registerAdapter(googleKeepAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

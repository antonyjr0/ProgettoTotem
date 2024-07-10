import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progetto_totem/pages/splashscreen.dart';
import 'package:progetto_totem/services/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Utils.initCategories();
  await Utils.initItems();
  await Utils.initExtras();

  runApp(ProviderScope(child: const TotemApp()));
}

class TotemApp extends StatelessWidget {
  const TotemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Progetto Totem",
      home: Splashscreen(
        title: "Progetto Totem",
      ),
    );
  }
}

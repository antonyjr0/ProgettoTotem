import 'package:flutter/material.dart';
import 'package:progetto_totem/pages/splashscreen.dart';

void main(List<String> args) {
  runApp(const TotemApp());
}

class TotemApp extends StatelessWidget {
  const TotemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Progetto Totem",
      home: Splashscreen(title: "Progetto Totem"),
    );
  }
}

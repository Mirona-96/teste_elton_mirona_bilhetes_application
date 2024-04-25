
import 'package:flutter/material.dart';
import 'package:teste_elton_mirona_bilhetes_application/bilheteHome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BilheteHome(),
    );
  }
}

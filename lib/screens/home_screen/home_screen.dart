

import 'package:flutter/material.dart';
///Главный экран библиотеки приложения
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главный экран'), ),
      body: const Center(child: Text('Главнй экран')),
    );
  }
}
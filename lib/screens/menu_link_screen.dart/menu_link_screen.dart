

import 'package:flutter/material.dart';

class MenuLinkScreen extends StatelessWidget {
  const MenuLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Экран меню'),
      ),
      body: const Center(
        child: Text('Экран меню'),
      ),
    );
  }
}
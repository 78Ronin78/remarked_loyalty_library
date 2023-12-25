
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Моя карта'),

      ),
      body: const Center(
        child: Text('Моя карта'),
      ),
    );
  }
}
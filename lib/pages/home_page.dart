import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 3, child: Placeholder()),
              const SizedBox(height: 24),
              const Expanded(flex: 2, child: Placeholder()),
              const SizedBox(height: 24),
              const Expanded(flex: 2, child: Placeholder()),
            ],
          ),
        ),
      ),
    );
  }
}

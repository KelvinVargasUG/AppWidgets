import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/Presentation/Providers/counter_provider.dart';
import 'package:widgets_app/Presentation/Providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counterValue = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            'Valor: $counterValue',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state = 0;
              },
              child: const Icon(Icons.restart_alt, size: 40),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: const Icon(Icons.plus_one),
            ),
          ],
        ));
  }
}

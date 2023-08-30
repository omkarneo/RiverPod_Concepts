import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        actions: [
          Consumer(
            builder: (context, ref, child) => ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider).reset();
                },
                child: const Text("Reset")),
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  "Count is ${ref.watch(counterProvider).count}",
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, ref, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(60, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        ref.read(counterProvider).increment(1);
                      },
                      onLongPress: () {
                        ref.read(counterProvider).increment(10);
                      },
                      child: const Icon(Icons.add)),
                ),
                const SizedBox(
                  width: 50,
                ),
                Consumer(
                  builder: (context, ref, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(60, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        ref.read(counterProvider).decrement(1);
                      },
                      onLongPress: () {
                        ref.read(counterProvider).decrement(10);
                      },
                      child: const Icon(Icons.remove)),
                )
              ],
            )
          ]),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  var count = 0;
  void increment(int val) {
    count += val;
    notifyListeners();
  }

  void decrement(int val) {
    if (count > 0) {
      count -= val;
    }
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}

final counterProvider = ChangeNotifierProvider((ref) {
  return CounterProvider();
});

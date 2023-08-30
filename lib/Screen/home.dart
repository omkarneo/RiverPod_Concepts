import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_concept/Screen/counterapp.dart';
import 'package:riverpod_concept/Screen/statenotifierpro.dart';
import 'package:riverpod_concept/Screen/textfeidwithnormalpro.dart';

import 'apiriverpod.dart';
import 'apiwithfuturepro.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverPod"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer(builder: (context, ref, child) {
          return const Center(
            child: Text("Welcome to Riverpod App"),
          );
        }),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextNormalProvinRiverpod(),
                    ));
              },
              child: Text("Text with normal provider")),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApiRiverPod(),
                    ));
              },
              child: Text("Api with normal provide")),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApiRiverFuturePod(),
                    ));
              },
              child: Text("Api with Future provide")),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CounterApp(),
                    ));
              },
              child: const Text("Counter App")),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Statereiverpod(),
                    ));
              },
              child: const Text("State Notifier Provider")),
        ),
      ]),
    );
  }
}

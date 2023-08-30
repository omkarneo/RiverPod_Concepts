import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Statereiverpod extends StatefulWidget {
  const Statereiverpod({super.key});

  @override
  State<Statereiverpod> createState() => _StatereiverpodState();
}

class _StatereiverpodState extends State<Statereiverpod> {
  TextEditingController updatetext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StateNotifier')),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Consumer(builder: (context, ref, child) {
          var data = ref.watch(statenotprovider);
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${data[index]}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    ref.read(statenotprovider.notifier).remove(index);
                  },
                ),
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      updatetext.text = data[index];
                      return AlertDialog(
                        title: Text("Update Data"),
                        actions: [
                          TextFormField(
                            controller: updatetext,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(statenotprovider.notifier)
                                    .update(index, updatetext.text);
                                Navigator.pop(context);
                              },
                              child: Text("Update"))
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
        }),
      ),
      floatingActionButton: Consumer(
          builder: (context, ref, child) => FloatingActionButton(
              onPressed: () {
                ref
                    .read(statenotprovider.notifier)
                    .add("Hello${ref.watch(statenotprovider).length}");
              },
              child: const Icon(Icons.add))),
    );
  }
}

final statenotprovider = StateNotifierProvider<ListStateProvider, List>(
    (ref) => ListStateProvider());

class ListStateProvider extends StateNotifier<List> {
  ListStateProvider() : super([]);

  void add(data) {
    // state.add(data);
    state = [...state, data];
  }

  void remove(index) {
    // print(state[index]);
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }

  void update(index, data) {
    state[index] = data;
    state = [...state];
  }
}

// class 
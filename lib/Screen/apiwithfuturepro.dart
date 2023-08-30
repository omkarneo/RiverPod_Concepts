import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiRiverFuturePod extends StatelessWidget {
  const ApiRiverFuturePod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Example for Riverpod")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              if (ref.watch(futureProvider).value != null) {
                return SizedBox(
                  width: 1000,
                  height: MediaQuery.sizeOf(context).height - 90,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var data = ref.watch(futureProvider).value[index];
                      return ListTile(title: Text(data['API']));
                    },
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

final futureProvider = FutureProvider((ref) async {
  try {
    var res = await http.get(Uri.parse("https://api.publicapis.org/entries"));
    return json.decode(res.body)["entries"];
  } catch (err) {
    print(err);
  }
});

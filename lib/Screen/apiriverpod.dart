import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiRiverPod extends StatelessWidget {
  const ApiRiverPod({
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
              return FutureBuilder(
                  // initialData: [],
                  future: ref.watch(helloworldProvider),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: MediaQuery.sizeOf(context).height - 90,
                        width: 500,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data[index];
                            return ListTile(
                              title: Text("${data['API']}"),
                              subtitle: Text("${data['Description']}"),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  });
            },
          ),
        ],
      ),
    );
  }
}

final helloworldProvider = Provider((ref) async {
  try {
    var res = await http.get(Uri.parse("https://api.publicapis.org/entries"));
    print(res);
    return json.decode(res.body)["entries"];
  } catch (err) {
    print(err);
  }
});

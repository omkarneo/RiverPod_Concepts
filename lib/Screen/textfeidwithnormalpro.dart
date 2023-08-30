import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextNormalProvinRiverpod extends StatefulWidget {
  const TextNormalProvinRiverpod({super.key});

  @override
  State<TextNormalProvinRiverpod> createState() =>
      _TextNormalProvinRiverpodState();
}

class _TextNormalProvinRiverpodState extends State<TextNormalProvinRiverpod> {
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text with normal provider"),
      ),
      body: Column(children: [
        Consumer(
          builder: (context, ref, child) {
            return Text(ref.watch(TextProvider).data);
          },
        ),
        Consumer(
          builder: (context, ref, child) => TextFormField(
            controller: text,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            onChanged: (value) {
              ref.read(TextProvider).datachange(text.text);
            },
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
                onPressed: () {
                  ref.read(TextProvider).datachange(text.text);
                },
                child: const Text("Submit"));
          },
        )
      ]),
    );
  }
}

class textprovider extends ChangeNotifier {
  var data = "";
  void datachange(val) {
    data = val;
    notifyListeners();
  }
}

final TextProvider = ChangeNotifierProvider((ref) {
  return textprovider();
});

import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/keys.dart';

// import 'package:flutter_internals/ui_updates_demo.dart';

void main() {
  final mutatable = [1, 2, 3];
  mutatable.add(4);
  // mutatable = [1,2,3,4,5]; // can not reassign

  const _unmodifiable = [1, 2, 3];
  // unmodifiable.add(4); // shows run time error

  var reassignable = [1, 2, 3];
  reassignable.add(4);
  reassignable = [4, 3, 2, 1];

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Internals'),
          ),
          // body: const UIUpdatesDemo(),
          body: const Keys()),
    );
  }
}

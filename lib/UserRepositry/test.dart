import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class TestScreen extends ConsumerStatefulWidget {
  TestScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TestScreen();
  }
}

class _TestScreen extends ConsumerState<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("TestScreen"),
      ),
    );
  }
}

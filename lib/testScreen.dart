import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestScreenRE extends ConsumerStatefulWidget {
  TestScreenRE({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TestScreenRe();
  }
}

class _TestScreenRe extends ConsumerState<TestScreenRE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Ayush ke ma")],
        ),
      ),
    );
  }
}

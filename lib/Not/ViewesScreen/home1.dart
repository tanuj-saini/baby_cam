import 'package:baby_cam/UserContoller/userContoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen1 extends ConsumerStatefulWidget {
  final String camerUid;
  HomeScreen1({required this.camerUid, super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreen1();
  }
}

class _HomeScreen1 extends ConsumerState<HomeScreen1> {
  void updateUidofUser() async {
    ref
        .watch(authContoller)
        .updateUserId(context: context, CameraUid: widget.camerUid);
  }

  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                updateUidofUser();
              },
              child: Text('Start'))
        ],
      ),
    );
  }
}

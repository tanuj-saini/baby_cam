import 'package:baby_cam/UserContoller/userContoller.dart';
import 'package:baby_cam/Not/UserUI/LoderScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreScreen extends ConsumerStatefulWidget {
  final String cameruid;
  MoreScreen({required this.cameruid, super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MoreScreen();
  }
}

class _MoreScreen extends ConsumerState<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref
          .watch(authContoller)
          .getUserModel(CameraUid: widget.cameruid, context: context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoderScreen();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(snapshot.data!.name),
              Text(snapshot.data!.email),
              Divider(
                color: Colors.white,
              ),
              Text('Camera'),
              ListTile(
                leading: Icon(Icons.swap_horiz),
                title: Text('Switch to Camera'),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Moments'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Viewer Settings'),
              )
            ],
          ),
        );
      },
    );
  }
}

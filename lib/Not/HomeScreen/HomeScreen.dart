import 'package:baby_cam/Not/CameraScreen/CameraScreen.dart';
import 'package:baby_cam/Not/More/ExploreScreen/exploreScreen.dart';
import 'package:baby_cam/Not/More/MoreScreen.dart';
import 'package:baby_cam/Not/Perminum/premium.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final String uuid;

  HomeScreen({required this.uuid, super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  String _selectedMode = 'Viewer';
  void onSelectMode(String mode) {
    if (mode == 'Viewer') {
//function on viewer
    } else {
      //function on camera
    }
    setState(() {
      _selectedMode = mode;
    });
  }

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      CameraSceen(source: _selectedMode, camerUid: widget.uuid),
      ExploreScreen(),
      Premium(),
      MoreScreen(
        cameruid: widget.uuid,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          _currentIndex == 0
              ? DropdownButton<String>(
                  value: _selectedMode,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (value) {
                    setState(() {
                      _selectedMode = value!; // Update selected mode
                    });
                  },
                  items: <String>['Viewer', 'Camera']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              : _currentIndex == 1
                  ? Text('Explore')
                  : _currentIndex == 2
                      ? Text('Premium')
                      : Text('More'),
          SizedBox(width: 16),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // Ensures all tabs are shown
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Premium',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

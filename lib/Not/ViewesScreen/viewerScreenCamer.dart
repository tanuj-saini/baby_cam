import 'package:baby_cam/Not/More/ExploreScreen/exploreScreen.dart';
import 'package:baby_cam/Not/More/MoreScreen.dart';
import 'package:baby_cam/UserContoller/userContoller.dart';
import 'package:baby_cam/UserRepositry/userRepo.dart';
import 'package:baby_cam/Not/ViewesScreen/home1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class viewerCamera extends ConsumerStatefulWidget {
  final String camerUid;
  final String viewerUid;
  viewerCamera({required this.camerUid, required this.viewerUid, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _viewerCamera();
  }
}

class _viewerCamera extends ConsumerState<viewerCamera> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      body: Center(
        child: _buildPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildPage(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return HomeScreen1(
          camerUid: widget.camerUid,
        );
      case 1:
        return ExploreScreen();
      case 2:
        return MoreScreen(
          cameruid: widget.camerUid,
        );
      default:
        return HomeScreen1(
          camerUid: widget.camerUid,
        );
    }
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class viewerCameraScreen extends ConsumerStatefulWidget{
//   viewerCameraScreen({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() {
//     return _viewerCameraScreen();
//   }
// }
// class _viewerCameraScreen extends ConsumerState<viewerCameraScreen>{
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold();
//   }
// }



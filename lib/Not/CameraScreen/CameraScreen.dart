import 'package:baby_cam/UserContoller/userContoller.dart';
import 'package:baby_cam/main.dart';
import 'package:camera/camera.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_recording/flutter_screen_recording.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class CameraSceen extends ConsumerStatefulWidget {
  final String camerUid;
  final String source;
  CameraSceen({required this.camerUid, required this.source, super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CameraScreen();
  }
}

class _CameraScreen extends ConsumerState<CameraSceen> {
  final dataRef = FirebaseDatabase.instance.ref("Recording");
  bool isRecording = false;
  void startRecording() async {
    try {
      await FlutterScreenRecording.startRecordScreen("custom-title");
      setState(() {
        isRecording = true;
      });
    } catch (e) {
      print("Error starting recording: $e");
    }
  }

  void storeRecording(String path) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    dataRef.push().set({
      'path': path,
      'width': screenWidth.toInt(),
      'height': screenHeight.toInt(),
      // Other metadata if needed
    });
  }

  void stopRecording() async {
    try {
      String path = await FlutterScreenRecording.stopRecordScreen;
      storeRecording(path);
      setState(() {
        isRecording = false;
      });
    } catch (e) {
      print("Error stopping recording: $e");
    }
  }

  final TextEditingController idController = TextEditingController();
  CameraImage? cameraImage;
  CameraController? cameraController;
  var camerCount = 0;
  String output = '';
  var x, y, w, h = 0.0;
  var label = '';

  loadCamera() {
    cameraController =
        CameraController(cameras![0], ResolutionPreset.ultraHigh);
    cameraController!.initialize();
  }

  void checkCameraId({required String CamereUId}) async {
    ref
        .watch(authContoller)
        .checlCamerId(context: context, CamereUId: CamereUId);
  }



  void StartStreamCamera() async {
    ref.watch(authContoller).makeAcameraContoller(
        isTalk: false,
        isFalsLight: false,
        isSwitch: false,
        context: context,
        usersToCamera: []);
  }

  @override
  void initState() {
    loadCamera();

    // initTflite();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.camerUid);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            widget.source == 'Camera'
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      CameraPreview(cameraController!),
                      Column(
                        children: [
                          Text(
                            widget.camerUid,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                StartStreamCamera();
                              },
                              child: Text('Start Stream'),
                            ),
                            if (!isRecording)
                              ElevatedButton(
                                onPressed: startRecording,
                                child: Text('Start Recording'),
                              ),
                            if (isRecording)
                              ElevatedButton(
                                onPressed: stopRecording,
                                child: Text('Stop Recording'),
                              ),
                          ],
                        ),
                      ),
                    ]),
                  )
                : Column(
                    children: [
                      TextFormField(
                        controller: idController,
                        decoration: InputDecoration(
                            hintText: 'Enter Id of Camera',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            checkCameraId(CamereUId: idController.text);
                          },
                          icon: Icon(Icons.check_box),
                          label: Text('Enter')),
                    ],
                  ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

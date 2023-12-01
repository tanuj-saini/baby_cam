import 'package:baby_cam/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class CameraSceen extends ConsumerStatefulWidget {
  CameraSceen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CameraScreen();
  }
}

class _CameraScreen extends ConsumerState<CameraSceen> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  var camerCount = 0;
  String output = '';
  var x, y, w, h = 0.0;
  var label = '';
  loadCamera() {
    cameraController =
        CameraController(cameras![0], ResolutionPreset.ultraHigh);
    cameraController!.initialize().then((value) {
      camerCount++;
      if (!mounted) {
        return;
      } else {
        camerCount = 0;
        setState(() {
          cameraController!.startImageStream((imageStream) {
            if (camerCount % 10 == 0) {
              camerCount = 0;
              objectDetaction(imageStream);
            }
          });
        });
      }
    });
  }

  initTflite() async {
    await Tflite.loadModel(
        model: 'assets/mobilenet_v1_1.0_224.tflite',
        labels: 'assets/mobilenet_v1_1.0_224.txt',
        isAsset: true,
        numThreads: 1,
        useGpuDelegate: false);
  }

  objectDetaction(CameraImage image) async {
    var detector = await Tflite.runModelOnFrame(
      bytesList: image.planes.map((e) {
        return e.bytes;
      }).toList(),
      asynch: true,
      imageHeight: image.height,
      imageMean: 127.5,
      imageStd: 127.5,
      imageWidth: image.width,
      numResults: 1,
      rotation: 90,
      threshold: 0.4,
    );
    if (detector != null) {
      print(
          " Id love to join in on a hackathon like Hack This Fall 4.0! Collaborating with innovative minds, solving problems, and creating something new is incredibly exciting. Plus, hackathons provide a fantastic opportunity to learn, grow, and apply my skills in a dynamic and creative environment. The chance to contribute to innovative projects and be part of a team that's passionate about making a difference is a big motivation for me!jljfdskjdfkjdskljfj$detector");
      // if (detc['confidenceInClass'] * 100 > 45) {
      //   label = detc['label'].toString();
      //   h = detc['rect']['h'];
      //   w = detc['rect']['w'];
      //   x = detc['rect']['x'];
      //   y = detc['rect']['y'];
      // }
    }
  }

  @override
  void initState() {
    loadCamera();
    initTflite();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: !cameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                        aspectRatio: cameraController!.value.aspectRatio,
                        child: Stack(children: [
                          CameraPreview(cameraController!),
                          // Positioned(
                          //   top: y * 700,
                          //   right: x * 500,
                          //   child:
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: Colors.green, width: 4)),
                            child: Column(
                              children: [Text('fds')],
                            ),
                          )
                        ]),
                      ))
          ],
        ),
      ),
    );
  }
}

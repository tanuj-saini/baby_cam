import 'package:baby_cam/Loginn.dart';
import 'package:baby_cam/Not/HomeScreen/HomeScreen.dart';
import 'package:baby_cam/UserContoller/userContoller.dart';
import 'package:baby_cam/Not/UserUI/LoderScreen.dart';
import 'package:baby_cam/Not/UserUI/Login.dart';
import 'package:baby_cam/UserRepositry/test.dart';
import 'package:baby_cam/welcomescreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Not/firebase_options.dart';

List<CameraDescription>? cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ref.watch(USerDetailsFormain).when(
            data: (data) {
              if (data == null) {
                return WelcomeScreen();
              }
              return TestScreen();
            },
            error: (e, trace) {
              print(e.toString());
            },
            loading: () => LoderScreen()));
  }
}

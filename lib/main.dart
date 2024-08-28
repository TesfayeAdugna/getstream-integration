import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/app/splash_screen/splash_screen.dart';
import 'package:flutter_application_1/features/user_auth/presentation/pages/login.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

void main() async {

  
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyAVZzSyONeR2y0sYiBqajCZuVu5GSxpiwE",
      projectId: "video-conference-85302",
      messagingSenderId: "936301959944",
      appId: "1:936301959944:web:bae36c0ccb20bd462e6abd",
    ));
  }
  firebase_auth.User? firebaseUser = firebase_auth.FirebaseAuth.instance.currentUser;
  final client = StreamVideo(
    'mmhfdzb5evj2',
    user: User.regular(
      userId: firebaseUser!.uid,
      role: 'admin',
      name: firebaseUser.displayName,
    ),
    userToken:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiRGFydGhfTmloaWx1cyIsImlzcyI6Imh0dHBzOi8vcHJvbnRvLmdldHN0cmVhbS5pbyIsInN1YiI6InVzZXIvRGFydGhfTmloaWx1cyIsImlhdCI6MTcyNDE1ODM0MywiZXhwIjoxNzI0NzYzMTQ4fQ.DtPFdqKgUQhTwJUjc1z67M-Mr57AQ-TKbjW8gGP7fwY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video call app',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: 
      SplashScreeen(child: LoginPage(),),
    );
  }
}

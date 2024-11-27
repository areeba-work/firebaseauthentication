import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauthapp/pages/signin.dart';
import 'package:firebaseauthapp/pages/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB7y-e_YvOA0E_l60IKuN3nqPriIxMIiZQ",
            projectId: "task44-89a96",
            messagingSenderId: "1052266198055",
            appId: "1:1052266198055:web:040fedc4179470b7278a02",
        ));
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: (const LoginScreen()),
    );
  }
}

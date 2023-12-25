import 'package:atiktoplama/Firebase/Login.dart';
import 'package:atiktoplama/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Menu/Homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atık Nakit',
      initialRoute: splashPage.routeName,
      routes: {
        splashPage.routeName: (context) => splashPage(),
        loginPage.routeName: (context) => loginPage(),
        HomePage.routeName: (context) => HomePage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const splashPage(),
    );
  }

}
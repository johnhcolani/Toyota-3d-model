import 'package:flutter/material.dart';
import 'package:toyota_3d_model/Screens/my_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        textTheme:  TextTheme(
          titleLarge: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 64,fontWeight: FontWeight.bold,height: 1),
          titleMedium: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,height: 1),
          bodyLarge: TextStyle(color: Colors.red.withOpacity(0.8),fontSize: 32,fontWeight: FontWeight.bold,),
          bodyMedium: const TextStyle(color: Colors.black),
          bodySmall: const TextStyle(color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,

      home: MyHomeScreen(),
    );
  }
}


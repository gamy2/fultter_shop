import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // MyApp({super.key});  // defult constructor
  // String theme = 'dark';

  const MyApp._internal(); // named constructor

  static final MyApp _instance =
      MyApp._internal(); // single instance (singleton)

  // return the same instance every time the class is called under name off MyApp
  factory MyApp() {
    return _instance;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Placeholder(),
    );
  }
}

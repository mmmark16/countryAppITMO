import 'package:educational_practice/page/home_page.dart';
import 'package:educational_practice/services.dart';
import 'package:flutter/material.dart';
import 'global.dart';

void main() async {
  await getPerson1();
  await getPerson2();
  combineList();

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: isBlack
            ? TextTheme(
                headline1: TextStyle(fontSize: 16, color: Colors.white),
                headline2: TextStyle(fontSize: 24, color: Colors.white),
              )
            : TextTheme(
                headline1: TextStyle(fontSize: 16, color: Colors.black),
                headline2: TextStyle(fontSize: 24, color: Colors.black)),
      ),
      home: const MyHomePage(title: 'Список работников'),
    );
  }
}

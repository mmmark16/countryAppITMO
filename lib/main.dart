import 'package:educational_practice/page/home_page.dart';
import 'package:educational_practice/services.dart';
import 'package:flutter/material.dart';
import 'global.dart';

void main () async {
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
      ),
      home: const MyHomePage(title: 'Список работников'),
    );
  }
}

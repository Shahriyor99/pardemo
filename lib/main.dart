import 'package:flutter/material.dart';
import 'package:pardemo/pages/detail_page.dart';
import 'package:pardemo/pages/home_page.dart';
import 'package:pardemo/pages/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context)=>const HomePage(),
        DetailPage.id: (context)=>const DetailPage(),
        TestPage.id: (context) => const TestPage(),
      },
    );
  }
}
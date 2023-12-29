// your_project_name.dart
import 'package:flutter/material.dart';
import 'homescreen.dart';

class DataCon extends StatelessWidget {
  const DataCon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataCon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'DataCon'),
    );
  }
}

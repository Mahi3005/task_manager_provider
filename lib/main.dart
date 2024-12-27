import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:task_manager/task_manager.dart';

import 'package:task_manager/task_provider.dart'; // Your TaskManager file

void main() {
  runApp(
    // Wrap your app with ChangeNotifierProvider to provide TaskManager
    ChangeNotifierProvider(
      create: (context) => TaskProvider(), // Initialize your TaskProvider here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskManager(), // The widget that will access the TaskProvider
    );
  }
}

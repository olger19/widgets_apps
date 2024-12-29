import 'package:flutter/material.dart';
import 'package:widgets_apps/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

// git checkout -- . (Recuperar mi proyecto del commit anterior)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 8).getTheme(),
      home: const Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

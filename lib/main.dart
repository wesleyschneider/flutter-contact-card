import 'package:flutter/material.dart';

import './pages/Home/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Card',
      home: Home(),
    );
  }
}

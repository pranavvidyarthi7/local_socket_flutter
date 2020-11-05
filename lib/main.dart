import 'package:flutter/material.dart';
import 'package:socket/JSClient.dart';
import 'package:socket/PyClient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PyClient();
    //or
    // return JSClient();
  }
}

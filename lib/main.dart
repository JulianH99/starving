import 'package:flutter/material.dart';
import 'package:starving/pages/home.dart';
import 'package:starving/theme.dart';

void main() => runApp(StarvingApp());

class StarvingApp extends StatefulWidget {
  StarvingApp({Key key}) : super(key: key);

  @override
  _StarvingAppState createState() => _StarvingAppState();
}

class _StarvingAppState extends State<StarvingApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: starvingTheme(context),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

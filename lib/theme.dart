
import 'package:flutter/material.dart';

ThemeData starvingTheme(BuildContext context){
  return ThemeData(
    primaryColor: Colors.grey[850],
    accentColor: Colors.blue[400],
    textTheme: TextTheme(display1: Theme.of(context).textTheme.display1.copyWith(
      fontWeight: FontWeight.w900,
      color: Colors.black
    ))
  );
}
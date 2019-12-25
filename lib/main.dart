import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starving/bloc/food/bloc.dart';
import 'package:starving/pages/home.dart';
import 'package:starving/services/foods.dart';
import 'package:starving/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final FoodService foodService = FoodService();

  runApp(StarvingApp(foodService: foodService));
}

class StarvingApp extends StatefulWidget {
  final FoodService foodService;
  StarvingApp({Key key, @required this.foodService}) : super(key: key);

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
        home: BlocProvider<FoodBloc>(
          create: (context) => FoodBloc(widget.foodService),
          child: Home(),
        ),
      ),
    );
  }
}

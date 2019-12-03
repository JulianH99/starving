import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:starving/bloc/food_bloc.dart';
import 'package:starving/models/food.dart';
import 'package:starving/widgets/food_tile.dart';

class MyItemsPage extends StatefulWidget {
  MyItemsPage({Key key}) : super(key: key);

  @override
  _MyItemsPageState createState() => _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<FoodBloc>(context);
    bloc.getFoods();
    return Container(
      width: size.width,
      height: size.height,
      child: StreamBuilder<List<Food>>(
        stream: bloc.foods,
        initialData: [],
        builder: (context, snap) {
          print("from snap");
          print(snap.data);
          return Container(
            width: size.width - 10,
            height: size.height / 2,
            constraints: BoxConstraints(
                minWidth: size.width - 10, minHeight: size.height / 2),
            child: ListView(
              children: snap.data.map((f) {
                return FoodTile(food: f,);
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

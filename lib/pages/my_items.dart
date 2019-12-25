import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starving/bloc/food/bloc.dart';
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
    BlocProvider.of<FoodBloc>(context).add(GetFoods());
    return Container(
      width: size.width,
      height: size.height,
      child: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is FoodLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FoodItemsLoaded) {
            return Container(
              width: size.width - 10,
              height: size.height / 2,
              constraints: BoxConstraints(
                  minWidth: size.width - 10, minHeight: size.height / 2),
              child: ListView(
                children: state.foods.map((f) {
                  return FoodTile(
                    food: f,
                  );
                }).toList(),
              ),
            );
          }

          return Center(
            child: Text("No hay comidas agregadas"),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starving/bloc/food/bloc.dart';

import 'package:starving/models/food.dart';
import 'package:starving/pages/add_food.dart';
import 'package:starving/pages/generator.dart';
import 'package:starving/pages/my_items.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  final List<Widget> _views = [GeneratorPage(), MyItemsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          Food food = await Navigator.of(context).push(MaterialPageRoute<Food>(
              builder: (BuildContext context) {
                return AddFoodDialog();
              },
              fullscreenDialog: true));
          if (food != null) {
            BlocProvider.of<FoodBloc>(context).add(AddFood(food));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Starving"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: _views[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              title: Text("My items"), icon: Icon(Icons.list))
        ],
      ),
    );
  }
}

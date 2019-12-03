import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:starving/bloc/food_bloc.dart';
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
  final _bloc = FoodBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          Food food = await Navigator.of(context).push(MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return AddFoodDialog();
              },
              fullscreenDialog: true));
          await _bloc.addFood(food);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Starving"),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocProvider<FoodBloc>(
        creator: (_context, _bag) => _bloc,
        child: SafeArea(
          child: _views[_currentIndex],
        ),
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

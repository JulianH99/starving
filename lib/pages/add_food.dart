import 'package:flutter/material.dart';
import 'package:starving/bloc/food_bloc.dart';
import 'package:starving/models/food.dart';
import 'package:starving/models/food_type.dart';

class AddFoodDialog extends StatefulWidget {
  AddFoodDialog({Key key}) : super(key: key);

  @override
  _AddFoodDialogState createState() => _AddFoodDialogState();
}

class _AddFoodDialogState extends State<AddFoodDialog> {
  final _key = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agrega una comida"),
        actions: <Widget>[
          FlatButton(
            child: Text("Guardar".toUpperCase()),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .pop(Food(name: "", foodType: FoodType.Primary));
            },
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          autovalidate: false,
          key: _key,
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (text) {
                    if (text.isEmpty) {
                      return "El nombre no puede ser vacío";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:starving/models/food.dart';
import 'package:starving/models/food_type.dart';
import 'package:starving/extensions/capitalize.dart';

class AddFoodDialog extends StatefulWidget {
  AddFoodDialog({Key key}) : super(key: key);

  @override
  _AddFoodDialogState createState() => _AddFoodDialogState();
}

class _AddFoodDialogState extends State<AddFoodDialog> {
  final _key = GlobalKey<FormState>();

  String foodName;
  FoodType foodType;

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
              Navigator.of(context).pop<Food>(
                  Food(name: foodName.capitalize(), foodType: foodType));
            },
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          autovalidate: true,
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

                    foodName = text;
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
                  height: 40,
                ),
                DropdownButton(
                  isExpanded: true,
                  value: foodType,
                  hint: Text("Selecciona un tipo de comida"),
                  items: FoodType.values.map((FoodType value) {
                    return new DropdownMenuItem<FoodType>(
                      value: value,
                      child: new Text(getTextFromType(value)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {});
                    foodType = value;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

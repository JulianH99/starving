import 'package:flutter/material.dart';
import 'package:starving/widgets/food_icon.dart';

class FoodRecomentadion extends StatelessWidget {
  final String primaryFood;
  final String secondaryFood;
  final String optionalFood;

  const FoodRecomentadion(
      {Key key,
      @required this.primaryFood,
      @required this.secondaryFood,
      @required this.optionalFood})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Text(
            primaryFood,
            textAlign: TextAlign.center,
            style: foodStyle,
          ),
          SizedBox(
            height: 20,
          ),
          FoodIcon(customIcon: Icons.add),
          SizedBox(
            height: 20,
          ),
          Text(
            secondaryFood,
            textAlign: TextAlign.center,
            style: foodStyle,
          ),
          SizedBox(
            height: 20,
          ),
          FoodIcon(customIcon: Icons.add),
          SizedBox(
            height: 20,
          ),
          Text(
            optionalFood,
            textAlign: TextAlign.center,
            style: foodStyle,
          )
        ],
      ),
    );
  }
}

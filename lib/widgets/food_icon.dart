import 'package:flutter/material.dart';

class FoodIcon extends StatelessWidget {
  final IconData customIcon;

  const FoodIcon({Key key, @required this.customIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(200))),
      child: Icon(
        customIcon,
        color: Colors.white,
      ),
    );
  }
}

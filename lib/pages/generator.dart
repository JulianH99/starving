import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:starving/bloc/food_bloc.dart';
import 'package:starving/models/food_type.dart';
import 'package:starving/widgets/food_icon.dart';
import 'package:starving/widgets/food_recomendation.dart';

class GeneratorPage extends StatefulWidget {
  GeneratorPage({Key key}) : super(key: key);

  @override
  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FoodBloc>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      child: StreamBuilder(
        stream: bloc.recomendations,
        initialData: {},
        builder: (context, snap) {
          if (snap.hasData && snap.data.isNotEmpty) {
            return Container(
              width: size.width,
              height: size.height,
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    padding: EdgeInsets.all(15),
                    
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "¿Qué comeremos mañana?".toUpperCase(),
                      style: Theme.of(context).textTheme.button.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      bloc.getRecomendations();
                    },
                  ),
                  FoodRecomentadion(
                    optionalFood: snap.data[FoodType.Optional].name,
                    primaryFood: snap.data[FoodType.Primary].name,
                    secondaryFood: snap.data[FoodType.Secondary].name,
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: MaterialButton(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "¿Qué comeremos mañana?".toUpperCase(),
                  style: Theme.of(context).textTheme.button.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  bloc.getRecomendations();
                },
              ),
            );
          }
        },
      ),
    );
  }
}

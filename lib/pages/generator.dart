import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starving/bloc/food/bloc.dart';
import 'package:starving/models/food_type.dart';
import 'package:starving/widgets/food_recomendation.dart';

class GeneratorPage extends StatefulWidget {
  GeneratorPage({Key key}) : super(key: key);

  @override
  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(20),
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  BlocProvider.of<FoodBloc>(context).add(GenerateFood());
                },
              ),
              BlocBuilder<FoodBloc, FoodState>(
                builder: (context, state) {
                  if (state is FoodLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is FoodGenerated) {
                    return FoodRecomentadion(
                      optionalFood:
                          state.recomendations[FoodType.Optional].name,
                      primaryFood: state.recomendations[FoodType.Primary].name,
                      secondaryFood:
                          state.recomendations[FoodType.Secondary].name,
                    );
                  }

                  return Container();
                },
              )
            ],
          ),
        ));
  }
}

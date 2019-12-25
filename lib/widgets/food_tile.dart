import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:starving/bloc/food_bloc.dart';
import 'package:starving/models/food.dart';
import 'package:starving/models/food_type.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({Key key, @required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FoodBloc>(context);
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: food.getColorFromType(),
            borderRadius: BorderRadius.circular(100)),
      ),
      title: Text(food.name),
      subtitle: Text(getTextFromType(food.foodType)),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          bloc.deleteFood(food.id);
        },
      ),
    );
    // return Card(
    //     elevation: 0,
    //     child: InkWell(
    //       onTap: () {},
    //       child: Container(
    //         padding: EdgeInsets.all(15),
    //         child: Row(
    //           children: <Widget>[
    //             Container(
    //               width: 30,
    //               height: 30,
    //               decoration: BoxDecoration(
    //                   color: food.getColorFromType(),
    //                   borderRadius: BorderRadius.circular(100)),
    //             ),
    //             SizedBox(
    //               width: 20,
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Text(
    //                   food.name,
    //                   style: TextStyle(fontSize: 20),
    //                 ),
    //                 SizedBox(height: 5,),
    //                 Text(
    //                   food.getTextFromType(),
    //                   style: Theme.of(context).textTheme.subtitle.copyWith(
    //                     color: Colors.grey[700]
    //                   ),
    //                 )
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     ));
  }
}

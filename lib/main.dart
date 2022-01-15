import 'package:flutter/material.dart';
import 'package:cubit/cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:resturant_order/redux/app_state.dart';
import 'package:resturant_order/redux/reducer.dart';
import 'package:resturant_order/redux/redux_screen.dart';
import 'model/drink.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget{




  final Store<AppState> _store = Store<AppState>(
    updateDrinksReducer,
    initialState: AppState(
          drinks: [
            Drink("Water" , false),
            Drink("Cooka cola" , false),
            Drink("pepsi" , false),
            Drink("limonad" , false),
            Drink("joice" , false),
          ]
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redux solution - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      home: StoreProvider<AppState>(
        store: _store,
        child: ReduxScreen(),
      ),
    );
  }

}
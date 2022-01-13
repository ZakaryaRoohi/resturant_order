import 'package:flutter/material.dart';
import 'package:cubit/cubit.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:resturant_order/cubit/cubit_observer.dart';
import 'package:resturant_order/cubit/drinks_cubit.dart';
void main() {

  Cubit.observer = MainCubitObserver();
  runApp( MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Resturant Menu',
      theme: ThemeData.light().copyWith(primaryColor: const Color(0xFFe13133)),
      /// here can use MultiCubitProvider
      home: CubitProvider(
        create: (context) =>DrinksCubit() ,
        child: CheckBoxCubitScreen(),
      ),

    );
  }
}
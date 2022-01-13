

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturant_order/helper/decoration.dart';
import 'package:resturant_order/model/drink.dart';

class CheckBoxSetStateScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CheckBoxSetStateScreenState();


}
class _CheckBoxSetStateScreenState extends State<CheckBoxSetStateScreen>{

  List<Drink> drinks = [
    Drink("Water" , false),
    Drink("Cooka cola" , false),
    Drink("pepsi" , false),
    Drink("limonad" , false),
    Drink("joice" , false),
  ];

  @override
  Widget build(BuildContext context) {

    var selectedDrinks = drinks.where((element) => element.selected);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
      ),
      body: Container(
        decoration: mainBackgroundImage,


      ),
    );
  }

}
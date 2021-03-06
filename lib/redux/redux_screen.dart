

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:resturant_order/helper/decoration.dart';
import 'package:resturant_order/model/drink.dart';
import 'package:resturant_order/redux/actions.dart';
import 'package:resturant_order/redux/app_state.dart';
import 'package:resturant_order/widget/drinks_widget.dart';



class ReduxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blue Bird Restaurant"),
      ),
      body: Container(
        decoration: mainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: whiteBackground,
              child: StoreConnector<AppState, List<Drink>>(
                converter: (store) => store.state.drinks,
                builder: (context, List<Drink> allDrinks) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drinks tonight",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    ...allDrinks
                        .map(
                          (drink) => DrinksWidget(
                        drink: drink,
                        onChanged: (value) {
                          StoreProvider.of<AppState>(context).dispatch(
                            UpdateDrinkAction(drink),
                          );
                        },
                      ),
                    )
                        .toList(),
                    Text(
                      "The order is: ",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            allDrinks
                                .where((element) => element.selected)
                                .toList()[index]
                                .name,
                          ),
                        ),
                        itemCount: allDrinks
                            .where((element) => element.selected)
                            .length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


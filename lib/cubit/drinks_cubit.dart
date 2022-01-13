

import 'package:resturant_order/model/drink.dart';
import 'package:cubit/cubit.dart';

class DrinksCubit extends Cubit<List<Drink>>{

  DrinksCubit() : super([
    Drink("Water" , false),
    Drink("Cooka cola" , false),
    Drink("pepsi" , false),
    Drink("limonad" , false),
    Drink("joice" , false),
  ]);

  @override
  void onTransition(Transition<List<Drink>> transition) {
    print("transition DrinkCubit $transition");
    super.onTransition(transition);
  }


}
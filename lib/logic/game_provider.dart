import 'package:flutter/cupertino.dart';
import 'package:memory_game/logic/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider extends ChangeNotifier{


  GameProvider(){
      laodMoneyValue();
  }

  int? money  ;
  late  SharedPreferences sharedPreferences ;
  void addMoney(int value)async {
    if (money == null) money = 0 ;
    sharedPreferences = await SharedPreferences.getInstance();

    money = money! + value ;
    sharedPreferences.setInt(
        sharedMoney,money!);
    notifyListeners();
  }

  void declineMoney(int value)async {
    if (money == null) money = 0 ;
    sharedPreferences = await SharedPreferences.getInstance();

    money = money!  - value ;
    sharedPreferences.setInt(
        sharedMoney,money!);

    notifyListeners();
  }

  void saveMoneyValue()async{
    sharedPreferences.setInt(
        sharedMoney,money!);
  }
//load in inite
  Future laodMoneyValue()async{
    if (money ==null ){
    sharedPreferences = await SharedPreferences.getInstance();
    money = sharedPreferences.getInt(sharedMoney) ?? 0;
  notifyListeners() ;
   }}
}
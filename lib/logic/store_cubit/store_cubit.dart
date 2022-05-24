import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../values.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(Init());
  int money = 0 ;
  late  SharedPreferences sharedPreferences ;
  void addMoney(int value){
    money = money + value ;

  }

  void declineMoney(int value){
    money = money - value ;
   }

  void saveMoneyValue()async{
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(
        sharedMoney,money );
  }
//load in inite
  Future laodMoneyValue()async{
    sharedPreferences = await SharedPreferences.getInstance();
    money = sharedPreferences.getInt(sharedMoney) ?? 0;
emit(LoadMony());
  }
}

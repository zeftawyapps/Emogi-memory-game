


import 'package:memory_game/logic/mylibs/jsonManger.dart';
import 'package:memory_game/logic/mylibs/modulscreateor.dart';
import 'package:memory_game/logic/mylibs/stagesmodule.dart';
import 'package:memory_game/logic/values.dart';

class StagesManager {
 String respons ="";
 Module module = Module() ;
  StagesModule stagesModule = StagesModule() ;
  void laodnig()async  {
stagesModule.laodnig();
module =stagesModule.dataModule;
  }
}
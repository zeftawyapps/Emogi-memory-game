import 'package:memory_game/logic/mylibs/jsonManger.dart';
 import 'package:memory_game/logic/values.dart';


import 'modulscreateor.dart';

class StagesModule extends Module with JsonManger{
  Cell gamelevle =Cell('gamelevle');
  Cell colomesno =Cell('colomesno');
  Cell cardnum =Cell('cardnum');
  Cell imagelevel =Cell('imagelevel');

  Cell lastitemno =Cell('lastitemno');
  Cell finsed =Cell('finsed');
  Cell images =Cell('images');

  @override
  set tablename(String _tablename) {
    // TODO: implement tablename
    super.tablename = _tablename;
  }

  StagesModule(){
    tablename = 'stages';
  }
  List <String >ss =[];

  void laodnig()async  {
String     respons = await  readFile(filesDire, filename);
getDataModule(  readdata(tablename, respons));
getDataTable(datamodule);

  }
}

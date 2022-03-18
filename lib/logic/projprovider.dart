import 'package:flutter/cupertino.dart';

class ProjectProvider extends ChangeNotifier{
  bool iscardrotated = false;
  void setiscardrotated(bool iscard){
    iscardrotated = iscard  ;
    notifyListeners();
  }

}
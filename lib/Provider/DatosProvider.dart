import 'package:flutter/cupertino.dart';

class DatosProvider with ChangeNotifier{
  List _lista;
  List get lista => this._lista; 

  set lista(List lis){
  ///[esta condicion es importante no pregunten por que]
    if(this._lista != lis){
      this._lista = lis;
      notifyListeners();
      print("############");
      print(lis);
    }
  }
}
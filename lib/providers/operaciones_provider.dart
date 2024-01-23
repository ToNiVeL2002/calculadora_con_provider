import 'package:flutter/material.dart';

class OperacionesProvider extends ChangeNotifier {
  String _escrito = '0';

  String get escrito => _escrito;

  set escribiendo ( String x ) {
    _escrito = _escrito+x;

    notifyListeners();
  }

  

}


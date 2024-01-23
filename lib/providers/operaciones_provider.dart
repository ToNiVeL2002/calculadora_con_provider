import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class OperacionesProvider extends ChangeNotifier {
  String _escrito = '';
  String _resultado = '0';

  String get escrito => _escrito;
  
  String get resultado => _resultado;

  set escribiendo ( String x ) {

    switch ( x ) {
      case 'C':
        _escrito = borrar(_escrito);
        notifyListeners();

        break;

      case '=':
        resolver(_escrito);
        notifyListeners();

        break;

      default:
        _escrito = _escrito+x;

        notifyListeners();
    }
    
  }

  String borrar ( String cadena ) {

    String nuevaCadena='';

    if ( cadena != '') {
      nuevaCadena = cadena.substring(0, cadena.length - 1);
    }

    return nuevaCadena;
  }

  void resolver ( String value ) {
    
    double resultado;
    
    Parser parser = Parser();
    Expression exp = parser.parse(value);

    ContextModel contextModel = ContextModel();
    
    resultado = exp.evaluate(EvaluationType.REAL, contextModel);

    _resultado = resultado.toString().toString();
  }

  // String sumar ( String value ) {
  //   List<String> numeros = [];
  //   double resultado=0;

  //   if ( value.contains('+') ) {
  //     numeros = value.split('+');

  //     for (var i = 0; i < numeros.length; i++) {
  //       resultado = resultado + double.parse(numeros[i]);
  //     }
  //   } 

  //   _resultado = resultado.toString();

  //   return _resultado;
  // }

}


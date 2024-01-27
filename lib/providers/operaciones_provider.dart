import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class OperacionesProvider extends ChangeNotifier {
  String _escrito = '';
  String _resultado = '0';
  String _historial1 = '0';
  String _historial2 = '0';
  String _antiguo='';

  bool flag = true;
  bool flagHistorial = true;


  String get escrito => _escrito;
  
  String get resultado => _resultado;
  
  String get historial1 => _historial1;
  String get historial2 => _historial2;

  set escribiendo ( String x ) {

    switch ( x ) {
      case 'C':
        _escrito = borrar(_escrito);
        notifyListeners();

        break;

      case '=':
        resolver(_escrito);
        mostrarHistorial();
        flagHistorial = !flagHistorial;

        notifyListeners();
        break;

      case '.':
        if ( _escrito == '' ){
          _escrito = '0.';
          flag = false;
        }

        if ( flag ) {
          _escrito = _escrito+x;
          flag = false;
          print(flag);
        } 

        notifyListeners();
        break;

      default:
        if ( x =='-' || x == '/' || x == '+' || x == '*' || x == '%' || x == '=' || x == 'C') {
          flag = true;
        }
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

    if (value == '') {
      value = '0';
    }
    
    Parser parser = Parser();
    Expression exp = parser.parse(value);

    ContextModel contextModel = ContextModel();
    
    resultado = exp.evaluate(EvaluationType.REAL, contextModel);


    _resultado = resultado.toStringAsFixed(2);
  }

  void mostrarHistorial() {
    

    _historial1 = _escrito + ' = ' + _resultado;

    if ( _antiguo != _historial1 ) {
      
      _historial2 = _antiguo;
    }

    _antiguo = _historial1;

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


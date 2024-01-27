import 'package:calculadora_con_provider/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleButton extends StatelessWidget {
  
  const SingleButton({
    super.key, 
    required this.simbolo,  
    required this.isColor, 
    required this.x, 
    required this.y,
  });
  
  final String simbolo;
  final double x, y;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    final operacionesProvider = Provider.of<OperacionesProvider>(context);

    return ElevatedButton(
      
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isColor
          ? Colors.amber
          : const Color.fromRGBO(0, 25, 0, 0.0)
        ),
        fixedSize: MaterialStateProperty.all(Size(x, y))
      ),
      child: Text(
        simbolo,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold
        ),
      ),
      onPressed: () {
        print('Hola soy ${simbolo}');
        operacionesProvider.escribiendo = simbolo;
      }, 
    );
  }
}
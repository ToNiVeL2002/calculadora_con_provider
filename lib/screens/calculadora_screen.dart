import 'package:calculadora_con_provider/providers/providers.dart';
import 'package:calculadora_con_provider/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculadoraScreen extends StatelessWidget {
   
  const CalculadoraScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final operacionesProvider = Provider.of<OperacionesProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // FONDO
          const Background(),

          // Ver numeros

          // Botones
          Align(
            alignment: Alignment.bottomCenter,
            child: _ButtonBoard(),
          ),

          Align(
            alignment: Alignment.topRight,
            child: _Resultado( escribiendo: operacionesProvider.escrito, ),
          )
        ],
      )
    );
  }
}

class _Resultado extends StatelessWidget {
  _Resultado({
    super.key, 
    required this.escribiendo,
  });

  String escribiendo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50,),
    
        Text(
          escribiendo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 65,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}

class _ButtonBoard extends StatelessWidget {
   const _ButtonBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    
    double largo = screen.width*0.184;
    double alto  = screen.width*0.184;


    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10, right: 5, left: 5),
      // width: screen.width/0.1,
      height: screen.height/2.25,
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SingleButton(simbolo: '7', isColor: false, x: largo, y: alto,),
              _SingleButton(simbolo: '8',  isColor: false, x: largo, y: alto,),
              _SingleButton(simbolo: '9',  isColor: false, x: largo, y: alto,),
              _SingleButton(simbolo: '-',  isColor: true, x: largo, y: alto,),
              _SingleButton(simbolo: '/',  isColor: true, x: largo, y: alto,),
            ],
          ),

          const SizedBox(height: 20,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _SingleButton(simbolo: '4', isColor: false, x: largo, y: alto,),
                  const SizedBox(height: 20,),
                  _SingleButton(simbolo: '1', isColor: false, x: largo, y: alto,)
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SingleButton(simbolo: '5', isColor: false, x: largo, y: alto,),
                  const SizedBox(height: 20,),
                  _SingleButton(simbolo: '2', isColor: false, x: largo, y: alto,)
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SingleButton(simbolo: '6', isColor: false, x: largo, y: alto),
                  const SizedBox(height: 20,),
                  _SingleButton(simbolo: '3', isColor: false, x: largo, y: alto)
                ],
              ),

              Column(
                children: [
                  _SingleButton(simbolo: '+', isColor: true, x: largo, y: alto*2.3)
                ],
              ),

              Column(
                children: [
                  _SingleButton(simbolo: 'x', isColor: true, x: largo, y: alto),
                  const SizedBox(height: 20,),
                  _SingleButton(simbolo: '%', isColor: true, x: largo, y: alto)
                ],
              )
            ],
          ),

          const SizedBox(height: 20,),

          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SingleButton(simbolo: '0', isColor: false, x: largo, y: alto),
              _SingleButton(simbolo: '.', isColor: false, x: largo, y: alto),
              _SingleButton(simbolo: 'C', isColor: false, x: largo, y: alto),
              _SingleButton(simbolo: '=', isColor: true, x: largo*2.1, y: alto)
            ],
          )
        ],
      ),
    );
  }
}

class _SingleButton extends StatelessWidget {
  
  const _SingleButton({
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
      onPressed: () {
        print('Hola soy ${simbolo}');

        operacionesProvider.escribiendo = simbolo;

      }, 
      child: Text(
        simbolo,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}
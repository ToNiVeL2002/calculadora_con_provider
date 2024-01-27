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

          // OPERACION 
          Align(
            alignment: Alignment.topRight,
            child: _Operacion( escribiendo: operacionesProvider.escrito),
          ),

          // HISTORIAL
          Align(
            alignment: Alignment.topLeft,
            child: _Historial( historial1: operacionesProvider.historial1, historial2: operacionesProvider.historial2,),
          ),

          // RESULTADO
          Align(
            alignment: Alignment.centerLeft,
            child: _Resultado( resultado: operacionesProvider.resultado,  ),
          ),

          // Botones
          const Align(
            alignment: Alignment.bottomCenter,
            child: _ButtonBoard(),
          ),
          
        ],
      )
    );
  }
}

class _Historial extends StatelessWidget {
  _Historial({
    super.key,
    required this.historial1,
    required this.historial2,
  });

  String historial1, historial2;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox( height: screen.width*0.4,),
          Text(
              historial1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.normal
              ),
            ),

          SizedBox( height: 20, ),
          Text(
              historial2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.normal
              ),
            ),
        ],
      ),
    );
  }
}

class _Resultado extends StatelessWidget {
  _Resultado({
    super.key, 
    required this.resultado,
  });

  String resultado;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '= $resultado',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 60,
        ),
      ),
    );
  }
}

class _Operacion extends StatelessWidget {
  _Operacion({
    super.key, 
    required this.escribiendo,
  });

  String escribiendo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 50,),
      
          Text(
            escribiendo == ''
            ? '0'
            : escribiendo ,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 65,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
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
              SingleButton(simbolo: '7', isColor: false, x: largo, y: alto,),
              SingleButton(simbolo: '8',  isColor: false, x: largo, y: alto,),
              SingleButton(simbolo: '9',  isColor: false, x: largo, y: alto,),
              SingleButton(simbolo: '-',  isColor: true, x: largo, y: alto,),
              SingleButton(simbolo: '/',  isColor: true, x: largo, y: alto,),
            ],
          ),

          const SizedBox(height: 20,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SingleButton(simbolo: '4', isColor: false, x: largo, y: alto,),
                  const SizedBox(height: 20,),
                  SingleButton(simbolo: '1', isColor: false, x: largo, y: alto,)
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleButton(simbolo: '5', isColor: false, x: largo, y: alto,),
                  const SizedBox(height: 20,),
                  SingleButton(simbolo: '2', isColor: false, x: largo, y: alto,)
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleButton(simbolo: '6', isColor: false, x: largo, y: alto),
                  const SizedBox(height: 20,),
                  SingleButton(simbolo: '3', isColor: false, x: largo, y: alto)
                ],
              ),

              Column(
                children: [
                  SingleButton(simbolo: '+', isColor: true, x: largo, y: alto*2.3)
                ],
              ),

              Column(
                children: [
                  SingleButton(simbolo: '*', isColor: true, x: largo, y: alto),
                  const SizedBox(height: 20,),
                  SingleButton(simbolo: '%', isColor: true, x: largo, y: alto)
                ],
              )
            ],
          ),

          const SizedBox(height: 20,),

          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleButton(simbolo: '0', isColor: false, x: largo, y: alto),
              SingleButton(simbolo: '.', isColor: false, x: largo, y: alto),
              SingleButton(simbolo: 'C', isColor: false, x: largo, y: alto),
              SingleButton(simbolo: '=', isColor: true, x: largo*2.1, y: alto)
            ],
          )
        ],
      ),
    );
  }
}


import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 100;
  double height = 100;

  Color color = Colors.red;
  double borderRadius = 10.0;


  void changeShape (){
    // Opciones especiales o librerias
    final Random random = Random();
    width = random.nextInt(300) + 120.0;
    height = random.nextInt(200) + 120.0;
    borderRadius = random.nextInt(100) + 20.0;

    // Color aleatorio para el contenedor
    color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );


    setState(() {
    },);


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          // Efecto rebote
          curve: Curves.elasticOut,
          width: width <= 0 ? 0:width,
          height: height <= 0 ? 0:width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Porque puedo llamar a una funcion sin parametros, no hay cantidad de argumentos, entonces puedo enviar la funcion directamente
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ) ,
    );
  }
}
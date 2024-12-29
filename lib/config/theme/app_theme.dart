import 'package:flutter/material.dart';

const colorList = [
  Colors.deepPurple,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.red,
];


class AppTheme {
  final int selectedColor; //Indice de la lista de colores

  AppTheme({this.selectedColor = 0}):assert(selectedColor >= 0, 'Selected color must be greater then 0'),
  assert(selectedColor < colorList.length, 'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: colorList[selectedColor], //Seleccion del color mediante selectedColor
    ),
    useMaterial3: true,
  );
}

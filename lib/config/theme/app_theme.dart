import 'package:flutter/material.dart';

const Color _customColor = Color( 0xFF5C11D4 );

const List<Color> _colorsThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.purple,
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor=0
  }) : assert(selectedColor>=0, 'Colors must be greater than 0'),
       assert(selectedColor< _colorsThemes.length, 'Colors must be less or equal than ${_colorsThemes.length-1}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsThemes[selectedColor],
    );
  }
}
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit()
      : super(
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));

  void changeColorOnClick() =>
      emit(Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));

  void changeColorOnHover(double x, double y, double height, double width) =>
      emit(Color.fromARGB(
          255, (x / width * 255).round(), (y / height * 255).round(), 150));
}

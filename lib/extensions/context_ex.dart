import 'package:flutter/material.dart';

extension ContextEx on BuildContext{

  double get widthScreen => MediaQuery.sizeOf(this).width;

  double get heightScreen => MediaQuery.sizeOf(this).height;
}
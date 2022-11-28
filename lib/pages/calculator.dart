import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';

double calculateBMI(int height, int weight) {
  return 703 * (weight / pow(height, 2));
}



// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> getUserNutritionsAction(List<UploadImgRow> listOfMeals) async {
  if (listOfMeals.isEmpty)
    return {
      'totalCalories': 0,
      'totalFat': 0,
      'totalCarbs': 0,
      'totalProteins': 0,
    };

  double totalCalories = 0;
  double totalFat = 0;
  double totalCarbs = 0;
  double totalProteins = 0;

  for (var meal in listOfMeals) {
    totalCalories += double.parse(meal.caloriesPrediction ?? '0');
    totalFat += double.parse(meal.fatPrediction ?? '0');
    totalCarbs += double.parse(meal.carbsPrediction ?? '0');
    totalProteins += double.parse(meal.proteinPrediction ?? '0');
  }

  final result = {
    'totalCalories': totalCalories,
    'totalFat': totalFat,
    'totalCarbs': totalCarbs,
    'totalProteins': totalProteins,
  };

  return result;
}

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

import 'package:intl/intl.dart';

Future<double> testLeft(BuildContext context, int calorieCalc, double predCalo,
    double caloLeft) async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) {
    throw Exception("User must be authenticated.");
  }

  double updatedCaloriesLeft;

  if (caloLeft == calorieCalc.toDouble()) {
    updatedCaloriesLeft = (calorieCalc.toDouble() - predCalo);
  } else {
    updatedCaloriesLeft = (caloLeft.toDouble() - predCalo);
  }

  // Normalize progress
  double progress = updatedCaloriesLeft / calorieCalc.toDouble();
  progress = progress.clamp(0.0, 1.0); // Ensure it's between 0 and 1

  print('Updated Calories Left: $updatedCaloriesLeft, Progress: $progress');

  // Update App State
  FFAppState().update(() {
    FFAppState().ProgessLeft = progress;
  });

  return updatedCaloriesLeft;
}

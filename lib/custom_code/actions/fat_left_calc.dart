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

Future<double> fatLeftCalc(
    BuildContext context, int fatCalc, double predFat, double fatLeft) async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) {
    throw Exception("User must be authenticated.");
  }

  double updatedFatLeft;

  if (fatLeft == fatCalc.toDouble()) {
    updatedFatLeft = (fatCalc.toDouble() - predFat);
  } else {
    updatedFatLeft = (fatLeft.toDouble() - predFat);
  }

  // Normalize progress
  double progress = updatedFatLeft / fatCalc.toDouble();
  progress = progress.clamp(0.0, 1.0); // Ensure it's between 0 and 1

  print('Updated Calories Left: $updatedFatLeft, Progress: $progress');

  // Update App State
  FFAppState().update(() {
    FFAppState().ProgressLeftFat = progress;
  });

  return updatedFatLeft;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

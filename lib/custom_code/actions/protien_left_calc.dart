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

Future<double> protienLeftCalc(BuildContext context, int protCalc,
    double predProt, double protLeft) async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) {
    throw Exception("User must be authenticated.");
  }

  double updatedProtienLeft;

  if (protLeft == protCalc.toDouble()) {
    updatedProtienLeft = (protCalc.toDouble() - predProt);
  } else {
    updatedProtienLeft = (protLeft.toDouble() - predProt);
  }

  // Normalize progress
  double progress = updatedProtienLeft / protCalc.toDouble();
  progress = progress.clamp(0.0, 1.0); // Ensure it's between 0 and 1

  print('Updated Calories Left: $updatedProtienLeft, Progress: $progress');

  // Update App State
  FFAppState().update(() {
    FFAppState().ProgressLeftProtien = progress;
  });

  return updatedProtienLeft;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

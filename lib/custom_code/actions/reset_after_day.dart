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

Future<double> resetAfterDay(BuildContext context, int calorieCalc,
    double predCalo, double caloLeft) async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) {
    throw Exception("User must be authenticated.");
  }

  // Get today's date as a string in yyyy-MM-dd format
  final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // Fetch the user's latest UpdateDate from upload_img table
  final response = await supabase
      .from('upload_img')
      .select('UpdateDate')
      .eq('uuid', user.id)
      .order('UpdateDate', ascending: false)
      .limit(1)
      .maybeSingle();

  if (response == null || response.isEmpty) {
    throw Exception("UpdateDate not found for user.");
  }

  final updateDateStr = response['UpdateDate'];
  final updateDate =
      DateFormat('yyyy-MM-dd').format(DateTime.parse(updateDateStr));

  // Reset caloLeft if the date has changed
  if (updateDate != today) {
    caloLeft = calorieCalc.toDouble();

    // Update the most recent record's UpdateDate to today
    await supabase
        .from('upload_img')
        .update({'UpdateDate': today})
        .eq('uuid', user.id)
        .eq('UpdateDate', updateDateStr); // ensure correct row
  }

  // Calculate new calories left
  double updatedCaloriesLeft;

  if (caloLeft == calorieCalc.toDouble()) {
    updatedCaloriesLeft = calorieCalc.toDouble() - predCalo;
  } else {
    updatedCaloriesLeft = caloLeft.toDouble() - predCalo;
  }

  // Normalize and clamp progress between 0 and 1
  double progress = updatedCaloriesLeft / calorieCalc.toDouble();
  progress = progress.clamp(0.0, 1.0);

  print('Updated Calories Left: $updatedCaloriesLeft, Progress: $progress');

  // Update app state
  FFAppState().update(() {
    FFAppState().ProgessLeft = progress;
  });

  return updatedCaloriesLeft;
}

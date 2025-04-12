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

// FFAppState().clear(); // Resets entire AppState CAN NOT IN FLUTTERFLOW

Future<void> resetAppStateOnLogout() async {
  FFAppState().update(() {
    FFAppState().ProgessLeft = 1.0; // Reset to full by default
    FFAppState().ProgressLeftFat = 1.0;
    FFAppState().ProgressLeftCarb = 1.0;
    FFAppState().ProgressLeftProtien = 1.0;
    // Or reset based on the new user's calorie goal if needed
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

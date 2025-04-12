import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int calcCaloriesNeeds(
  int weight,
  int height,
  int age,
  String gender,
  String activityLevel,
  String goal,
) {
  double bmr;

  // Calculate BMR based on gender
  if (gender == "Female") {
    bmr = 10 * weight + 6.25 * height - 5 * age - 161; // Female BMR formula
  } else {
    bmr = 10 * weight + 6.25 * height - 5 * age + 5; // Male BMR formula
  }

  // Activity Level Multiplier
  double activityMultiplier;

  switch (activityLevel) {
    case "Sedentary (little/ no exercise)":
      activityMultiplier = 1.2;
      break;
    case "Lightly active (exercise1-3 days/week)":
      activityMultiplier = 1.375;
      break;
    case "Moderately active (exercise 3-5 days week)":
      activityMultiplier = 1.55;
      break;
    case "Very active (exercise 6-7 days/week)":
      activityMultiplier = 1.725;
      break;
    case "Extra active (very intense activity)":
      activityMultiplier = 1.9;
      break;
    default:
      activityMultiplier = 1.2; // Default to Sedentary
  }

  int finaloutput;
  // Calculate Daily Calorie Needs
  int originalNeeds = (bmr * activityMultiplier).round();
  if (goal == "Lose weight") {
    finaloutput = originalNeeds - 500;
  } else if (goal == "Gain weight") {
    finaloutput = originalNeeds + 500;
  } else {
    finaloutput = originalNeeds;
  }

  return finaloutput;
}

int calcProteinNeeds(int caloCalc) {
  int proteinGrams =
      (caloCalc * 0.30 ~/ 4); // Assuming 30% of calories come from protein

  return proteinGrams;
}

int calcCarbNeeds(int caloCalc) {
  int carbGrams =
      (caloCalc * 0.50 ~/ 4); // Assuming 50% of calories come from carbs

  return carbGrams;
}

int calcFatNeeds(int caloCalc) {
  int fatGrams =
      (caloCalc * 0.20 ~/ 9); // Assuming 20% of calories come from fat

  return fatGrams;
}

String getPersonalizedMealAdvice(
  double calories,
  double carbs,
  double fat,
  double protein,
  double dailyCalories,
  double dailyCarbs,
  double dailyFat,
  double dailyProtein,
) {
  double calPercentage = (calories / dailyCalories) * 100;
  double fatPercentage = (fat / dailyFat) * 100;
  double carbsPercentage = (carbs / dailyCarbs) * 100;
  double proteinPercentage = (protein / dailyProtein) * 100;

  List<String> adviceList = [];

  // Calorie-Based Advice
  if (calPercentage > 80) {
    adviceList.add(
        "🚨 This meal is extremely high in calories! Consider adjusting your intake for the rest of the day.");
  } else if (calPercentage < 25) {
    adviceList.add(
        "🍏 This is a light meal! You may need a more substantial meal later to meet your energy needs.");
  }

  // Macronutrient Imbalance Warnings
  if (carbsPercentage > 70 && fatPercentage > 70) {
    adviceList.add("⚠️ High in both carbs and fat!");
  } else if (proteinPercentage > 70 && carbsPercentage < 30) {
    adviceList.add("🍖 High in protein but low in carbs!");
  } else if (fatPercentage > 70 && proteinPercentage < 30) {
    adviceList.add("🥩 High in fat but low in protein!");
  }

  // Individual Macronutrient Advice
  if (fatPercentage > 80) {
    adviceList.add("⚠️ Very high in fat!");
  }

  if (carbsPercentage > 80) {
    adviceList.add("🚨 Extremely high in carbs!");
  }

  if (proteinPercentage > 80) {
    adviceList.add("⚠️ Very high in protein!");
  }

// Balanced Meal Encouragement
  if (calPercentage > 25 &&
      calPercentage < 60 &&
      fatPercentage > 20 &&
      fatPercentage < 50 &&
      carbsPercentage > 20 &&
      carbsPercentage < 50 &&
      proteinPercentage > 20 &&
      proteinPercentage < 50) {
    adviceList.add(
        "✅ Great choice! This meal is well-balanced and supports your nutritional goals.");
  }

  // Join all advice into a single message
  return adviceList.join("\n");
}

String encodeStringWhatsapp(
  String imageUri,
  String predCalories,
  String predCarbs,
  String predFat,
  String predProtien,
) {
  String message =
      'Hey! I found this meal\'s nutritional information by a single click using the So\'orat app! 🍽️\n\n' +
          '📸 Meal Image: ' +
          imageUri +
          '\n\n' +
          'Here’s the nutrition info:\n' +
          '✅ Calories: ' +
          predCalories.substring(0, math.min(5, predCalories.length)) +
          ' cal\n' +
          '🥖 Carbs: ' +
          predCarbs.substring(0, math.min(4, predCarbs.length)) +
          ' g\n' +
          '💪 Protein: ' +
          predProtien.substring(0, math.min(4, predProtien.length)) +
          ' g\n' +
          '🧈 Fat: ' +
          predFat.substring(0, math.min(4, predFat.length)) +
          ' g\n\n' +
          'Check out So\'orat to see nutrition info for your meals! 🚀';

  var encoded = Uri.encodeFull(message);
  return encoded;
}

String encodeStringWhatsapp1(
  String imageUri,
  String predCalories,
  String predCarbs,
  String predFat,
  String predProtein,
) {
  String message =
      'Hey! I found this meal\'s nutritional information by a single click using the So\'orat app! 🍽️\n\n' +
          '📸 Meal Image: ' +
          imageUri +
          '\n\n' +
          'Here’s the nutrition info:\n' +
          '✅ Calories: ' +
          predCalories +
          ' cal\n' +
          '🥖 Carbs: ' +
          predCarbs +
          ' g\n' +
          '💪 Protein: ' +
          predProtein +
          ' g\n' +
          '🛢️ Fat: ' +
          predFat +
          ' g\n\n' +
          'Check out So\'orat to see nutrition info for your meals! 🚀';

  return message; // No encoding
}

String decodeLanguageText(String text) {
  return utf8.decode(text.runes.toList());
}

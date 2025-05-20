import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UploadImageAndGetNutritionCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UploadImageAndGetNutrition',
      apiUrl: 'https://sooratmodel1-production.up.railway.app/models/direct',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? protein(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.protein''',
      ));
  static double? fat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.fat''',
      ));
  static double? carbs(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.carbs''',
      ));
  static double? calories(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.calories''',
      ));
  static double? mass(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.mass''',
      ));
}

class OpenAICallCall {
  static Future<ApiCallResponse> call({
    int? dailyCalories,
    int? dailyCarbs,
    int? dailyFat,
    int? dailyProtein,
    double? leftCalories,
    double? leftCarbs,
    double? leftFat,
    double? leftProtein,
    double? mealCalories,
    double? mealCarbs,
    double? mealFat,
    double? mealProtein,
    String? lang = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-4o-mini",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful AI that provides concise and practical nutrition advice based on daily intake and meal details."
    },
    {
      "role": "user",
      "content": "Give me an advice or suggestion in ${escapeStringForJson(lang)} language that suits me in a single small line. My daily calories are ${dailyCalories}, my daily protein intake is ${dailyProtein},my daily fat intake is ${dailyFat},my daily carbs intake is ${dailyCarbs}.What is left from my total needs are ${leftCalories}cal,${leftProtein}protein, ${leftFat}fat, ${leftCarbs}carb.I am eating a meal with ${mealCalories}cal,${mealProtein}g protein,${mealFat}g fat,${mealCarbs}g carbs."
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'openAICall',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? openAIMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

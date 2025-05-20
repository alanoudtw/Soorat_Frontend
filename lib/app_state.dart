import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _weight = prefs.getInt('ff_weight') ?? _weight;
    });
    _safeInit(() {
      _height = prefs.getInt('ff_height') ?? _height;
    });
    _safeInit(() {
      _age = prefs.getInt('ff_age') ?? _age;
    });
    _safeInit(() {
      _gender = prefs.getString('ff_gender') ?? _gender;
    });
    _safeInit(() {
      _goal = prefs.getString('ff_goal') ?? _goal;
    });
    _safeInit(() {
      _upoadedimage = prefs.getString('ff_upoadedimage') ?? _upoadedimage;
    });
    _safeInit(() {
      _uploadedimage = prefs.getString('ff_uploadedimage') ?? _uploadedimage;
    });
    _safeInit(() {
      _ActivityLevel = prefs.getString('ff_ActivityLevel') ?? _ActivityLevel;
    });
    _safeInit(() {
      _CalorieNeeded = prefs.getInt('ff_CalorieNeeded') ?? _CalorieNeeded;
    });
    _safeInit(() {
      _CaloriesLeft = prefs.getDouble('ff_CaloriesLeft') ?? _CaloriesLeft;
    });
    _safeInit(() {
      _ProtienLeft = prefs.getDouble('ff_ProtienLeft') ?? _ProtienLeft;
    });
    _safeInit(() {
      _CarbsLeft = prefs.getDouble('ff_CarbsLeft') ?? _CarbsLeft;
    });
    _safeInit(() {
      _FatLeft = prefs.getDouble('ff_FatLeft') ?? _FatLeft;
    });
    _safeInit(() {
      _ProtienNeeded = prefs.getInt('ff_ProtienNeeded') ?? _ProtienNeeded;
    });
    _safeInit(() {
      _CarbsNeeded = prefs.getInt('ff_CarbsNeeded') ?? _CarbsNeeded;
    });
    _safeInit(() {
      _FatNeeded = prefs.getInt('ff_FatNeeded') ?? _FatNeeded;
    });
    _safeInit(() {
      _ProgessLeft = prefs.getDouble('ff_ProgessLeft') ?? _ProgessLeft;
    });
    _safeInit(() {
      _ProgressLeftCarb =
          prefs.getDouble('ff_ProgressLeftCarb') ?? _ProgressLeftCarb;
    });
    _safeInit(() {
      _ProgressLeftFat =
          prefs.getDouble('ff_ProgressLeftFat') ?? _ProgressLeftFat;
    });
    _safeInit(() {
      _ProgressLeftProtien =
          prefs.getDouble('ff_ProgressLeftProtien') ?? _ProgressLeftProtien;
    });
    _safeInit(() {
      _mealAdvise = prefs.getString('ff_mealAdvise') ?? _mealAdvise;
    });
    _safeInit(() {
      _imageWhatsapp = prefs.getString('ff_imageWhatsapp') ?? _imageWhatsapp;
    });
    _safeInit(() {
      _caloriesWhatsapp =
          prefs.getString('ff_caloriesWhatsapp') ?? _caloriesWhatsapp;
    });
    _safeInit(() {
      _fatWhatsapp = prefs.getString('ff_fatWhatsapp') ?? _fatWhatsapp;
    });
    _safeInit(() {
      _proteinWhatsapp =
          prefs.getString('ff_proteinWhatsapp') ?? _proteinWhatsapp;
    });
    _safeInit(() {
      _carbsWhatsapp = prefs.getString('ff_carbsWhatsapp') ?? _carbsWhatsapp;
    });
    _safeInit(() {
      _AdviseOpenAI = prefs.getString('ff_AdviseOpenAI') ?? _AdviseOpenAI;
    });
    _safeInit(() {
      _selectedLanguage =
          prefs.getString('ff_selectedLanguage') ?? _selectedLanguage;
    });
    _safeInit(() {
      _listOfMeals = prefs.getStringList('ff_listOfMeals')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _listOfMeals;
    });
    _safeInit(() {
      _CaloriesUsed = prefs.getDouble('ff_CaloriesUsed') ?? _CaloriesUsed;
    });
    _safeInit(() {
      _CarbsUsed = prefs.getDouble('ff_CarbsUsed') ?? _CarbsUsed;
    });
    _safeInit(() {
      _FatUsed = prefs.getDouble('ff_FatUsed') ?? _FatUsed;
    });
    _safeInit(() {
      _ProtainsUsed = prefs.getDouble('ff_ProtainsUsed') ?? _ProtainsUsed;
    });
    _safeInit(() {
      _dateOfBirthT = prefs.containsKey('ff_dateOfBirthT')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_dateOfBirthT')!)
          : _dateOfBirthT;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _weight = 0;
  int get weight => _weight;
  set weight(int value) {
    _weight = value;
    prefs.setInt('ff_weight', value);
  }

  bool _makePhoto = false;
  bool get makePhoto => _makePhoto;
  set makePhoto(bool value) {
    _makePhoto = value;
  }

  String _fileBase64 = '';
  String get fileBase64 => _fileBase64;
  set fileBase64(String value) {
    _fileBase64 = value;
  }

  int _height = 0;
  int get height => _height;
  set height(int value) {
    _height = value;
    prefs.setInt('ff_height', value);
  }

  int _age = 0;
  int get age => _age;
  set age(int value) {
    _age = value;
    prefs.setInt('ff_age', value);
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    prefs.setString('ff_gender', value);
  }

  String _goal = '';
  String get goal => _goal;
  set goal(String value) {
    _goal = value;
    prefs.setString('ff_goal', value);
  }

  dynamic _predictions;
  dynamic get predictions => _predictions;
  set predictions(dynamic value) {
    _predictions = value;
  }

  dynamic _products1;
  dynamic get products1 => _products1;
  set products1(dynamic value) {
    _products1 = value;
  }

  String _upoadedimage = '';
  String get upoadedimage => _upoadedimage;
  set upoadedimage(String value) {
    _upoadedimage = value;
    prefs.setString('ff_upoadedimage', value);
  }

  String _uploadedimage = '';
  String get uploadedimage => _uploadedimage;
  set uploadedimage(String value) {
    _uploadedimage = value;
    prefs.setString('ff_uploadedimage', value);
  }

  List<dynamic> _ShowData = [];
  List<dynamic> get ShowData => _ShowData;
  set ShowData(List<dynamic> value) {
    _ShowData = value;
  }

  void addToShowData(dynamic value) {
    ShowData.add(value);
  }

  void removeFromShowData(dynamic value) {
    ShowData.remove(value);
  }

  void removeAtIndexFromShowData(int index) {
    ShowData.removeAt(index);
  }

  void updateShowDataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    ShowData[index] = updateFn(_ShowData[index]);
  }

  void insertAtIndexInShowData(int index, dynamic value) {
    ShowData.insert(index, value);
  }

  String _ActivityLevel = '';
  String get ActivityLevel => _ActivityLevel;
  set ActivityLevel(String value) {
    _ActivityLevel = value;
    prefs.setString('ff_ActivityLevel', value);
  }

  int _CalorieNeeded = 0;
  int get CalorieNeeded => _CalorieNeeded;
  set CalorieNeeded(int value) {
    _CalorieNeeded = value;
    prefs.setInt('ff_CalorieNeeded', value);
  }

  String _currentDate = '';
  String get currentDate => _currentDate;
  set currentDate(String value) {
    _currentDate = value;
  }

  double _CaloriesLeft = 0.0;
  double get CaloriesLeft => _CaloriesLeft;
  set CaloriesLeft(double value) {
    _CaloriesLeft = value;
    prefs.setDouble('ff_CaloriesLeft', value);
  }

  double _ProtienLeft = 0.0;
  double get ProtienLeft => _ProtienLeft;
  set ProtienLeft(double value) {
    _ProtienLeft = value;
    prefs.setDouble('ff_ProtienLeft', value);
  }

  double _CarbsLeft = 0.0;
  double get CarbsLeft => _CarbsLeft;
  set CarbsLeft(double value) {
    _CarbsLeft = value;
    prefs.setDouble('ff_CarbsLeft', value);
  }

  double _FatLeft = 0.0;
  double get FatLeft => _FatLeft;
  set FatLeft(double value) {
    _FatLeft = value;
    prefs.setDouble('ff_FatLeft', value);
  }

  int _ProtienNeeded = 0;
  int get ProtienNeeded => _ProtienNeeded;
  set ProtienNeeded(int value) {
    _ProtienNeeded = value;
    prefs.setInt('ff_ProtienNeeded', value);
  }

  int _CarbsNeeded = 0;
  int get CarbsNeeded => _CarbsNeeded;
  set CarbsNeeded(int value) {
    _CarbsNeeded = value;
    prefs.setInt('ff_CarbsNeeded', value);
  }

  int _FatNeeded = 0;
  int get FatNeeded => _FatNeeded;
  set FatNeeded(int value) {
    _FatNeeded = value;
    prefs.setInt('ff_FatNeeded', value);
  }

  double _ProgessLeft = 0.0;
  double get ProgessLeft => _ProgessLeft;
  set ProgessLeft(double value) {
    _ProgessLeft = value;
    prefs.setDouble('ff_ProgessLeft', value);
  }

  double _ProgressLeftCarb = 0.0;
  double get ProgressLeftCarb => _ProgressLeftCarb;
  set ProgressLeftCarb(double value) {
    _ProgressLeftCarb = value;
    prefs.setDouble('ff_ProgressLeftCarb', value);
  }

  double _ProgressLeftFat = 0.0;
  double get ProgressLeftFat => _ProgressLeftFat;
  set ProgressLeftFat(double value) {
    _ProgressLeftFat = value;
    prefs.setDouble('ff_ProgressLeftFat', value);
  }

  double _ProgressLeftProtien = 0.0;
  double get ProgressLeftProtien => _ProgressLeftProtien;
  set ProgressLeftProtien(double value) {
    _ProgressLeftProtien = value;
    prefs.setDouble('ff_ProgressLeftProtien', value);
  }

  String _mealAdvise = '';
  String get mealAdvise => _mealAdvise;
  set mealAdvise(String value) {
    _mealAdvise = value;
    prefs.setString('ff_mealAdvise', value);
  }

  String _imageWhatsapp = '';
  String get imageWhatsapp => _imageWhatsapp;
  set imageWhatsapp(String value) {
    _imageWhatsapp = value;
    prefs.setString('ff_imageWhatsapp', value);
  }

  String _caloriesWhatsapp = '';
  String get caloriesWhatsapp => _caloriesWhatsapp;
  set caloriesWhatsapp(String value) {
    _caloriesWhatsapp = value;
    prefs.setString('ff_caloriesWhatsapp', value);
  }

  String _fatWhatsapp = '';
  String get fatWhatsapp => _fatWhatsapp;
  set fatWhatsapp(String value) {
    _fatWhatsapp = value;
    prefs.setString('ff_fatWhatsapp', value);
  }

  String _proteinWhatsapp = '';
  String get proteinWhatsapp => _proteinWhatsapp;
  set proteinWhatsapp(String value) {
    _proteinWhatsapp = value;
    prefs.setString('ff_proteinWhatsapp', value);
  }

  String _carbsWhatsapp = '';
  String get carbsWhatsapp => _carbsWhatsapp;
  set carbsWhatsapp(String value) {
    _carbsWhatsapp = value;
    prefs.setString('ff_carbsWhatsapp', value);
  }

  int _predictionid = 0;
  int get predictionid => _predictionid;
  set predictionid(int value) {
    _predictionid = value;
  }

  String _AdviseOpenAI = '';
  String get AdviseOpenAI => _AdviseOpenAI;
  set AdviseOpenAI(String value) {
    _AdviseOpenAI = value;
    prefs.setString('ff_AdviseOpenAI', value);
  }

  String _selectedLanguage = 'English';
  String get selectedLanguage => _selectedLanguage;
  set selectedLanguage(String value) {
    _selectedLanguage = value;
    prefs.setString('ff_selectedLanguage', value);
  }

  List<dynamic> _listOfMeals = [];
  List<dynamic> get listOfMeals => _listOfMeals;
  set listOfMeals(List<dynamic> value) {
    _listOfMeals = value;
    prefs.setStringList(
        'ff_listOfMeals', value.map((x) => jsonEncode(x)).toList());
  }

  void addToListOfMeals(dynamic value) {
    listOfMeals.add(value);
    prefs.setStringList(
        'ff_listOfMeals', _listOfMeals.map((x) => jsonEncode(x)).toList());
  }

  void removeFromListOfMeals(dynamic value) {
    listOfMeals.remove(value);
    prefs.setStringList(
        'ff_listOfMeals', _listOfMeals.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromListOfMeals(int index) {
    listOfMeals.removeAt(index);
    prefs.setStringList(
        'ff_listOfMeals', _listOfMeals.map((x) => jsonEncode(x)).toList());
  }

  void updateListOfMealsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    listOfMeals[index] = updateFn(_listOfMeals[index]);
    prefs.setStringList(
        'ff_listOfMeals', _listOfMeals.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInListOfMeals(int index, dynamic value) {
    listOfMeals.insert(index, value);
    prefs.setStringList(
        'ff_listOfMeals', _listOfMeals.map((x) => jsonEncode(x)).toList());
  }

  double _CaloriesUsed = 0.0;
  double get CaloriesUsed => _CaloriesUsed;
  set CaloriesUsed(double value) {
    _CaloriesUsed = value;
    prefs.setDouble('ff_CaloriesUsed', value);
  }

  double _CarbsUsed = 0.0;
  double get CarbsUsed => _CarbsUsed;
  set CarbsUsed(double value) {
    _CarbsUsed = value;
    prefs.setDouble('ff_CarbsUsed', value);
  }

  double _FatUsed = 0.0;
  double get FatUsed => _FatUsed;
  set FatUsed(double value) {
    _FatUsed = value;
    prefs.setDouble('ff_FatUsed', value);
  }

  double _ProtainsUsed = 0.0;
  double get ProtainsUsed => _ProtainsUsed;
  set ProtainsUsed(double value) {
    _ProtainsUsed = value;
    prefs.setDouble('ff_ProtainsUsed', value);
  }

  DateTime? _dateOfBirthT;
  DateTime? get dateOfBirthT => _dateOfBirthT;
  set dateOfBirthT(DateTime? value) {
    _dateOfBirthT = value;
    value != null
        ? prefs.setInt('ff_dateOfBirthT', value.millisecondsSinceEpoch)
        : prefs.remove('ff_dateOfBirthT');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

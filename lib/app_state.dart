import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _CalorieCalc = prefs.getInt('ff_CalorieCalc') ?? _CalorieCalc;
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
      _ProtienCalc = prefs.getInt('ff_ProtienCalc') ?? _ProtienCalc;
    });
    _safeInit(() {
      _CarbsCalc = prefs.getInt('ff_CarbsCalc') ?? _CarbsCalc;
    });
    _safeInit(() {
      _FatCalc = prefs.getInt('ff_FatCalc') ?? _FatCalc;
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

  int _CalorieCalc = 0;
  int get CalorieCalc => _CalorieCalc;
  set CalorieCalc(int value) {
    _CalorieCalc = value;
    prefs.setInt('ff_CalorieCalc', value);
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

  int _ProtienCalc = 0;
  int get ProtienCalc => _ProtienCalc;
  set ProtienCalc(int value) {
    _ProtienCalc = value;
    prefs.setInt('ff_ProtienCalc', value);
  }

  int _CarbsCalc = 0;
  int get CarbsCalc => _CarbsCalc;
  set CarbsCalc(int value) {
    _CarbsCalc = value;
    prefs.setInt('ff_CarbsCalc', value);
  }

  int _FatCalc = 0;
  int get FatCalc => _FatCalc;
  set FatCalc(int value) {
    _FatCalc = value;
    prefs.setInt('ff_FatCalc', value);
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

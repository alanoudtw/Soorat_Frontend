import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'q3_copy_widget.dart' show Q3CopyWidget;
import 'package:flutter/material.dart';

class Q3CopyModel extends FlutterFlowModel<Q3CopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoalRadioButton widget.
  FormFieldController<String>? goalRadioButtonValueController;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get goalRadioButtonValue => goalRadioButtonValueController?.value;
}

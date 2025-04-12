import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'q2_widget.dart' show Q2Widget;
import 'package:flutter/material.dart';

class Q2Model extends FlutterFlowModel<Q2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for GenderRadioButton widget.
  FormFieldController<String>? genderRadioButtonValueController;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ageFocusNode?.dispose();
    ageTextController?.dispose();
  }

  /// Additional helper methods.
  String? get genderRadioButtonValue => genderRadioButtonValueController?.value;
}

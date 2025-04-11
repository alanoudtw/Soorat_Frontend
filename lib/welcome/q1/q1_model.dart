import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'q1_widget.dart' show Q1Widget;
import 'package:flutter/material.dart';

class Q1Model extends FlutterFlowModel<Q1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    weightFocusNode?.dispose();
    weightTextController?.dispose();

    heightFocusNode?.dispose();
    heightTextController?.dispose();
  }
}

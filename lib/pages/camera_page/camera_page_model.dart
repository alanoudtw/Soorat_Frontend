import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'camera_page_widget.dart' show CameraPageWidget;
import 'package:flutter/material.dart';

class CameraPageModel extends FlutterFlowModel<CameraPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UploadImageAndGetNutrition)] action in Button widget.
  ApiCallResponse? predictionResult;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UploadImgRow? predictionId;
  // Stores action output result for [Custom Action - testLeft] action in Button widget.
  double? outputleft;
  // Stores action output result for [Custom Action - protienLeftCalc] action in Button widget.
  double? protienLeftOutput;
  // Stores action output result for [Custom Action - carbsLeftCalc] action in Button widget.
  double? carbsLeftOutput;
  // Stores action output result for [Custom Action - fatLeftCalc] action in Button widget.
  double? fatLeftOutput;
  // Stores action output result for [Backend Call - API (openAICall)] action in Button widget.
  ApiCallResponse? openAIOutput;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'camera_not_working_widget.dart' show CameraNotWorkingWidget;
import 'package:flutter/material.dart';

class CameraNotWorkingModel extends FlutterFlowModel<CameraNotWorkingWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

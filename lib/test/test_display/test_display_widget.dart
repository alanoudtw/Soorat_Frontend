import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'test_display_model.dart';
export 'test_display_model.dart';

class TestDisplayWidget extends StatefulWidget {
  const TestDisplayWidget({super.key});

  static String routeName = 'testDisplay';
  static String routePath = '/testDisplay';

  @override
  State<TestDisplayWidget> createState() => _TestDisplayWidgetState();
}

class _TestDisplayWidgetState extends State<TestDisplayWidget> {
  late TestDisplayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestDisplayModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [],
          ),
        ),
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'q3_copy_model.dart';
export 'q3_copy_model.dart';

class Q3CopyWidget extends StatefulWidget {
  const Q3CopyWidget({super.key});

  static String routeName = 'q3Copy';
  static String routePath = '/q3Copy';

  @override
  State<Q3CopyWidget> createState() => _Q3CopyWidgetState();
}

class _Q3CopyWidgetState extends State<Q3CopyWidget> {
  late Q3CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Q3CopyModel());

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
        backgroundColor: Color(0xFF3DB549),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'fb7kzkgb' /* Welcome! */,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Work Sans',
                                color: Color(0xFFF1F4F8),
                                fontSize: 36.0,
                                letterSpacing: 0.0,
                                lineHeight: 2.5,
                              ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Container(
                  width: 341.2,
                  height: 417.4,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).info,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '6zninl1p' /* Maintain your calories and sta... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Sora',
                                    color: Color(0xFF3E423A),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 90.0, 0.0, 7.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '5n3tw0tm' /* What is your goal? */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF3E423A),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        FlutterFlowRadioButton(
                          options: [
                            FFLocalizations.of(context).getText(
                              'mmx64kz6' /* Lose weight */,
                            ),
                            FFLocalizations.of(context).getText(
                              'qt993qvp' /* Maintain weight */,
                            ),
                            FFLocalizations.of(context).getText(
                              'd4br984x' /* Gain weight */,
                            )
                          ].toList(),
                          onChanged: (val) => safeSetState(() {}),
                          controller: _model.goalRadioButtonValueController ??=
                              FormFieldController<String>(null),
                          optionHeight: 40.0,
                          optionWidth: 200.0,
                          textStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF3E423A),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor: Color(0xFF3DB549),
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed:
                                      (_model.goalRadioButtonValue == null ||
                                              _model.goalRadioButtonValue == '')
                                          ? null
                                          : () async {
                                              FFAppState().goal =
                                                  _model.goalRadioButtonValue!;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                  SignUpWidget.routeName);
                                            },
                                  text: FFLocalizations.of(context).getText(
                                    '96l53hdj' /* Next */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 121.1,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFB9FF59),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Color(0xFF010101),
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(30.0),
                                    disabledColor: Color(0xFFE3FF8F),
                                    disabledTextColor: Color(0xFF010101),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Container(
                                width: 120.0,
                                child: Slider.adaptive(
                                  activeColor: Color(0xFFB9FF59),
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  min: 0.0,
                                  max: 3.0,
                                  value: _model.sliderValue ??= 3.0,
                                  onChanged: true
                                      ? null
                                      : (newValue) {
                                          newValue = double.parse(
                                              newValue.toStringAsFixed(2));
                                          safeSetState(() =>
                                              _model.sliderValue = newValue);
                                        },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 0.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

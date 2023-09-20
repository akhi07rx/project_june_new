import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
        home: MyApp(),
        ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'MediaQuery Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _MediaQueryWidget(),
      );
}
class _MediaQueryWidget extends StatefulWidget {
  @override
  State createState() => _MediaQueryWidgetState();
}

class _MediaQueryWidgetState extends State<_MediaQueryWidget> {
  late MediaQueryData media;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));

    media = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MediaQuery Widget',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                'Device Info',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _text('Height: ${media.size.height}'),
          _text('Width: ${media.size.width}'),
          _text('Device Pixel Ratio: ${media.devicePixelRatio}'),
          _text('Scale Factor: ${MediaQuery.textScaleFactorOf(context)}'),
          _text('Brightness: ${MediaQuery.platformBrightnessOf(context)}'),
          _text('System View Insets: ${media.viewInsets}'),
          _text('System Padding: ${media.padding}'),
          _text('System View Padding: ${media.viewPadding}'),
          _text('System Gesture Insets: ${media.systemGestureInsets}'),
          _text('Always 24 Hours: ${media.alwaysUse24HourFormat}'),
          _text('Accessible Navigation: ${media.accessibleNavigation}'),
          _text('Inverting Colors: ${media.invertColors}'),
          _text('In High Contrast: ${MediaQuery.highContrastOf(context)}'),
          _text('Disable Animation: ${media.disableAnimations}'),
          _text('In Bold Text: ${MediaQuery.boldTextOverride(context)}'),
          _text('Navigation Mode: ${media.navigationMode}'),
          _text('Orientation: ${media.orientation}'),
        ],
      ),
    );
  }

  /// Text widget
  Widget _text(String text) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
      );
}


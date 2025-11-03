// Axonix App Widget Tests

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:axonix1/main.dart';

void main() {
  testWidgets('App starts with splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AxonixApp());

    // Verify that splash screen loads with Axonix text
    expect(find.text('Axonix'), findsOneWidget);
    expect(find.text('Smart Digital Memory'), findsOneWidget);
  });

  testWidgets('App theme is dark', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const AxonixApp());

    // Get the MaterialApp widget
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    
    // Verify dark theme is applied
    expect(materialApp.theme?.brightness, Brightness.dark);
  });
}

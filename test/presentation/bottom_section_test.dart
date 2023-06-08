import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/presentation/home/home_page.dart';

void main() {
  testWidgets('Search test', (WidgetTester tester) async {
    final textFieldFinder = find.byWidget(const TextField());

    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    await tester.enterText(textFieldFinder, 'Jakarta');
    await tester.pump();

    expect(textFieldFinder, findsOneWidget);
  });
}

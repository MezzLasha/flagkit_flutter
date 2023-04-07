import 'package:flagkit/src/flagkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flagkit/flagkit.dart';

void main() {
  group('Flag', () {
    testWidgets('displays flag for valid country code',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Flag('us'),
        ),
      ));

      final imageFinder = find.byType(Image);

      expect(imageFinder, findsOneWidget);
      expect(tester.widget<Image>(imageFinder).image, isA<AssetImage>());
    });

    testWidgets('displays default flag for invalid country code',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Flag('invalid'),
        ),
      ));

      final imageFinder = find.byType(Image);

      expect(imageFinder, findsOneWidget);
      expect(tester.widget<Image>(imageFinder).image,
          const AssetImage('assets/flags/WW@3x.png'));
    });

    testWidgets('respects size parameter', (WidgetTester tester) async {
      const flagSize = 48.0;

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Flag('us', size: flagSize),
        ),
      ));

      final imageFinder = find.byType(Image);

      expect(imageFinder, findsOneWidget);
      expect(tester.widget<Image>(imageFinder).width, flagSize);
      expect(tester.widget<Image>(imageFinder).height, flagSize);
    });
  });
}

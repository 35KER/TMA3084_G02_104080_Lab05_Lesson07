import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bottom_navigator_bar_lab/main.dart';
import 'package:bottom_navigator_bar_lab/screen1.dart';
import 'package:bottom_navigator_bar_lab/screen2.dart';
import 'package:bottom_navigator_bar_lab/screen3.dart';
import 'package:bottom_navigator_bar_lab/screen4.dart';

void main() {
  testWidgets('Bottom navigation switches between the four screens', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const BottomNavLabApp());

    // Starts on Home (index 0).
    expect(find.byType(Screen1), findsOneWidget);
    expect(find.byType(Screen2), findsNothing);

    // Tap Alarm.
    await tester.tap(find.byIcon(Icons.alarm));
    await tester.pump();
    expect(find.byType(Screen2), findsOneWidget);
    expect(find.byType(Screen1), findsNothing);

    // Tap Business.
    await tester.tap(find.byIcon(Icons.business));
    await tester.pump();
    expect(find.byType(Screen3), findsOneWidget);

    // Tap School.
    await tester.tap(find.byIcon(Icons.school));
    await tester.pump();
    expect(find.byType(Screen4), findsOneWidget);

    // Tap Home again.
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();
    expect(find.byType(Screen1), findsOneWidget);
  });
}

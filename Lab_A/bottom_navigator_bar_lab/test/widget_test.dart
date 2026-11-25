import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:bottom_navigator_bar_lab/main.dart';
import 'package:bottom_navigator_bar_lab/screen1.dart';
import 'package:bottom_navigator_bar_lab/screen2.dart';
import 'package:bottom_navigator_bar_lab/screen3.dart';
import 'package:bottom_navigator_bar_lab/screen4.dart';
import 'package:bottom_navigator_bar_lab/tab_model.dart';

void main() {
  testWidgets('Bottom navigation switches between the four screens', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TabModel(),
        child: const BottomNavLabApp(),
      ),
    );

    expect(find.byType(Screen1), findsOneWidget);
    expect(find.byType(Screen2), findsNothing);

    await tester.tap(find.byIcon(Icons.alarm));
    await tester.pump();
    expect(find.byType(Screen2), findsOneWidget);
    expect(find.byType(Screen1), findsNothing);

    await tester.tap(find.byIcon(Icons.business));
    await tester.pump();
    expect(find.byType(Screen3), findsOneWidget);

    await tester.tap(find.byIcon(Icons.school));
    await tester.pump();
    expect(find.byType(Screen4), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();
    expect(find.byType(Screen1), findsOneWidget);
  });
}

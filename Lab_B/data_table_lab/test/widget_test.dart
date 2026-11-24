import 'package:flutter_test/flutter_test.dart';

import 'package:data_table_lab/main.dart';

void main() {
  testWidgets('DataTable sorts when a column header is tapped', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DataTableLabApp());

    // Vertical position of a text on screen (smaller = higher up).
    double y(String text) => tester.getTopLeft(find.text(text)).dy;

    // Default order: Honda, Toyota, BMW.
    expect(y('Honda') < y('Toyota'), isTrue);
    expect(y('Toyota') < y('BMW'), isTrue);

    // Tap Car Make: ascending A to Z -> BMW, Honda, Toyota.
    await tester.tap(find.text('Car Make'));
    await tester.pumpAndSettle();
    expect(y('BMW') < y('Honda'), isTrue);
    expect(y('Honda') < y('Toyota'), isTrue);

    // Tap Model: ascending -> 2010, 2011, 2021.
    await tester.tap(find.text('Model'));
    await tester.pumpAndSettle();
    expect(y('2010') < y('2011'), isTrue);
    expect(y('2011') < y('2021'), isTrue);

    // Tap Price: ascending -> 6000, 9000, 35000.
    await tester.tap(find.text('Price'));
    await tester.pumpAndSettle();
    expect(y('6000') < y('9000'), isTrue);
    expect(y('9000') < y('35000'), isTrue);

    // Tap Price again: descending -> 35000, 9000, 6000.
    await tester.tap(find.text('Price'));
    await tester.pumpAndSettle();
    expect(y('35000') < y('9000'), isTrue);
    expect(y('9000') < y('6000'), isTrue);
  });
}

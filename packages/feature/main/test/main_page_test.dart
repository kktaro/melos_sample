import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:main/main.dart';
import 'package:ui/widgets.dart';

void main() {
  testWidgets('MainPage launch', (tester) async {
    await tester.pumpMainPage();

    expect(find.text('Main'), findsOneWidget);
    expect(find.text('SUB'), findsOneWidget);
    expect(find.text('ADD'), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.widgetWithText(CountText, '0'), findsOneWidget);
  });

  testWidgets('Increment count', (tester) async {
    await tester.pumpMainPage();
    expect(find.widgetWithText(CountText, '0'), findsOneWidget);
    await tester.tap(find.text('ADD'));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(CountText, '0'), findsNothing);
    expect(find.widgetWithText(CountText, '1'), findsOneWidget);
  });

  testWidgets('Decrement count', (tester) async {
    await tester.pumpMainPage();
    expect(find.widgetWithText(CountText, '0'), findsOneWidget);

    for (var i = 0; i < 5; i++) {
      await tester.tap(find.text('ADD'));
    }
    await tester.pumpAndSettle();
    expect(find.widgetWithText(CountText, '5'), findsOneWidget);

    for (var i = 0; i < 5; i++) {
      await tester.tap(find.text('SUB'));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(CountText, '${5 - (i + 1)}'), findsOneWidget);
    }
    expect(find.widgetWithText(CountText, '0'), findsOneWidget);

    await tester.tap(find.text('SUB'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(CountText, '0'), findsOneWidget);
  });
}

extension WidgetTesterExtension on WidgetTester {
  Future<void> pumpMainPage() async {
    await pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: MainPage(),
        ),
      ),
    );
  }
}

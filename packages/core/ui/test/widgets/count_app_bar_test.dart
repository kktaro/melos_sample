import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/widgets.dart';

void main() {
  testWidgets('CountAppBar', (tester) async {
    const expectTitle = 'test';

    await tester.pumpWidget(
      const MaterialApp(
        home: CountAppBar(title: expectTitle),
      ),
    );

    expect(find.text(expectTitle), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });
}

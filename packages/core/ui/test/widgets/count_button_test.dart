import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/widgets/count_button.dart';

void main() {
  Future<void> pumpCountButton(
    WidgetTester tester,
    OnCountButton onCountButton,
    IconData iconData,
    String text,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CountButton(
            onCountButton: onCountButton, iconData: iconData, text: text),
      ),
    );
  }

  testWidgets('CountButton View', (tester) async {
    const expectIcon = Icons.alarm;
    const expectText = 'TEST';

    await pumpCountButton(tester, () {}, expectIcon, expectText);

    expect(find.byIcon(expectIcon), findsOneWidget);
    expect(find.text(expectText), findsOneWidget);
  });

  testWidgets('CountButton Tap', (tester) async {
    var tapCount = 0;

    const icon = Icons.abc;
    await pumpCountButton(tester, () => tapCount++, icon, 'test');

    expect(tapCount, 0);
    await tester.tap(find.byIcon(icon));
    expect(tapCount, 1);
  });
}

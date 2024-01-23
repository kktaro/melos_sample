import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/widgets/count_text.dart';

void main() {
  Future<void> pumpCountText(WidgetTester tester, int count) async {
    await tester.pumpWidget(MaterialApp(
      home: CountText(count: count),
    ));
  }

  testWidgets('CountText', (tester) async {
    for (var count in [0, 1, 99999]) {
      await pumpCountText(tester, count);

      expect(find.text(count.toString()), findsOneWidget);

      final textWidget =
          find.text(count.toString()).evaluate().single.widget as Text;
      expect(textWidget.style!.color, Colors.cyanAccent);
    }
  });
}

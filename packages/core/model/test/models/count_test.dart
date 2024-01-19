import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:model/models/count.dart';

void main() {
  group('constructor', () {
    test('正の数のCountはインスタンス化できること', () {
      for (var value in [0, 1]) {
        final count = Count(value);
        expect(count.value, value);
      }
    });
    test('負の数のCountはインスタンス化できないこと', () {
      expect(() => Count(-1), throwsAssertionError);
    });
  });
  group('add', () {
    test('加算したvalueを持つインスタンスを返すこと', () {
      final random = Random();
      List<int> createRandom() => [random.nextInt(100), random.nextInt(100)];
      for (var element in List.generate(100, (index) => createRandom())) {
        final count1 = Count(element[0]);
        final count2 = Count(element[1]);
        final intResult = element[0] + element[1];
        expect(count1 + count2, Count(intResult));
      }
    });
  });

  group('sub', () {
    test('減算したvalueを持つインスタンスを返すこと', () {
      final random = Random();
      List<int> createRandom() => [random.nextInt(50) + 50, random.nextInt(50)];
      for (var element in List.generate(100, (index) => createRandom())) {
        final count1 = Count(element[0]);
        final count2 = Count(element[1]);
        final intResult = element[0] - element[1];
        expect(count1 - count2, Count(intResult));
      }
    });

    test('減算結果が負の場合は0で返却されること', () {
      const count1 = Count(1);
      const count2 = Count(10000);
      expect(count1 - count2, const Count(0));
    });
  });
}

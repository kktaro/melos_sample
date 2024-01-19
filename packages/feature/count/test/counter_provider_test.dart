import 'package:count/counter_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:model/model.dart';
import 'package:testing/riverpod_testing.dart';

void main() {
  void checkInitialValue(Count count) {
    expect(count, const Count(0));
  }

  group('increment', () {
    test('実行ごとにカウントがインクリメントされること', () {
      final container = createContainer();
      final counter = container.read(counterProvider.notifier);
      checkInitialValue(container.read(counterProvider));

      counter.increment();
      expect(container.read(counterProvider), const Count(1));
    });
  });

  group('decrement', () {
    test('実行ごとにカウントがデクリメントされること', () {
      const initialCount = Count(1000);
      final container = createContainer(overrides: [
        counterProvider.overrideWith(() => Counter(initialCount)),
      ]);
      final counter = container.read(counterProvider.notifier);

      expect(container.read(counterProvider), initialCount);
      counter.decrement();
      expect(container.read(counterProvider), initialCount - const Count(1));
    });
  });
}

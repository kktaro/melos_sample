import 'package:model/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  Counter([
    this.initialValue = const Count(0),
  ]);

  final Count initialValue;

  @override
  Count build() {
    return initialValue;
  }

  void increment() {
    _add(1);
  }

  void decrement() {
    _sub(1);
  }

  void _add(int value) {
    final other = Count(value);
    state = state + other;
  }

  void _sub(int value) {
    final other = Count(value);
    state = state - other;
  }
}

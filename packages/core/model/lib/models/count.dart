import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/models/count.freezed.dart';

@freezed
class Count with _$Count {
  const Count._();

  @Assert('value >= 0', 'value require positive number.')
  const factory Count(int value) = _Count;

  operator +(Count other) => Count(value + other.value);
  operator -(Count other) {
    final result = value - other.value;
    if (result < 0) {
      return const Count(0);
    } else {
      return Count(result);
    }
  }
}

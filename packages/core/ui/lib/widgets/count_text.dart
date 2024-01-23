import 'package:flutter/material.dart';

class CountText extends StatelessWidget {
  const CountText({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.displayLarge ?? const TextStyle();

    return Text(
      count.toString(),
      style: style.copyWith(
        color: Colors.cyanAccent,
      ),
    );
  }
}

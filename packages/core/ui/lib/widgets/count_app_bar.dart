import 'package:flutter/material.dart';

class CountAppBar extends StatelessWidget {
  const CountAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}

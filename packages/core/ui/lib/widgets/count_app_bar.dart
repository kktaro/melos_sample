import 'package:flutter/material.dart';

class CountAppBar extends StatelessWidget implements PreferredSizeWidget {
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

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}

import 'package:flutter/material.dart';

typedef OnCountButton = void Function();

class CountButton extends StatelessWidget {
  const CountButton({
    super.key,
    required this.onCountButton,
    required this.iconData,
    required this.text,
  });

  final OnCountButton onCountButton;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onCountButton,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData),
          Text(text),
        ],
      ),
    );
  }
}

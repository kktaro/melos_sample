import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:melos_sample_app/app_route.dart';

void main() {
  runApp(
    const BetterFeedback(
      child: ProviderScope(
        child: AppRoute(),
      ),
    ),
  );
}

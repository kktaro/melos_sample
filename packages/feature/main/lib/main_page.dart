import 'package:download/download.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:count/count.dart';
import 'package:gap/gap.dart';
import 'package:ui/widgets.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider.notifier);
    final countState = ref.watch(counterProvider);

    final downloader = ref.watch(downloaderProvider.notifier);

    submitFeedBack() {
      BetterFeedback.of(context).show((feedback) async {
        await downloader.downloadImage(feedback.screenshot);
        await downloader.downlowdText(feedback.text);
      });
    }

    return Scaffold(
      appBar: const CountAppBar(title: 'Main'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CountText(count: countState.value),
            const Gap(8),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CountButton(
                  onCountButton: counter.decrement,
                  iconData: Icons.remove,
                  text: 'SUB',
                ),
                const Gap(4),
                CountButton(
                  onCountButton: counter.increment,
                  iconData: Icons.add,
                  text: 'ADD',
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: kDebugMode
          ? FloatingActionButton(
              onPressed: submitFeedBack,
              child: const Icon(Icons.bug_report),
            )
          : null,
    );
  }
}

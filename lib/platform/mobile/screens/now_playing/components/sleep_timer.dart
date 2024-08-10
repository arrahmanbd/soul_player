import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/platform/mobile/screens/now_playing/components/sleep_provider.dart';
import 'chip.dart';

class SetTimer extends ConsumerWidget {
  const SetTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> sel = [5, 10, 15, 20, 25, 30, 50, 60, 90, 120, 180, 240];
    final selected = ref.watch(sleepProvider);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 5,
      child: Wrap(
        children: [
          ...sel.map((i) => CustomChips(
                text: i.toString(),
                selected: i == selected,
                onSelect: (bool sel) {
                  ref.read(sleepProvider.notifier).setSleep(i);
                },
              )),
          CustomChips(
            text: 'Off',
            selected: 0 == selected,
            onSelect: (bool sel) {
              //set sleep infinity
              ref.read(sleepProvider.notifier).setSleep(0);
            },
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

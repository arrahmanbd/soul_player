// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/platform/mobile/screens/settings/setting_controller.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Column(
        children: [
          SettingSwitch(
            title: 'Enable Snow Effects',
            subtitle: 'Snow Effect on Album Art',
            switchState: state.particleEffect,
            action: (v) {
              ref.read(settingsProvider.notifier).enableEffects();
            },
          ),
          SettingSwitch(
            title: 'Enable Colorfull Snow',
            subtitle: 'Particle Effect with random Colors',
            switchState: state.randomColor,
            action: (v) {
              ref.read(settingsProvider.notifier).enableRandomColor();
            },
          ),
          SettingSwitch(
            title: 'Enable Classic Controller',
            subtitle: 'Classic Controller',
            switchState: state.classicMediacontroller,
            action: (v) {
              ref.read(settingsProvider.notifier).enableClassicMenu();
            },
          ),
          SettingSwitch(
            title: 'Enable light indicator',
            subtitle: 'Disko Light Indicator',
            switchState: state.lightIndicator,
            action: (v) {
              ref.read(settingsProvider.notifier).enableLightIndicator();
            },
          ),
        ],
      ),
    );
  }
}

class SettingSwitch extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function(bool) action;
  final bool switchState;
  const SettingSwitch({
    super.key,
    required this.title,
    required this.subtitle,
    required this.action,
    required this.switchState,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: // above syntax paste out side of builder
          Transform.scale(
        scale: 1,
        child: Switch(
          onChanged: action,
          value: switchState,
          activeColor: primary,
          activeTrackColor: primary.withOpacity(.35),
          inactiveThumbColor: primary.withOpacity(.50),
          inactiveTrackColor: secondaryDark,
          trackOutlineColor: WidgetStatePropertyAll(primary.withOpacity(.15)),
        ),
      ),
    );
  }
}

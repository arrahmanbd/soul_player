import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Tabs{home,library,settings,}
final tabBarProvider = StateProvider<Tabs>((ref) {
  return Tabs.home;
});
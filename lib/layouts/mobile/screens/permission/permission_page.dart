import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/layouts/mobile/screens/library/providers/permission_provider.dart';
import 'package:yaru/yaru.dart';

class PermissionErrorPage extends StatelessWidget {
  const PermissionErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Permission Error'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Application doesn't have access to the library"),
              const SizedBox(height: 10),
              const YaruLinearProgressIndicator(),
              const SizedBox(height: 20.0),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  return ElevatedButton(
                    onPressed: () => ref
                        .read(permissionProvider.notifier)
                        .check(retry: true),
                    child: const Text("Allow"),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

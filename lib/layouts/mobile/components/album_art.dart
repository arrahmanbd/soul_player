import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaru/widgets.dart';

import '../services/library_provider.dart';

class ArtworkWidget extends ConsumerWidget {
  final int id;

  const ArtworkWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artAsyncValue = ref.watch(artProvider(id));

    return artAsyncValue.when(
      data: (art) {
        if (art == null) {
          return Image.asset('assets/images/thumb.jpg',fit: BoxFit.cover,);
        }
        return Image.memory(art,fit: BoxFit.cover,);
      },
      loading: () => const YaruCircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/platform/mobile/screens/library/widgets/song_list.dart';
import 'package:yaru/widgets.dart';

import 'search_provider.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final searchEC = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(serachProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(90),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(
                          Icons.search,
                          color: wh,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          showCursor: true,
                          controller: searchEC,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                          decoration: const InputDecoration(
                            hintText: 'Search Here',
                            hintStyle: TextStyle(
                              color: wh,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onSubmitted: (x) {
                            ref
                                .read(serachProvider.notifier)
                                .search(searchEC.text);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              color: primary,
                              child: const Icon(
                                Icons.exit_to_app,
                                color: wh,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (result.result.isNotEmpty)
                  Expanded(
                    child: SongTile(
                      media: result.result,
                    ),
                  ),
                if (result.isSearching && result.result.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: YaruLinearProgressIndicator(),
                  ),
                const SizedBox(height: 16.0),
                // Additional search-related UI elements can be added here
              ],
            ),
          ),
        ),
      ),
    );
  }
}

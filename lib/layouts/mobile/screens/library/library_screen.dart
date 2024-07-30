import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/layouts/mobile/screens/library/components/albums.dart';
import 'package:soul_player/layouts/mobile/screens/library/components/folders.dart';
import 'package:soul_player/layouts/mobile/screens/library/providers/library_provider.dart';
import 'package:soul_player/layouts/mobile/screens/library/providers/permission_provider.dart';
import 'package:soul_player/layouts/mobile/screens/permission/permission_page.dart';
import 'package:soul_player/layouts/mobile/screens/library/components/artist.dart';
import 'package:soul_player/layouts/mobile/screens/library/components/allmedia.dart';
import 'package:yaru/widgets.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int id = 0;
  List pages = const [AllMedia(), ArtistScreen(), Albums(), Folders()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryDark,
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          final permission = ref.watch(permissionProvider);
          final scanStatus = ref.watch(libraryProvider);
          if (!permission) {
            return const PermissionErrorPage();
          }
          if (scanStatus.isLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const YaruCircularProgressIndicator(),
                  const SizedBox(height: 8),
                  Text(scanStatus.errorMsg),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    child: const Text('Retry'),
                    onPressed: () {
                      ref.read(libraryProvider.notifier).getAllSongs();
                    },
                  ),
                ],
              ),
            );
          }
          return pages[id];
        },
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 800) {
            return BottomNavigationBar(
              backgroundColor: secondaryDark,
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              selectedIconTheme: const IconThemeData(color: Colors.red),
              showSelectedLabels: false,
              currentIndex: id,
              onTap: (value) {
                setState(() {
                  id = value;
                });
              },
              items:  const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_music),
                  label: 'Library',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Artist',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.album),
                  label: 'Albums',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.folder),
                  label: 'Folders',
                ),
              
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

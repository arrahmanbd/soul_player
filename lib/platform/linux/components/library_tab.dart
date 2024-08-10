import 'package:soul_player/platform/linux/features/folders/folder_tab.dart';
//import 'package:soul_player/pages/playlists/playlist.dart';
import 'package:soul_player/platform/linux/components/all_songs.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

import '../features/artists/all_artist.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          YaruTabBar(
            tabController: tabController,
            tabs: const [
              //  YaruTab(
              //   label: 'PlayList',
              //   icon: Icon(YaruIcons.playlist),
              // ),
              YaruTab(
                label: 'All Music',
                icon: Icon(YaruIcons.music_note),
              ),
              YaruTab(
                label: 'Artists',
                icon: Icon(YaruIcons.music_artist),
              ),
              YaruTab(
                label: 'Folders',
                icon: Icon(YaruIcons.folder),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [

               //PlayLists(),
                ScanAllSongs(),
                //Icon(YaruIcons.game_controller),
                AllArtists(),
                //Icon(YaruIcons.address_book),
                FolderTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

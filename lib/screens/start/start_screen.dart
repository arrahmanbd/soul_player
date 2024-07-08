import 'package:broken_soul/screens/media_player/media_player.dart';
import 'package:broken_soul/screens/player/new.dart';
import 'package:dynamic_background/domain/models/painter_data/prebuilt_painters.dart';
import 'package:dynamic_background/widgets/views/dynamic_bg.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

import '../allsongs/all_songs.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
        body: MediaPlayerSkin()
    //     DynamicBg(
    //   duration: const Duration(seconds: 45),
    //   painterData: PrebuiltPainters.chocolate,
    //   child: Row(
    //     children: [
    //       Container(
    //         width: 400,
    //         color: Colors.black12,
    //         child: const ScanAllSongs(),
    //       ).asGlass(),
    //       Expanded(child: PlayerScreen()),
    //     ],
    //   ),
    // ),
    );
  }
}


// {
//   "widgetname":"Column",
//   "alignment": "main.axixAlignme",
//   "child":[
//     "widgetname":"Container",
//   "color": "Colors.blue",
//   "child":[
    
//   ],
//   "widgetname":"Container",
//   "color": "Colors.blue",
//   "child":[
    
//   ]

//   ]
// }
import 'package:flutter/material.dart';
import 'package:soul_player/global/extensions/contex.dart';

import '../widgets/headline.dart';
import '../widgets/song_card.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HeadLine(
          title: 'Recently Played',
          action: () {},
        ),
        SizedBox(
          height: context.sizeHeight * .30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            itemCount: 16,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: const SongCard());
            },
          ),
        ),
      ],
    );
  }
}

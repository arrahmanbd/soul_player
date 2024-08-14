import 'package:flutter/material.dart';
import 'package:soul_player/global/extensions/contex.dart';
import 'package:soul_player/platform/linux/features/widgets/song_card.dart';

import '../widgets/headline.dart';
import '../widgets/search_widget.dart';
import '../widgets/song_tile.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarWidget(),
          //RecentlyPlayed(),
          BottomLayout(),
        ],
      ),
    );
    
  }
}


class BottomLayout extends StatelessWidget {
  const BottomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //on windows is small size
    if (context.sizeWidth <= 1080) {
      return SizedBox(
        height: context.sizeHeight,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadLine(
              title: 'Your Favourites',
              action: () {},
            ),
            Expanded(
              flex: 3,
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
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadLine(
                    title: 'Now Playing',
                    action: () {},
                  ),
                  Expanded(
                    child: ListView.builder(
                      //padding: const EdgeInsets.symmetric(vertical: 10),
                      //shrinkWrap: true,
                      itemCount: 16,
                      itemBuilder: (BuildContext context, int index) {
                        return const SongCardTile();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return SizedBox(
      height: context.sizeHeight * .58,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: context.sizeWidth * .35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadLine(
                  title: 'Your Favourites',
                  action: () {},
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 16,
                      crossAxisCount: 3,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return const SongCard();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: context.sizeWidth * .40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadLine(
                  title: 'Now Playing',
                  action: () {},
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 16,
                      crossAxisCount: 3,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return const SongCard();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
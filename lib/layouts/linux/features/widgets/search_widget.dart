import 'package:flutter/material.dart';
import 'package:soul_player/core/constants/colors.dart';
import 'package:soul_player/global/extensions/contex.dart';
import 'package:soul_player/global/extensions/theme_ext.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: context.sizeWidth*.35,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).surface),
        //borderRadius: BorderRadius.circular(90),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              showCursor: true,
             
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              decoration: const InputDecoration(
                hintText: 'Search Here',
                hintStyle: TextStyle(
                  color: wh,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onSubmitted: (x) {
               
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 5),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(100),
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.pop(context);
          //       },
          //       child: Container(
          //         padding: const EdgeInsets.all(10),
          //         color: primary,
          //         child: const Icon(
          //           Icons.exit_to_app,
          //           color: wh,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

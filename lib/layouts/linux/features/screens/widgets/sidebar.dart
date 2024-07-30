import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: YaruColors.inkstone,
                  height: 2,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(child: Text('Section Info seperated'),);
              },
            );
  }
}


import 'package:flutter/material.dart';
import 'package:hotel/core/design/colors.dart';
import 'package:hotel/core/design/dimensions.dart';

class ContentSector extends StatelessWidget {
  final List<Widget> children;
  final double topPadding;
  final double bottomPadding;
  final Color backgroundColor;

  const ContentSector({
    super.key,
    required this.children,
    this.backgroundColor = whiteColor,
    this.topPadding = height8,
    this.bottomPadding = padding90
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Card(
            clipBehavior: Clip.antiAlias,
            child: Container(
                color: backgroundColor,
                height: double.infinity,
                child: SingleChildScrollView(
                    child: Column(
                        children: children
                    )
                )
            )
        )
    );
  }

}

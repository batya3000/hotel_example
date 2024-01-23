

import 'package:flutter/material.dart';
import 'package:hotel/core/design/dimensions.dart';

class ContentCard extends StatelessWidget {
  final Widget child;
  final double childPadding;


  const ContentCard({
    super.key,
    required this.child,
    this.childPadding = padding16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
            padding: EdgeInsets.all(childPadding),
            child: child,
        ),
      ),
    );
  }

}

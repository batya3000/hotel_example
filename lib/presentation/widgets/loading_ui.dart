

import 'package:flutter/material.dart';
import 'package:hotel/core/design/colors.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/styles.dart';

class LoadingUI extends StatelessWidget {

  const LoadingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 16, left: 16, right: 16),
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Идет загрузка...", style: bodyTextStyle, textAlign: TextAlign.center),
          SizedBox(height: height12),
          CircularProgressIndicator(
            color: blackColor,
          )
        ],
      ),
    );
  }
}